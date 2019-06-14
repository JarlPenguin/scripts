#!/bin/sh
echo -e "\e[36mScript to automate LineageOS 16.0 builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
# Add repo to PATH
PATH=~/bin:$PATH
cd ~/los16
echo -e "\e[36mSyncing from source...\e[0m"
# Optimized sync
repo sync -c --force-sync --no-tags --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune
echo -e "\e[36mBuilding...\e[0m"
# Use CCACHE
export CCACHE_COMPRESS=1
export USE_CCACHE=1
# Replace x with amount of GB for CACCHE
#export CCACHE_MAXSIZE=xG
# Setup build environment
. build/envsetup.sh
# Start the build
breakfast montana
mka target-files-package otatools
croot
./build/tools/releasetools/sign_target_files_apks -o -d ~/.android-certs     $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip     signed-target_files.zip && ./build/tools/releasetools/ota_from_target_files -k ~/.android-certs/releasekey     --block --backup=true     signed-target_files.zip     lineage-16.0-$(date +%Y%m%d)-UNOFFICIAL-montana-signed.zip
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
echo -e "\e[36mUploading...\e[0m"
gdrive upload lineage-16.0-$(date +%Y%m%d)-UNOFFICIAL-montana-signed.zip
