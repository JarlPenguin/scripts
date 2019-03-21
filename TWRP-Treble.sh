#!/bin/sh
echo -e "\e[36mScript to automate TWRP (7.1 Project Treble) Recovery builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
PATH=~/bin:$PATH
cd <directory>
echo -e "\e[36mSyncing from source...\e[0m"
repo sync -c -f --force-sync --no-tag --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune
echo -e "\e[36mBuilding...\e[0m"
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch omni_montana-eng
make recoveryimage
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
