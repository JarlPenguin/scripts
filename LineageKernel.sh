#!/bin/sh
echo -e "\e[36mScript to automate ParallelScreens Kernel (Pie ARM64) builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
# Go to toolchain
cd <location of toolchain>
# Export needed variables
export CROSS_COMPILE=$(pwd)/bin/aarch64-linux-android-
export ARCH=arm64 && export SUBARCH=arm64
# Go to kernel directory
cd <location of kernel>
echo -e "\e[36mSyncing from source...\e[0m"
# Pull from source
git pull
git checkout lineage-16.0
git pull
echo -e "\e[36mBuilding...\e[0m"
# Clean build directory
make O=out clean
# Make build directory proper
make O=out mrproper
# Write montana defconfig to .config
make O=out montana_defconfig
# Compile the kernel
make O=out -j$(nproc --all)
# Go to AnyKernel2 directory (clone from here: https://github.com/jarlpenguin/AnyKernel2Template)
cd <anykernel2 directory>
# Switch to Pie branch
git checkout pie
# Remove existing kernel(s)
rm -rf ./Image.gz
# Copy kernel from out
cp <location of kernel>/out/arch/arm64/boot/Image.gz <anykernel2 directory>
# Zip kernel up
zip -r9 LineageKernel.zip
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
