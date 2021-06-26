# codepi  

基于树莓派CM4模块的开源工业控制平台 

## 3、初次上电注意事项、为空的EMMC烧写系统  

您可以在此处下载到最新版官方系统镜像：[https://www.raspberrypi.org/software/operating-systems/#raspberry-pi-os-32-bit](https://www.raspberrypi.org/software/operating-systems/#raspberry-pi-os-32-bit)  
提供的三个系统区别如下：
- **Raspberry Pi OS with desktop and recommended software** 提供桌面界面及常用工具，如libreoffice、常用ide、NODE-RED等。
- **Raspberry Pi OS with desktop** 提供桌面界面及必备工具，如chromium、mousepad等。 
- **Raspberry Pi OS Lite** 不提供桌面界面，最小化的系统，命令行操作。

考虑到工业应用，我们建议下载**Raspberry Pi OS with desktop**。

</br>

下载并解压后，您会得到一个IMG文件，例如2020-12-02-raspios-buster-armhf.img，同时您还要准备以下两个工具：
- [rpiboot](https://github.com/raspberrypi/usbboot/raw/master/win32/rpiboot_setup.exe) ，用于切换到USBBOOT模式并以大容量移动存储模式加载
- 烧录工具，如 [Win32DiskImager](https://sourceforge.net/projects/win32diskimager/) 或 [balenaEtcher](https://www.balena.io/etcher/) 。   

</br>

准备就绪后，按下列步骤操作：  
1、插入CODEPI的MicroUSB接口，确保已插入电脑上（+5v供电，硬件切换到USBBOOT模式）。  
2、连接供电。此时您应该看到蓝色指示灯点亮后瞬间熄灭。  
3、在电脑上运行rpiboot（开始菜单-Raspberry pi-rpiboot）。运行之后此电脑会多一个盘符，此时蓝色指示灯常亮。  
4、使用win32diskimager或balenaEtcher烧写固件，请注意不要选错盘符。  
5、烧录完成后编辑boot盘的config.txt文件，末尾加上```dtoverlay=dwc2,dr_mode=host``` 。  
6、烧录完成后断开主供电，待电源指示灯熄灭后断开MicroUSB。  
7、连接主供电、显示设备和键盘鼠标，等待系统安装完成  

</br>

[返回上一页](https://github.com/feecat/codepi)
