#!/bin/sh
echo -e "\e[36mScript to automate Pixel Experience 9.0 (CAF) builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
PATH=~/bin:$PATH
cd ~/Documents/PixelExperience9CAF
echo -e "\e[36mSyncing from source...\e[0m"
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo -e "\e[36mBuilding...\e[0m"
export CCACHE_COMPRESS=1
export USE_CCACHE=1
. build/envsetup.sh
lunch aosp_montana-userdebug
mka bacon -j$(nproc --all)
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
