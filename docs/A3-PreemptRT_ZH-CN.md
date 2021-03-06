# codepi  

基于树莓派CM4模块的开源工业控制平台 

## A3、实时性优化

做运动控制项目时我们经常会提到实时性，那么什么是实时性呢？  
实时性即为每个PLC循环的抖动不能超过一定值，否则运动控制的位置估算会出现偏差，最终造成执行机构振动、精度差。  
在使用x86系统时，我们可以挂载数十个伺服进行插补运动都不会出现问题。但树莓派是基于arm的，本身主频就要低很多，外设还需要占用CPU资源。所以在某些实时性要求较高的应用上，我们推荐对系统做一些优化以达到稳定运行的效果。  

实时性的优化主要分为两个部分：隔离核心和降低占用。  

A：优化核心使用  
树莓派CM4一共有4个核心，我们可以将codesys的不同任务组安排到不同核心上，具体方法如下：  
a）将EtherCAT、SoftMotion任务安排到第三核心上。  
b）将普通实时任务安排到第二核心上。  
c）将visu、modbus等非实时任务安排到第一核心上。  
此外，不建议对cpu做隔离（isolcpus），目前已证实会对ethercat通讯造成影响，具体原因未知。  
![](/docs/images/A3_1.png)  
  
B：降低占用  
由于不支持TargetVisu，我们使用的是WebVisu，借用Chromium的kiosk模式全屏显示以达到TargetVisu的效果。  
但在打开瞬间会占用CPU资源，我们可以编辑`/etc/xdg/lxsession/LXDE-pi/autostart`，在最后一句 “chromium-browser...”前加#号并保存，即可禁用Visualization自启动。  

-----------

从理论上说，`isolcpus=3`、`irqaffinity=0`及其它附加参数`nohz_full=3 rcu_nocbs=3 nowatchdog acpi_irq_nobalance`可以获得更好的实时性能，查询系统中断计数可以发现改善。但我们实际测试时发现EtherCAT的丢包率明显变大，并可能导致从站报错。  
我怀疑是由于网卡驱动的中断响应不及时导致，但无法确认问题点。  
目前测试下来在打实时补丁和分配任务的情况下已经可以获得很好的实时性，暂时不去查具体原因。未来更新系统将会进一步测试。  

[返回上一页](https://github.com/feecat/codepi)
