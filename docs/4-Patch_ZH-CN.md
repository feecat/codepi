# codepi  

基于树莓派CM4模块的开源工业控制平台 

## 4、安装实时补丁包、系统设置、实时时钟设置、ETH1端口设置等 

注：出厂镜像已做过下列所有设置，此处供您参考。  

### 4.1 安装PreemptRT补丁（可选）

下载 [编译后的内核文件 by kdoren](https://github.com/kdoren/linux/releases)  
使用VNC或winscp拷贝到树莓派/home/pi/tmp下  
在tmp文件夹下创建install.sh，内容为：
```
apt install ./linux-image-5.15.65-rt49-v7l+_5.15.65-1_armhf.deb 
KERN=5.15.65-rt49-v7l+
mkdir -p /boot/$KERN/overlays/
cp -d /usr/lib/linux-image-$KERN/overlays/* /boot/$KERN/overlays/
cp -dr /usr/lib/linux-image-$KERN/* /boot/$KERN/
touch /boot/$KERN/overlays/README
mv /boot/vmlinuz-$KERN /boot/$KERN/
mv /boot/System.map-$KERN /boot/$KERN/
cp /boot/config-$KERN /boot/$KERN/
cp /boot/cmdline.txt /boot/$KERN/cmdline.txt

cat >> /boot/config.txt << EOF
[all]
kernel=vmlinuz-$KERN
# initramfs initrd.img-$KERN
os_prefix=$KERN/
overlay_prefix=overlays/
EOF
```
（版本迭代需自行修改名称）  
给予文件执行权限，打开终端，输入`sudo /home/pi/tmp/install.sh`等待安装完成即可。  
之后输入sudo reboot now重启，使用`uname -r`确认已切换到实时内核。

</br>

### 4.2 UPS设置（推荐）

只要安装了电池并想启用UPS功能就要打开。利用dtoverlay来实现自动关机。  
编辑/boot/config.txt，文件末尾加上```dtoverlay=gpio-shutdown,gpio_pin=4``` 。  
编辑/etc/systemd/system.conf，将以下两行解除屏蔽并将时间修改为10s：  
```
DefaultTimeoutStartSec=10s
DefaultTimeoutStopSec=10s
```

</br>

### 4.3 RTC设置（推荐）

在 Preferences-Raspberry Pi Configuration 或 raspi-config 中打开I2C。  
然后编辑/boot/config.txt，在末尾加上```dtoverlay=i2c-rtc,pcf8563``` 。  
重启，在终端中依次输入：  
```
sudo date --set '2020-12-12 12:12:12'
sudo hwclock -w
sudo hwclock -r
sudo hwclock --systohc
```

</br>

### 4.4 关闭树莓派LOGO及全屏自启Chromium（可选）

系统集成商一般不希望在产品中出现其它品牌相关的内容。在整个开关机和使用流程中都不能出现。  
在 Preferences-Raspberry Pi Configuration 或 raspi-config 中禁用Splash Screen（可选）。  
编辑/boot/cmdline.txt，最前面加上```logo.nologo ``` 以关闭启动界面的树莓派LOGO显示。  
在左上角图标上右键-Menu Settings，Icon改成`emblem-debian`或您自己的LOGO。路径在`/usr/share/icons/`。  
编辑/etc/xdg/lxsession/LXDE-pi/autostart，在末尾加上：  
```
@xset dpms 0 0 0
@xset s off
@taskset --cpu-list 0,1 /usr/bin/chromium-browser --kiosk http://localhost:8080/webvisu.htm --no-first-run --touch-events=enabled --fast --fast-start --disable-popup-blocking --disable-infobars --disable-session-crashed-bubble --disable-tab-switcher --disable-translate --enable-low-res-tiling --disable-gpu
```
这将禁用屏幕保护，并在开机后自动打开chromium并全屏显示指定页面。  

</br>

### 4.5 实时性优化

建议关闭桌面及visu显示，并将CPU频率固定为1.5GHz以保证实时性，具体操作如下：  
终端输入sudo raspi-config -> System Options -> Boot/Auto Login -> Console，关闭桌面及本机visu。（visu仍可远程访问）  
编辑/boot/config.txt，末尾加上`force_turbo=1`。  

</br>

### 4.6 使用image-backup备份系统（推荐）

下载[image-backup脚本](https://github.com/scruss/RonR-RaspberryPi-image-utils)并拷入到树莓派tmp文件夹中。  
若设备在console模式，则需要在终端中执行startx启动桌面以自动挂载U盘。  
插入NTFS格式U盘，剩余空间10G以上。在终端中执行`sudo /home/pi/tmp/image-backup`  
输入保存的位置，例如`/media/pi/myusb/backup.img`  
给定镜像大小，直接回车。  
给定扩充大小，一般输入100回车。  
等待备份完成即可。  


</br>

[返回上一页](https://github.com/feecat/codepi)
