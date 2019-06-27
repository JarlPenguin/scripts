my_dir=$(pwd)
# cd to home
cd ~
# Make ROM directory
mkdir twrp
# Initialize
cd twrp
repo init -u git://github.com/JarlPenguin/twrp-manifest.git -b android-7.1 --depth="1"
# Clone manifests and copy them to local manifests dir
mkdir .repo/local_manifests
cd ~
git clone https://github.com/JarlPenguin/manifests.git manifests
cp manifests/TWRP.xml twrp/.repo/local_manifests
cd $my_dir
. TWRP.sh
