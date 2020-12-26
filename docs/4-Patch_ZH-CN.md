# codepi  

基于树莓派CM4模块的开源工业控制平台 

## 4、安装实时补丁包、系统设置、实时时钟设置、ETH1端口设置等 

### 4.1 安装PreemptRT补丁（可选）

下载 [编译后的内核文件](https://github.com/feecat/codepi/blob/main/rt-kernel_5.4.75-rt41.tgz)  
使用VNC或winscp拷贝到树莓派/home/pi/tmp下  
打开终端，依次输入:  
```
cd tmp
sudo tar xzf rt-kernel_5.4.75-rt41.tgz
cd boot
sudo cp -rd * /boot/
cd ../lib
sudo cp -rd * /lib/
cd ../overlays
sudo cp -d * /boot/overlays
cd ..
sudo cp -d bcm* /boot/
```
然后编辑/boot/config.txt，文件末尾加上```kernel=kernel7l-rt.img``` 。  
（可以用在终端输入sudo pcmanfm以管理员权限打开文件管理器，也可以直接输入sudo nano /boot/config.txt在终端中编辑。）  

之后输入sudo reboot now重启即可。

</br>

### 4.2 UPS设置（推荐）

只要安装了电池并想启用UPS功能就要打开。利用dtoverlay来实现自动关机。  
编辑/boot/config.txt，文件末尾加上```dtoverlay=gpio-shutdown,gpio_pin=4``` 。

</br>

### 4.3 USB设置（必须）

两个USB-A端口使用的是usb host模式，需要打开才可使用。  
编辑/boot/config.txt，在末尾加上```dtoverlay=dwc2,dr_mode=host``` 。  
如果在上电时忘记修改，则需要重新以usbboot模式加载并修改config文件。

</br>

### 4.4 ETH1设置（推荐）

在 Preferences-Raspberry Pi Configuration 或 raspi-config 中打开SPI。  
然后编辑/boot/config.txt，在末尾加上```dtoverlay=w5500,int_pin=22,speed=10000000``` 。  
由于W5500硬件缺陷，我们还需要编辑/etc/rc.local，在exit 0之前插入如下内容以对芯片复位：  
```
echo "24" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio24/direction
echo "0" > /sys/class/gpio/gpio24/value
echo "1" > /sys/class/gpio/gpio24/value
sudo rmmod spi_bcm2835
sudo modprobe spi_bcm2835
```
若您希望ETH1为固定IP，则编辑/etc/dhcpcd.conf，在末尾加上如下两行：
```
interface eth1
static ip_address=192.168.1.101
```

</br>

### 4.5 RTC设置（推荐）

在 Preferences-Raspberry Pi Configuration 或 raspi-config 中打开I2C。  
然后编辑/boot/config.txt，在末尾加上```dtoverlay=i2c-rtc,pcf8563``` 。  
终端输入sudo reboot now重启，重启后使用该代码检查是否正确连接：```sudo hwclock -r``` 。  
若已正确连接，在终端中依次输入：  
```
sudo date --set '2020-12-12 12:12:12'
sudo hwclock -w
sudo hwclock -r
sudo hwclock --systohc
sudo apt-get purge fake-hwclock
```
若您重新冷启动发现时间仍未正确设置，则在/etc/udev/rules.d下创建85-hwclock.rules文件，文件内容为：  
```KERNEL=="rtc0", RUN+="/sbin/hwclock --rtc=$root/$name --hctosys"```  
除此之外，我们还建议使用```sudo timedatectl set-ntp false```以禁用NTP同步。  

</br>

### 4.6 关闭树莓派LOGO及全屏自启Chromium（可选）

系统集成商一般不希望在产品中出现其它品牌相关的内容。在整个开关机和使用流程中都不能出现。  
在 Preferences-Raspberry Pi Configuration 或 raspi-config 中禁用Splash Screen（可选）。  
编辑/boot/cmdline.txt，最前面加上```logo.nologo ``` 以关闭启动界面的树莓派LOGO显示。  
编辑/etc/xdg/lxsession/LXDE-pi/autostart，在原先的内容前加#号，并在末尾加上：  
```
@xset dpms 0 0 0
@xset s off
@/usr/bin/chromium-browser --kiosk http://localhost:8080/webvisu.htm --no-first-run --touch-events=enabled --fast --fast-start --disable-popup-blocking --disable-infobars --disable-session-crashed-bubble --disable-tab-switcher --disable-translate --enable-low-res-tiling
```
这将禁用桌面的加载，并在开机后自动打开chromium并全屏显示指定页面。

</br>

### 4.7 使用image-backup备份系统（推荐）

请参阅[https://github.com/scruss/RonR-RaspberryPi-image-utils](https://github.com/scruss/RonR-RaspberryPi-image-utils)

