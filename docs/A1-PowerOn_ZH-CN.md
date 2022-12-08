# codepi  

基于树莓派CM4模块的开源工业控制平台 

## A1、电源要求、接口连接、分辨率及IP修改

电源要求：DC24V 1A。  
您收到货后只需要连接DVI或HDMI的显示器，然后连接电源，待开机完成后即可看到DEMO程序界面。  

我们已做好所有设置，关机时可以直接拔掉插头或断开电源，系统会自动切换到UPS供电并开始正常关机流程。  
在关机完成前（大约20秒）若再次上电，将会在走完关机流程后重新开机。  

正常开机后默认进入console界面，您可以用用户名`pi`和密码`pi`登录。  
若您需要desktop和target visu，终端输入sudo raspi-config -> System Options -> Boot/Auto Login -> Desktop autologin，重启即可。  
在使能desktop开机后，您可以将键盘及鼠标连接到USB端口，使用ALT+F4关闭掉Visualization以进入Linux桌面。  
参考下图设置分辨率，默认HDMI及DVI显示大小、位置均相同（重叠显示）。  
![](/docs/images/A1_1.png)  
![](/docs/images/A1_2.png)  
  
</br>
  
我们默认的IP为：  
ETH0：192.168.1.100  
ETH1：192.168.2.100  
您可以手动修改IP地址，目前版本建议手动修改```/etc/dhcpcd.conf```配置文件，否则可能会有路由表的问题：
```
interface eth0
static ip_address=192.168.1.100/24

interface eth1
static ip_address=192.168.2.100/24
```
请注意：多个以太网端口不可以设在同一网段下，否则会引起网络冲突。

[返回上一页](https://github.com/feecat/codepi)
