#!/bin/bash

#Set Execution Date
date=$(date +%Y.%m.%d)

#Set installation path
until [ -d "$InstallDir" ]
do
  read -p 'Installation Path: ' InstallDir < /dev/tty
  InstallDir=$(eval echo "$InstallDir")
    if [ ! -d "$InstallDir" ]; then
      echo "Specified path does not exist, try again"
    fi
done
echo "Installation path has been set"

#Check if specified path has an existing server root directory
cd $InstallDir
if [ ! -d "BDS" ]; then
  echo "Creating server root directory"
  mkdir BDS/
  cd BDS/
  sleep 2
  echo "Server root directory has been created"
else
  echo "Server root directory was found!"
  cd BDS/
fi

#Check if server root directory has an existing install
if [ -f "bedrock_server" ]; then
    echo "An existing install was found!"
	sleep 2
    echo "Creating Backup..."
    cd $InstallDir
    tar -zcvf existinginstall-$date.tar.gz BDS/
    rm -r BDS/
    mkdir BDS/
	sleep 2
	echo "Creating backup directory"
    mkdir BDS/Backups/
    mv existinginstall-$date.tar.gz $InstallDir/BDS/Backups/
    cd BDS/
    echo "Backup created and saved to $InstallDir/BDS/Backups/"
fi

# NEED UNZIP DEPENDENCY !!!

# NEED DYNAMIC DOWNLOAD LINK LOGIC !!!

#Download Minecraft Bedrock Dedicated Server from Microsoft
echo "Creating download directory"
mkdir $InstallDir/BDS/Downloads/
cd $InstallDir/BDS/Downloads/
echo "Downloading Minecraft Bedrock Dedicated Server from Microsoft"
wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.18.33.02.zip
echo "Installing to installation directory"
unzip bedrock-server*.zip -d $InstallDir/BDS/
echo "Purging downloads"
rm bedrock-server*.zip
echo "Test"
