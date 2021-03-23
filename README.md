# codepi  

基于树莓派CM4模块的开源工业控制平台 

**该存储库由 阔奥智能设备（上海）有限公司 委托 feecat于[github.com/feecat/codepi](https://github.com/feecat/codepi)上托管。** 

**包含CODEPI PCB原理图、定制的PreemptRT补丁包、教程及常见问题等。** 

[![](https://github.com/feecat/codepi/blob/main/docs/banner_2.gif)](https://item.taobao.com/item.htm?ft=t&id=635013789059)  

[![](https://github.com/feecat/codepi/blob/main/docs/banner_3.png)](https://item.taobao.com/item.htm?ft=t&id=635013789059)  


-----------------------

### 如果您第一次来到这里，请选择您想要先了解什么：  

</br>

1、为什么选择CodePI？有什么优势？ 
- 它是先进的、开源的、高效的工业控制平台，可用于PLC控制、智慧工厂、楼宇智能中。[阅读更多>](/docs/1-Advantage_ZH-CN.md)  

</br>

2、硬件架构、接口、通电注意事项 
- 我们内置了UPS模块，并由独立的单片机（STM32F030F4P6）进行BMS控制。
- 增加一路以太网方便调试及远程连接，将一个HDMI改为DVI以获取更可靠的连接。[阅读更多>](/docs/2-Hardware_ZH-CN.md)  

</br>

3、初次上电注意事项、为空的EMMC烧写系统 
- EMMC比MicroSD更可靠、更快速。
- 我们已做好了硬件设定，只需要插入MicroUSB并连接电源即可烧写系统。[阅读更多>](/docs/3-PowerUP_ZH-CN.md)  

</br>

4、安装实时补丁包、系统设置、实时时钟设置、ETH1端口设置等 
- 我们预编译了PreemptRT补丁包，支持CM4。
- 如果您烧写的是标准RPI OS系统，则需要一些设置以保证正常使用。[阅读更多>](/docs/4-Patch_ZH-CN.md)  

</br>
 
5、常见问题 
- 一些常见的问题，您还可以在Issues中提出您的新问题，我们会尽快为您解答。[阅读更多>](/docs/5-Issues_ZH-CN.md)  

-----------------------

### 如果您已购买我们的硬件，请参考如下教程：  

</br>

1、电源要求、接口连接、分辨率及IP修改
- 我们出厂前已为您烧好系统、设置好并下载DEMO程序，您可以直接上电测试。[阅读更多>](/docs/A1-PowerOn_ZH-CN.md)  

</br>

2、CoDeSys基础、总线拓扑结构
- 您可能需要安装codesys软件并开始硬件拓扑规划，这里是一些帮助信息。[阅读更多>](/docs/A2-BasicHandle_ZH-CN.md)  

</br>

3、实时性优化
- 在创建运动控制应用中，您可能需要考虑隔离核心、优化CPU占用、禁用Visualization等措施。[阅读更多>](/docs/A3-PreemptRT_ZH-CN.md)  

</br>

4、运动控制、凸轮及CNC
- 运动控制包含很多细分内容，此处列举几个经典案例。[阅读更多>](/docs/A4-Softmotion_ZH-CN.md)  

</br>

5、授权及备份
- 当您测试完毕准备量产时，将系统备份会有利于批量部署。[阅读更多>](/docs/A5-Backup_ZH-CN.md)  
