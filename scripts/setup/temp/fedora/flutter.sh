# !/bin/bash
mkdir -p ~/Coding/Dev 
cd ~/Coding/Dev
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.1-stable.tar.xz
tar xf flutter_linux_3.13.1-stable.tar.xz
export PATH="$PATH:$(pwd)/flutter/bin"
flutter precache
flutter doctor
sudo dnf install clang cmake ninja-build gtk3-devel

#Andriod Studio
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2022.3.1.19/android-studio-2022.3.1.19-linux.tar.gz
tar xf android-studio-2022.3.1.19-linux.tar.gz
./android-studio/bin/studio.sh

export PATH="$PATH:$(pwd)/android-studio/bin"

create_app_icon()

flutter config --android-sdk /home/consularparadi/Coding/Dev/android-sdk

echo "Please configure android-studio settings to download cmdline tools at Android-Studio/Projects/More-Actions/SDK-Manager/SDK-Tools"

#Install VS-Code

echo -e "Continue"
yesno

flutter doctor --android-license

flutter doctor



