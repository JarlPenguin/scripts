#!/bin/sh
echo -e "\e[36mScript to automate LineageOS 15.1 builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
# Add repo to PATH
PATH=~/bin:$PATH
cd <directory>
echo -e "\e[36mSyncing from source...\e[0m"
# Optimized sync
repo sync -c -f --force-sync --no-tag --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune
echo -e "\e[36mBuilding...\e[0m"
# Setup build environment
. build/envsetup.sh
# Start the build
brunch montana
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
