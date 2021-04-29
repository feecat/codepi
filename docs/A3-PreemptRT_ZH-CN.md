# codepi  

基于树莓派CM4模块的开源工业控制平台 

## A3、实时性优化

做运动控制项目时我们经常会提到实时性，那么什么是实时性呢？  
实时性即为每个PLC循环的抖动不能超过一定值，否则运动控制的位置估算会出现偏差，最终造成执行机构振动、精度差。  
在使用x86系统时，我们可以挂载数十个伺服进行插补运动都不会出现问题。但树莓派是基于arm的，本身主频就要低很多，外设还需要占用CPU资源。所以在某些实时性要求较高的应用上，我们推荐对系统做一些优化以达到稳定运行的效果。  

实时性的优化主要分为两个部分：隔离核心和降低占用。  

A：隔离核心  
树莓派CM4一共有4个核心，我们可以将其中某个或者某几个隔离出来给codesys使用，具体方法如下：  
编辑`/boot/cmdline.txt`，在末尾加上` isolcpus=3`。这可以将最后一个核心隔离出来。  
在CoDeSys项目中，创建基于Raspberry Pi MC（树莓派多核）的项目，在Task Configuration中将运动控制相关的Task设置到第3核心即可。  
![](/docs/images/A3_1.png)  
  
B：降低占用  
由于不支持TargetVisu，我们使用的是WebVisu，借用Chromium的kiosk模式全屏显示以达到TargetVisu的效果。  
但在打开瞬间会占用CPU资源，我们可以编辑`/etc/xdg/lxsession/LXDE-pi/autostart`，在最后一句 “chromium-browser...”前加#号并保存，即可禁用Visualization自启动。  

-----------

我们拿一个典型的自动化项目举例，该项目对实时性要求不是特别高（有凸轮，无多轴插补），但要求EtherCAT驱动通讯+Visualization显示+Modbus网关通讯。我们通过以下方式优化实时性：  
  
a) 将PLC中的运行时升级到MultiCore多核版本，并将CoDeSys项目升级到多核版本  
b) 编辑`/boot/cmdline.txt`，在末尾加上`isolcpus=2,3 irqaffinity=0,1 nohz_full=2,3 rcu_nocbs=2,3 nowatchdog acpi_irq_nobalance`以将2、3核心隔离出来，并优化中断占用。  
c) 在codesys中划分核心占用，将运动控制相关的程序划归到`EtherCAT_Task`，并将其划归到核心3上，该核心为实时核心。  
d) 将一般plc逻辑划归到核心2上（如果PLC逻辑不复杂也可以划归到实时任务中）。  
e) 将visualization和modbus划归到核心1或核心0上，此类任务不需要实时，将它们与实时任务分开以避免影响。  

系统运行2小时后，监测到实时任务组抖动在±50us内，可以满足客户需求。  


[返回上一页](https://github.com/feecat/codepi)
