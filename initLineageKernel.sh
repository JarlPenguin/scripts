#!/bin/sh
my_dir=$(pwd)
# cd to home
cd ~
# Initialize
git clone https://github.com/montanadevelopment/android_kernel_motorola_msm8937 -b oreopie --depth="1" kernel
cd kernel
git clone https://github.com/jarlpenguin/AnyKernel2Template --depth="1" AnyKernel2Template
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/ --depth="1" -b android-9.0.0_r40 gcc
git clone https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/ --depth="1" -b android-9.0.0_r40 clang
cd $my_dir
. LineageKernelClang.sh