#!/bin/sh
echo -e "\e[36mScript to automate LineageOS 16.0 builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
PATH=~/bin:$PATH
cd ~/Documents/LineageOS16
echo -e "\e[36mSyncing from source...\e[0m"
repo sync -c -f --force-sync --no-tag --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune
echo -e "\e[36mBuilding...\e[0m"
. build/envsetup.sh
export SELINUX_IGNORE_NEVERALLOWS=true
brunch montana
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
