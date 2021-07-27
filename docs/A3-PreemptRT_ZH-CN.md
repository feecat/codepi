# codepi  

基于树莓派CM4模块的开源工业控制平台 

## A3、实时性优化

做运动控制项目时我们经常会提到实时性，那么什么是实时性呢？  
实时性即为每个PLC循环的抖动不能超过一定值，否则运动控制的位置估算会出现偏差，最终造成执行机构振动、精度差。  
在使用x86系统时，我们可以挂载数十个伺服进行插补运动都不会出现问题。但树莓派是基于arm的，本身主频就要低很多，外设还需要占用CPU资源。所以在某些实时性要求较高的应用上，我们推荐对系统做一些优化以达到稳定运行的效果。  

实时性的优化主要分为两个部分：降低占用和程序优化。  

A：降低占用  
由于不支持TargetVisu，我们使用的是WebVisu，借用Chromium的kiosk模式全屏显示以达到TargetVisu的效果。  
但在打开瞬间会占用CPU资源，我们可以编辑`/etc/xdg/lxsession/LXDE-pi/autostart`，在最后一句 “chromium-browser...”前加#号并保存，即可禁用Visualization自启动。在某些极限条件下，建议使用官方的无头系统烧录并按教程设置。  
如果开机时经常遇到总线故障，可以延时启动codesyscontrol或在启动一段时间后将总线自动重启。  
程序中重启总线和轴的代码如下：  
```
IF xResetEtherCAT THEN
	EtherCAT_Master_SoftMotion.xRestart:=TRUE;
	EtherCAT_Master_SoftMotion();
ELSE
	EtherCAT_Master_SoftMotion.xRestart:=FALSE;
	EtherCAT_Master_SoftMotion();
END_IF

IF xResetAxisX THEN
	x.SetCommunicationState(eRequestedState:=2);
END_IF
```


B：程序优化  
**若存在较多总线伺服和IO模块，则建议使用2~4ms的总线及任务周期**。  
树莓派CM4一共有4个核心，我们可以将codesys的不同任务组安排到不同核心上，具体方法如下：  
a）将EtherCAT任务安排到第四个核心上（核心3）。  
b）（可选）将SoftMotion任务安排到第三个核心上（核心2），并编辑所有softmotion相关驱动器的SM_Drive_xxx:I/O Mapping，将Bus Cycle Options改为SM所在TASK。  
c）将普通实时任务安排到第三或第四核心上，依附于EtherCAT或SoftMotion所在任务。  
d）将visu、modbus等非实时任务安排到第一或第二核心上（核心0或核心1）。  
这样做之后，三、四核心所在任务组抖动（jitter）应在±80us内。  

此外，当使用DC（挂载总线伺服，并使用凸轮或cnc功能）时，需编辑EtherCAT Master的隐性参数，通过以下方式变更：  
1、勾选主菜单：Tools -> Options.. -> Device editor -> Show generic device configuration views。  
2、双击EtherCAT_Master_Softmotion设备，转到EtherCAT Parameters选项卡，将DCSyncInWindow修改到500以上即可。还可以根据实际情况使能SplitFrame。  

-----------

从理论上说，`isolcpus=3`、`irqaffinity=0`及其它附加参数`nohz_full=3 rcu_nocbs=3 nowatchdog acpi_irq_nobalance`可以获得更好的实时性能，查询系统中断计数可以发现改善。但我们实际测试时发现EtherCAT的丢包率明显变大，并可能导致从站报错。  
我怀疑是由于网卡驱动的中断响应不及时导致，但无法确认问题点。  
目前测试下来在打实时补丁和分配任务的情况下已经可以获得很好的实时性，暂时不去查具体原因。未来更新系统将会进一步测试。  

[返回上一页](https://github.com/feecat/codepi)
