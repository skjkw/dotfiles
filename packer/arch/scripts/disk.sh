sgdisk --new=1:1M:513M --typecode=1:0xEF00 /dev/sda
sgdisk --new=2:+1M:19G --typecode=2:0x8300 /dev/sda
sgdisk --new=3:+1M --typecode=3:0x8200 /dev/sda

mkfs.vfat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mkswap /dev/sda3
swapon /dev/sda3

mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot
