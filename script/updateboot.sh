#!/bin/bash

devfile="/dev/nbd0"
bootfile="../arch/x86/boot/boot.bin"

if [ ! -d $devfile ]; then
    echo "$devfile not found, should run mount.sh first"
    exit -1
fi

if [ ! -d $bootfile ]; then
    echo "$bootfile not found, should run mount.sh first"
    exit -1
fi

sudo dd if=$bootfile of=/dev/nbd0 count=1 bs=512
