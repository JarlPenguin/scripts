#!/bin/sh
echo -e "\e[36mScript to automate Lineage Kernel (Stock Oreo) builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
# Go to toolchain
cd <location of toolchain>
# Export needed variables
export CROSS_COMPILE=$(pwd)/bin/arm-linux-androideabi-
export ARCH=arm && export SUBARCH=arm
# Go to kernel directory
cd <location of kernel>
echo -e "\e[36mSyncing from source...\e[0m"
# Pull from source
git pull
git checkout stock-8.1
git pull
echo -e "\e[36mBuilding...\e[0m"
# Clean build directory
make clean
# Make build directory proper
make mrproper
# Write montana defconfig to .config
make montana_defconfig
# Compile the kernel
make -j$(nproc --all)
# Go to AnyKernel2 directory (clone from here: https://github.com/jarlpenguin/AnyKernel2Template)
cd <anykernel2 directory>
# Remove existing kernel(s)
rm -rf ./Image.gz
# Copy kernel from out
cp <location of kernel>/out/arch/arm/boot/Image.gz <anykernel2 directory>
# Zip kernel up
zip -r9 LineageKernelStock.zip
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
