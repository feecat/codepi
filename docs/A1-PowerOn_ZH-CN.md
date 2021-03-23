# codepi  

基于树莓派CM4模块的开源工业控制平台 

## A1、电源要求、接口连接、分辨率及IP修改

电源要求：DC24V 1A。  
您收到货后只需要连接DVI或HDMI的显示器，然后连接电源，待开机完成后即可看到DEMO程序界面。  

我们已做好所有设置，关机时可以直接拔掉插头或断开电源，系统会自动切换到UPS供电并开始正常关机流程。  
在关机完成前（大约30秒）请勿再次上电，否则系统不会启动。  

在正常开机后，您可以将键盘及鼠标连接到USB端口，使用ALT+F4关闭掉Visualization以进入Linux桌面。  
参考下图设置分辨率，默认HDMI及DVI显示大小、位置均相同（重叠显示）。  
![](/docs/images/A1_1.png)  
![](/docs/images/A1_2.png)  
  
  
我们默认的IP为：  
ETH0：192.168.1.100  
ETH1：DHCP（自动获取）  
同时，两个端口都已启用IPv6，通常情况下您可以直接连接无需设置IP。在某些特殊情况下，您可以手动修改IP地址。如下图：
![](/docs/images/A1_3.png)  
![](/docs/images/A1_4.png)  
请注意：多个以太网端口不可以设在同一网段下，否则会引起网络冲突。

[返回上一页](https://github.com/feecat/codepi)