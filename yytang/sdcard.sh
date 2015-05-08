#!/bin/sh -e

DEVICE="$1"
ROOT="$(pwd)/../"
cd $ROOT

if [ ! -b "$DEVICE" ]; then
echo "Usage: $0 <device>"
  exit 1
fi

if [ "`id -u`" -ne 0 ]; then
echo "Please run this program as root."
fi

echo "I'm about to overwrite ${DEVICE}. All existing data will be lost."
until [ "$REPLY" = y -o "$REPLY" = yes ] || [ "$REPLY" = n -o "$REPLY" = no ]; do
read -p "Do you want to continue? " REPLY
done
[ "$REPLY" = n -o "$REPLY" = no ] && exit

grep -q $DEVICE /proc/mounts && grep $DEVICE /proc/mounts | cut -f2 -d\ | xargs umount

dd if=yytang/arndale-bl1.bin of=$DEVICE bs=512 seek=1
dd if=spl/smdk5250-spl.bin of=$DEVICE bs=512 seek=17
dd if=u-boot.bin of=$DEVICE bs=512 seek=49

sync
