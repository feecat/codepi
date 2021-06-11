apt install ./linux-image-5.4.75-rt41-v7l_5.4.75-rt41-v7l-1_armhf.deb 
KERN=5.4.75-rt41-v7l
mkdir -p /boot/$KERN/overlays/
cp -d /usr/lib/linux-image-$KERN/overlays/* /boot/$KERN/overlays/
cp -dr /usr/lib/linux-image-$KERN/* /boot/$KERN/
touch /boot/$KERN/overlays/README
mv /boot/vmlinuz-$KERN /boot/$KERN/
mv /boot/System.map-$KERN /boot/$KERN/
cp /boot/config-$KERN /boot/$KERN/
cat >> /boot/config.txt << EOF

[all]
kernel=vmlinuz-$KERN
# initramfs initrd.img-$KERN
os_prefix=$KERN/
overlay_prefix=overlays/

EOF