#!/bin/sh
echo -e "\e[36mScript to automate LineageOS 16.0 (SELinux Enforcing) builds for Moto G5S (montana)"
echo -e "Initializing...\e[0m"
cd <directory>
echo -e "\e[36mSyncing from source...\e[0m"
repo sync -c -f --force-sync --no-tag --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune
echo -e "\e[36mBuilding...\e[0m"
. build/envsetup.sh
export SELINUX_IGNORE_NEVERALLOWS=true
lunch lineage_montana-userdebug
mka bacon
echo -e "\e[36mBuild process ended! Check the terminal for any errors.\e[0m"
