#!/bin/sh

ROOT="$(pwd)/../"
export ARCH=arm 
export CROSS_COMPILE=arm-linux-gnueabihf- 

cd $ROOT
./scripts/build.sh


