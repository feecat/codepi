# codepi  

基于树莓派CM4模块的开源工业控制平台 

## 2、硬件架构、接口、通电注意事项 

| 接口 | 物理接口 | 注释 | 使用 |
| :-----: | :-----: | :------: | :------ |
| 电源输入 | 5.08 2p插拔式端子 | 供电 | 12-24V直流输入，额定功率18W |
| 电源指示灯 | - | 绿色指示灯 | 上电时闪烁一次，断电时持续闪烁30秒后关机 |
| 硬盘指示灯 | - | 蓝色指示灯 | EMMC读写操作时闪烁 |
| 烧录接口 | MicroUSB | 烧写系统 | 用于对EMMC编程 |
| USB | USB-Ax2 | 两个USB接口 | 可接入U盘、串口、以太网设备等 |
| ETH0 | RJ45 | 千兆以太网 | 主要使用该网口，速率高，具有实时性 |
| HDMI | HDMI-A | 视频输出 | 原始接口HDMI1 |
| DVI | DVI-D | 视频输出 | 原始接口HDMI0 |
| ETH1 | RJ45 | 十兆以太网 | 用于SSH连接、编程、扩展，不具有实时性 |

</br>

核心板的规格可选配，我们推荐CM4002008，即无WIFI、2G内存、8G EMMC的版本。  
以下为核心板规格，参阅[https://www.raspberrypi.org/products/compute-module-4/](https://www.raspberrypi.org/products/compute-module-4/)：
- Broadcom BCM2711 quad-core Cortex-A72 (ARM v8) 64-bit SoC @ 1.5GHz
- H.265 (HEVC) (up to 4Kp60 decode), H.264 (up to 1080p60 decode, 1080p30 encode) 
- OpenGL ES 3.0 graphics
- Options for 1GB, 2GB, 4GB or 8GB LPDDR4-3200 SDRAM (depending on variant)
- Options for 0GB ("Lite"), 8GB, 16GB or 32GB eMMC Flash memory (depending on variant)
- Option for fully certified radio module:
- 2.4 GHz, 5.0 GHz IEEE 802.11 b/g/n/ac wireless;
- Bluetooth 5.0, BLE;
- On-board electronic switch to select either external or PCB trace antenna

</br>

请在安装电池前确认电池极性，并在接入主供电前安装电池。(若您不需要使用UPS功能也可不安装电池）  
通电前请确认供电电压在DC 12~24V，供电电流在0.3-1A。  
若您需要烧写系统，请参阅第三章。  

</br>

[返回上一页](https://github.com/feecat/codepi)
