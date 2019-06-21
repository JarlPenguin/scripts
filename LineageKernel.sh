#!/bin/sh
echo -e "\e[36mScript to automate Lineage Kernel (built with Clang) builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
# Go to kernel directory
cd ~/kernel
echo -e "\e[36mSyncing from source...\e[0m"
# Pull from source
git pull
git checkout pie
git pull
# Export needed variables
make O=out ARCH=arm64 montana_defconfig
# Clean build directory
make O=out clean
make O=out mrproper
echo -e "\e[36mBuilding...\e[0m"
PATH="./clang/bin:./gcc/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-
# Go to AnyKernel2 directory (clone from here: https://github.com/jarlpenguin/AnyKernel2Template)
cd AnyKernel2Template
# Remove existing kernel(s)
rm Image.gz
rm LineageKernel.zip
# Copy kernel from out
cp ~/kernel/out/arch/arm64/boot/Image.gz ~/AnyKernel2Template
# Zip kernel up
zip -r9 LineageKernel.zip *
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
