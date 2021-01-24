#!/bin/bash

builddir="../build"
mOSdir="mOS"
bootdir="boot"

if [ ! -d $builddir ]; then
    echo "No build folder found, run mount.sh first"
    exit -1
fi
cd $builddir

umount mOS/boot
qemu-nbd -d /dev/nbd0
killall qemu-nbd
