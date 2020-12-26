# codepi  

基于树莓派CM4模块的开源工业控制平台 

## 5、常见问题  

Q：	为什么不使用poweroff来断开UPS？  
A：	设计目的是为了断电而准备，单独的PLC或运动控制器没有长时间运行的必要。为了防止Linux卡死不能关机导致UPS电量耗尽，规定关机拥有30秒时间，该时间可以通过烧写固件修改。  

Q：	使用多个SoftPLC并连接到DHCP服务器，但DHCP没有正确配置  
A：	删除dhcpid：```sudo rm /etc/dhcpcd.duid ``` 

Q：	如何禁用NTP自动同步  
A：	```sudo timedatectl set-ntp false ``` 

Q：	如何修改或固定视频分辨率及格式  
A：	在终端中输入```sudo arandr```开启配置  
	或参考https://www.raspberrypi.org/documentation/configuration/hdmi-config.md  

Q：	在SoftMotion项目中开机偶尔发生通讯中断  
A：	PLC带负荷时会影响运行周期，您可以禁用visu自启，或在visu自启后将总线重启。  
  
Q：我是新手，如何开始学习CoDeSys？  
A：参阅以下链接  
http://bbs.hicodesys.com/data/attachment/forum/201711/07/130521bhxfgyux80llxpxu.attach  
https://item.jd.com/12401418.html  
