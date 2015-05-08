Make uSD partition
- 0 ~ 2M, 2M, No Filesystem: Bootloader (bl1, spl, U-boot)
- 2M ~ 18M, 16M, ext2, boot : xen-uImage, linux-zImage, exynos5250-arndale.dtb, load-xen-uSD.img
- 18M ~ rest, ext3, root : Dom0 Root-Filesystem


1. Write Bootloader to uSD
$sudo ./sdcard1.sh /dev/sdc

2. Create two partitions
$ sudo fdisk /dev/sdc
$ n
$ p
$ 1
$ 2048
$ +16M
$ n
$ p
$ 2
$ (default)
$ (default)
$ w

$sudo mkfs.ext2 -L boot /dev/sdc1
$sudo mkfs.ext3 -L root /dev/sdc2
