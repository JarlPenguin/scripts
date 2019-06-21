my_dir=$(pwd)
# cd to home
cd ~
# Make ROM directory
mkdir los16
# Initialize
cd los16
repo init -u https://github.com/LineageOS/android.git -b lineage-16.0 --depth="1"
# Clone manifests and copy them to local manifests dir
mkdir .repo/local_manifests
cd ~
git clone https://github.com/JarlPenguin/manifests.git manifests
cp manifests/LOS16.xml los16/.repo/local_manifests
cd $my_dir
. LOS16.sh
