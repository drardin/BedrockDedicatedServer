#!/bin/bash

echo "Checking for online players"

#format date to match ref logs
date=$(cat /home/drardin/minecraftbe/BDS/tmp/currentlog.txt)

#clear contents of online.txt tmp file
echo "" > /home/drardin/minecraftbe/BDS/tmp/online.txt

#attach to running server session and executes in-game command to pull online players. Injects return carriage for execution.
screen -Rd BDS -X stuff "list$(printf '\r')"

#allow time for active log to update
sleep 10

#grabs last 15 lines of todays log and parses out unnecessary data and formats for usability with other scripts
#avoid frequent use of this script or adjust total lines to include
tail -n 15 /home/nox/minecraftbe/BDS/logs/BDS.$date.log | grep -A 1 'online' | grep -v 'online' | cut -d " " -f 3-10 | tr -d '-' | tr -d ',' | tr " " "\n" |  grep "\S" | uniq > /home/nox/minecraftbe/BDS/tmp/online.txt

echo "$(cat /home/drardin/minecraftbe/BDS/tmp/online.txt)"
