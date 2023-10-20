#!/bin/bash

echo "HZ7 RPi Setup"

confirm() {
	input=""
	read -p "Install $1? [Y/N]: " input
	if [ $input == "Y" ]
	then
		return 0 #Yes
	elif [ $input == "y" ]
 	then
		return 0 #Yes
	elif [ $input == "Yes" ]
 	then
		return 0 #Yes
	elif [ $input == "yes" ]
 	then
		return 0 #Yes
	elif [ $input == "YES" ]
 	then
		return 0 #Yes
	else
		return 1 #No
	fi
}

confirm "OpenGL [GLFWlib & GLEWlib]"
if [ $? -eq 0 ]
then
#Setup OpenGL
echo "Installng OpenGL..."
#GLFW
echo "Installing GLFW..."
cd ~ #Main Folder
git clone https://github.com/glfw/glfw.git
cd ./glfw
echo "Setting Up Dependencies"
sudo apt install xorg-dev
sudo apt-get -y install cmake #Get CMake
echo "Building..."
cmake -G "Unix Makefiles"
echo "Done!"
#GLEW
echo "Installing GLEW..."
sudo apt-get install -y libglew-dev
echo "Done!"
fi

confirm "Java [Javalang]"
if [ $? -eq 0 ]
then
#Install Java
echo "Installing Java..."
sudo apt instal default-jdk
echo "Done!"
confirm "Kotlin [Kotlinlang] (Runs In Java)"
if [ $? -eq 0 ]
then
#Install Kotlin
echo "Installing Kotlin..."
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install kotin
echo "Done!"
fi
fi

confirm "Go [GoLang]"
if [ $? -eq 0 ]
then
#Setup GO
cd ~ #Main Folder
echo "Setting Up Go..."
wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
echo "Done!"
fi

confirm "Rust [Rustlang]"
if [ $? -eq 0 ]
then
#Setup Rust
cd ~ #Main Folder
echo "Setting Up Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "Done!"
fi

# Show Current Sttroage Capacity
echo "Remaining Storage:"
df -h

echo "[Program Ended]"
exit 0
