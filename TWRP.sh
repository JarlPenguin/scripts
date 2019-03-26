#!/bin/sh
echo -e "\e[36mScript to automate TWRP (7.1) Recovery builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
PATH=~/bin:$PATH
cd ~/Documents/TWRP
echo -e "\e[36mSyncing from source...\e[0m"
# Optimized sync
repo sync -c -f --force-sync --no-tag --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune
echo -e "\e[36mBuilding...\e[0m"
export CCACHE_COMPRESS=1
export USE_CCACHE=1
export LC_ALL=C
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch omni_montana-eng
make clean && make clobber
make recoveryimage
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
