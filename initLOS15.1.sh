my_dir=$(pwd)
# cd to home
cd ~
# Make ROM directory
mkdir los15.1
# Initialize
cd los15.1
repo init -u https://github.com/LineageOS/android.git -b lineage-15.1 --depth="1"
# Clone manifests and copy them to local manifests dir
mkdir .repo/local_manifests
cd ~
git clone https://github.com/JarlPenguin/manifests.git manifests
cp manifests/LOS15.1.xml los15.1/.repo/local_manifests
cd $my_dir
. LOS15.1.sh
