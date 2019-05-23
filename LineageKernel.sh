#!/bin/sh
echo -e "\e[36mScript to automate Lineage Kernel builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
# Go to toolchain
cd ~/toolchain
# Export needed variables
export CROSS_COMPILE=$(pwd)/bin/aarch64-linux-android-
export ARCH=arm64 && export SUBARCH=arm64
# Go to kernel directory
cd ~/kernel
echo -e "\e[36mSyncing from source...\e[0m"
# Pull from source
git pull
git checkout pie
git pull
echo -e "\e[36mBuilding...\e[0m"
# Clean build directory
make O=out clean
# Make build directory proper
make O=out mrproper
# Write montana defconfig to .config
make montana_defconfig
# Compile the kernel
make -j$(nproc --all)
# Go to AnyKernel2 directory (clone from here: https://github.com/jarlpenguin/AnyKernel2Template)
cd ~/AnyKernel2Template
# Remove existing kernel(s)
rm -rf ./Image.gz
rm -rf ./LineageKernel.zip
# Copy kernel from out
cp ~/kernel/arch/arm64/boot/Image.gz ~/AnyKernel2Template
# Zip kernel up
zip -r9 LineageKernel.zip *
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
