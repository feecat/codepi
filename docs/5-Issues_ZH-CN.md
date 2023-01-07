# codepi  

基于树莓派CM4模块的开源工业控制平台 

## 5、常见问题  

Q： 为什么不使用poweroff来断开UPS？  
A： 设计目的是为了断电而准备，单独的PLC或运动控制器没有长时间运行的必要。为了防止Linux卡死不能关机导致UPS电量耗尽，规定关机拥有30秒时间，该时间可以通过烧写固件修改。  

Q： 使用多个SoftPLC并连接到DHCP服务器，但DHCP没有正确配置  
A： 删除dhcpid：```sudo rm /etc/dhcpcd.duid ``` 

Q： 如何禁用NTP自动同步  
A： ```sudo timedatectl set-ntp false ``` 

Q： 如何修改或固定视频分辨率及格式  
A： 在终端中输入```sudo arandr```开启配置  
 或参考https://www.raspberrypi.org/documentation/configuration/hdmi-config.md  

Q： 在SoftMotion项目中开机偶尔发生通讯中断  
A： PLC带负荷时会影响运行周期，您可以禁用visu自启，或在visu自启后将总线重启。  

Q： PROFINET无法通讯  
A： 编辑```/etc/CODESYSControl_User.cfg```，在末尾加上：
```
[SysEthernet]
QDISC_BYPASS=1
Linux.ProtocolFilter=3

[SysSocket]
Adapter.0.Name="eth0"
Adapter.0.EnableSetIpAndMask=1
```

Q：如何使用USB转232、485设备？  
A：编辑`/etc/CODESYSControl_User.cfg`，将SysCom设置修改为如下：  
```
[SysCom]
Linux.Devicefile=/dev/ttyUSB
```

Q：如何使用USB转CAN设备（HUB4C）？  
A：编辑`/etc/CODESYSControl_User.cfg`，在末尾增加如下行（4.5.0.0之后不再需要）：  
```
[CmpSocketCanDrv]
ScriptPath=/opt/codesys/scripts/
ScriptName=rts_set_baud.sh
```
此外，can驱动晚于codesyscontrol加载，建议在启动后重启一次codesys服务，编辑`/etc/rc.local`，在exit 0之前插入如下行：  
```
sleep 5
sudo service codesyscontrol restart
```

Q：我是新手，如何开始学习CoDeSys？  
A：参阅以下链接  
http://bbs.hicodesys.com/data/attachment/forum/201711/07/130521bhxfgyux80llxpxu.attach  
https://item.jd.com/12401418.html  

Q：dmesg报警显示MAI: soc_pcm_open() failed (-19)  
A：该报警无影响，亦可通过`sudo apt-get purge pulseaudio`禁用音频以移除报警。  

Q：如何恢复Desktop桌面？  
A：部分客户会希望使用TargetVisu本机显示或第三方app，可通过sudo raspi-config -> System Options -> Boot/Auto Login -> Desktop autologin启用桌面，但会降低实时性。  



</br>

[返回上一页](https://github.com/feecat/codepi)
