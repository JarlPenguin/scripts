my_dir=$(pwd)
# cd to home
cd ~
# Make ROM directory
mkdir pe9caf
# Initialize
cd pe9caf
repo init -u https://github.com/PixelExperience/manifest.git -b pie-caf --depth="1"
# Clone manifests and copy them to local manifests dir
mkdir .repo/local_manifests
cd ~
git clone https://github.com/JarlPenguin/manifests.git manifests
cp manifests/PE9CAF.xml pe9caf/.repo/local_manifests
cd $my_dir
. PE9CAF.sh
