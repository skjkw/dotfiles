echo 'archlinux.vagrant' > /mnt/etc/hostname
sed -i -e 's/#en_US.UTF-8/en_US.UTF-8/' -e 's/#ja_JP.UTF-8/ja_JP.UTF-8/' /mnt/etc/locale.gen
sed -e 's/#UseDNS.*/UseDNS no/' -i /mnt/etc/ssh/sshd_config
arch-chroot /mnt locale-gen
arch-chroot /mnt ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtim
arch-chroot /mnt hwclock --systohc --utc

arch-chroot /mnt pacman -S --noconfirm dosfstools efibootmgr gummiboot virtualbox-guest-utils openssh wget curl

arch-chroot /mnt systemctl enable dhcpcd@eth0.service
arch-chroot /mnt systemctl enable 'sshd.service'

arch-chroot /mnt gummiboot --path=/boot install

cat <<'EOF' >>/mnt/boot/loader/entries/arch.conf
title       Arch Linux
linux       /vmlinuz-linux
initrd      /initramfs-linux.img
options     root=/dev/sda2 rw
EOF

cat <<'EOF' >>/mnt/boot/loader/loader.conf
default     arch
timeout     0
EOF

pacman -Sc --noconfirm
rm /var/lib/dhcpcd/*
history -c
