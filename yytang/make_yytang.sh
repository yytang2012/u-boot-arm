#!/bin/sh

ROOT="$(pwd)/../"
export CROSS_COMPILE=arm-linux-gnueabihf-
export export ARCH=arm

cd $ROOT

make arndale5250
