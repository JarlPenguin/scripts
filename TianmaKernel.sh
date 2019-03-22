#!/bin/sh
cd <directory to kernel toolchain>
export CROSS_COMPILE=$(pwd)/bin/aarch64-linux-android-
export ARCH=arm64 && export SUBARCH=arm64
sudo chown -R <your username> <directory to folder containing kernel folder>/**/*.*
cd <directory to kernel>
sudo make O=out clean
sudo make O=out mrproper
sudo chown -R <your username> <directory to folder containing kernel folder>/**/*.*
make O=out montana_defconfig
make O=out -j$(nproc --all)
