pacstrap /mnt base base-devel vim
genfstab -U -p /mnt >> /mnt/etc/fstab
