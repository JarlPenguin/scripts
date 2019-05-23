#!/bin/sh
echo -e "\e[36mScript to automate Pixel Experience 9.0 (CAF) builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
# Add repo to PATH
PATH=~/bin:$PATH
cd ~/pe9caf
echo -e "\e[36mSyncing from source...\e[0m"
# Optimized sync
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo -e "\e[36mBuilding...\e[0m"
# Use CCACHE
export CCACHE_COMPRESS=1
export USE_CCACHE=1
# Replace x with amount of GB for CACCHE
#export CCACHE_MAXSIZE=xG
# Setup build environment
. build/envsetup.sh
# Lunch the device
lunch aosp_montana-userdebug
# Start the build
export CUSTOM_BUILD_TYPE=OFFICIAL
mka bacon
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
