# codepi  

基于树莓派CM4模块的开源工业控制平台 

## A2、CoDeSys基础、总线拓扑结构

您可以在此查看[CoDeSys常规编程技巧](https://www.codeaw.com/archives/151)  
同时我们十分推荐购买这本书阅读：[开放式控制系统编程技术 基于IEC 61131-3国际标准–马立新，陆国君](https://item.jd.com/12401418.html)  

我们最推荐EtherCAT作为主要总线，Modbus TCP作为备选，推荐选型如下：  

倍福：  
EK1100：EtherCAT总线耦合器  
EL1809：16路数字输入模块  
EL2809：16路数字输出模块  
EL3104：4路0-10v模拟输入模块  
EL4104：4路0-10v模拟输出模块  

艾莫迅：  
ETH-MODBUS-IO8R-A：8入8出开关量，6入1出模拟量带以太网口，同时可以TCP转RTU。  
  
Tips:  
若只用EtherCAT总线，则总线必须挂在ETH0上。  
若使用Modbus TCP总线，则总线可挂在ETH0和ETH1上。  


[返回上一页](https://github.com/feecat/codepi)
