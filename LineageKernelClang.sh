#!/bin/sh
echo -e "\e[36mScript to automate Lineage Kernel (built with Clang) builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
# Go to kernel directory
cd <location of kernel>
echo -e "\e[36mSyncing from source...\e[0m"
# Pull from source
git pull
git checkout <branch>
git pull
# Export needed variables
make O=out ARCH=arm64 montana_defconfig
# Clean build directory
make O=out clean
# Make build directory proper
make O=out mrproper
echo -e "\e[36mBuilding...\e[0m"
PATH="~/<path to clang toolchain>/bin:~/<path to gcc toolchain>/bin:${PATH}" \
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android-
# Go to AnyKernel2 directory (clone from here: https://github.com/jarlpenguin/AnyKernel2Template)
cd <anykernel2 directory>
# Remove existing kernel(s)
rm -rf ./Image.gz
rm -rf ./LineageKernel.zip
# Copy kernel from out
cp <location of kernel>/out/arch/arm64/boot/Image.gz <anykernel2 directory>
# Zip kernel up
zip -r9 LineageKernel.zip *
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"