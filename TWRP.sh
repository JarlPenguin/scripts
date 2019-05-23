#!/bin/sh
echo -e "\e[36mScript to automate TeamWin Recovery Project builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
# Add repo to PATH
PATH=~/bin:$PATH
cd ~/twrp
echo -e "\e[36mSyncing from source...\e[0m"
# Optimized sync
repo sync -c -f --force-sync --no-tag --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune --depth=1
echo -e "\e[36mBuilding...\e[0m"
# Use CCACHE
export CCACHE_COMPRESS=1
export USE_CCACHE=1
# Replace x with amount of GB for CACCHE                          #export CCACHE_MAXSIZE=xG
# Export builder type (flex)
export LC_ALL=C
# Allow missing dependencies
export ALLOW_MISSING_DEPENDENCIES=true
# Setup build environment
. build/envsetup.sh
# Lunch the device
lunch omni_montana-eng
# Clean build directory
make clean && make clobber
# Start the build
make recoveryimage -j$(nproc --all)
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
