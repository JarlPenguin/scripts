my_dir=$(pwd)
# cd to home
cd ~
# Make ROM directory
mkdir twrp
# Initialize
cd twrp
repo init -u https://github.com/omnirom/android.git -b android-7.1 --depth="1"
# Change recovery branch
sed -i "s|<project path="bootable/recovery" name="android_bootable_recovery" remote="omnirom" revision="android-7.1" groups="pdk-cw-fs"/>|<project path="bootable/recovery" name="android_bootable_recovery" remote="omnirom" revision="android-9.0" groups="pdk-cw-fs"/>|g" .repo/manifest.xml
# Clone manifests and copy them to local manifests dir
mkdir .repo/local_manifests
cd ~
git clone https://github.com/JarlPenguin/manifests.git manifests
cp manifests/TWRP.xml twrp/.repo/local_manifests
cd $my_dir
. TWRP.sh
