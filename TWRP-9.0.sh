#!/bin/sh
echo -e "\e[36mScript to automate TWRP (9.0) Recovery builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
PATH=~/bin:$PATH
cd <directory of TWRP 9.0 repo>-9.0
echo -e "\e[36mSyncing from source...\e[0m"
repo sync -c -f --force-sync --no-tag --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune
echo -e "\e[36mBuilding...\e[0m"
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
lunch omni_montana-eng
make clean && make clobber
mkdir <directory of TWRP 9.0 repo>-9.0/out
mkdir <directory of TWRP 9.0 repo>-9.0/out/host
mkdir <directory of TWRP 9.0 repo>-9.0/out/host/linux-x86
mkdir <directory of TWRP 9.0 repo>-9.0/out/host/linux-x86/bin
cp <directory of TWRP 9.0 repo>-9.0/device/motorola/montana/dtbtool/dtbtool_moto <directory of TWRP 9.0 repo>-9.0/out/host/linux-x86/bin/dtbtool_moto
make recoveryimage
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
