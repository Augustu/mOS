#!/bin/bash

builddir="../build"
mOSdir="mOS"
bootdir="boot"

if [ ! -d $builddir ]; then
    mkdir $builddir
fi

cd $builddir
# if [ $? -ne 0 ]; then
#     echo "Can not found build folder, creating one"
#     mkdir ../build
#     cd ../build
# fi

if [ ! -d $mOSdir ]; then
    mkdir $mOSdir
fi

if [ ! -d $mOSdir/$bootdir ]; then
    mkdir $mOSdir/$bootdir
fi

modprobe nbd max_part=16
qemu-nbd -c /dev/nbd0 mOS.qcow2
partprobe /dev/nbd0
mount /dev/nbd0p1 mOS/boot

