# codepi  

基于树莓派CM4模块的开源工业控制平台 

## A5、授权及备份

授权：  
当您测试好程序准备投入运行时，需要安装授权以解除2小时/半小时的运行时间限制。  
只需要在项目中点击Tools-License Manager，选择Device、SoftContainer，按向导指示操作即可。
注意：在激活授权时您的电脑需要保证连接到互联网。  
![](/docs/images/A5_1.png)  
![](/docs/images/A5_2.png)  

若您使用USB Dongle则在此处选另一选项：  
![](/docs/images/A5_3.png)  
![](/docs/images/A5_4.png)  
![](/docs/images/A5_5.png)  
![](/docs/images/A5_6.png)  

激活完成后，若这是您的测试机器，则建议备份授权以供恢复：   
![](/docs/images/A5_7.png) 







备份：  
您可以只备份`/var/opt/codesys`下的文件（编译后的PLC及授权文件），也可以通过`/home/pi/tmp/image-backup.sh`备份全盘到U盘中。  


[返回上一页](https://github.com/feecat/codepi)
