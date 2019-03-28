#!/bin/sh
echo -e "\e[36mScript to automate ParallelScreens Kernel (Stock Oreo) builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
# Go to toolchain
cd <location of toolchain>
# Export needed variables
export CROSS_COMPILE=$(pwd)/bin/arm-eabi-
export ARCH=arm && export SUBARCH=arm
# Go to kernel directory
cd <location of kernel>
echo -e "\e[36mBuilding...\e[0m"
# Clean build directory
make O=out clean
# Make build directory proper
make O=out mrproper
# Write montana defconfig to .config
make O=out montana_defconfig
# Compile the kernel
make O=out -j$(nproc --all)
# Go to AnyKernel2 directory (clone from here: https://github.com/jarlpenguin/ParallelScreensKernel/tree/oreo-stock)
cd <anykernel2 directory>
# Remove existing kernel(s)
rm -rf ./Image.gz
# Copy kernel from out
cp <location of kernel>/out/arch/arm/boot/Image.gz <anykernel2 directory>
# Zip kernel up
zip -r9 ParallelScreens.zip * -x README.md ParallelScreens.zip
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
