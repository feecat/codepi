# codepi  

基于树莓派CM4模块的开源工业控制平台 

## 1、为什么选择CodePI？有什么优势？ 

树莓派是世界上最流行的单板计算机之一。也由于其使用面广泛，不少定制化设备将它用于设备处理核心使用。  
然而，标准的树莓派温度范围及稳定性达不到工业要求，主要由于以下几个原因：  
- 符合工业规范的MicroSD卡过于昂贵
- 没有UPS，突然断电可能导致MicroSD卡损坏
- MicroHDMI不符合实际应用环境
- 供电方式单一且保护不足

树莓派基金会推出了Compute Module模块用于工业及定制化应用，弥补了标准树莓派的不足。由此衍生了很多相关产品，诸如RevPi、BalenaFin、UniPi、Openembed等等。它们大多都是基于标准树莓派或CM3+的产品，而树莓派最新推出的CM4性能比CM3+几乎高一倍，并且拥有千兆以太网和PCI-E X1接口，这让人很难拒绝升级到最新的系统。  

除此之外，我们在实际应用中发现非常需要UPS功能以防止突然断电，我们将锂电池充放电及电池电源管理集成在我们的产品里。在日常使用中，您无需考虑关机顺序，只需要断开电源，系统会自动执行关机指令并切换到UPS供电，关机完成后自动断开供电。  

以及最重要的一点，我们是开源的。  

## 目标应用  

我们的目标客户是以下几大类：

A：使用CoDeSys平台做PLC开发，使用ETH0挂载EtherCAT/ProfiNET IO或驱动器进行自动化控制。  
- 易于开发，通常开发时间小于两周
- 价格降低70%（相对于倍福CX9020/C6015或x86架构的CoDeSys系统）

</br>

B：使用NODE-RED做工厂自动化（FA）或产线管理系统（PMS）  
- 可用Node-RED快速开发，也可用Python、JS、C等语言自行开发
- 生产批量化的自动化设备

</br>

C：客制化的信息化、测量、工程及安保系统  
- 测量系统的界面显示
- 楼宇自动化

</br>


[返回上一页](https://github.com/feecat/codepi)
