#!/bin/bash

#Set Execution Date
date=$(date +%Y.%m.%d)

#Set installation path
until [ -d "$InstallDir" ]
do
  read -p 'Installation Path: ' InstallDir
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
else
  echo "An existing server directory was found!"
  sleep 2
  echo "Existing installation is corrupt. Install exiting..."
  exit 1
fi