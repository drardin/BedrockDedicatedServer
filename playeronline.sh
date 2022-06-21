#!/bin/bash
#This script monitors the current active log file for "Player connected"
#and parses out everything from the line except for player name
#it will then greet the player in-game and uses a Discord webhook for Discord integration

logfile=$(cat /home/drardin/minecraftbe/BDS/tmp/currentlogfile.txt)

tail -fn0 /home/drardin/minecraftbe/BDS/logs/BDS.$logfile.log | \
while read line ; do
        echo "$line" | grep "Player connected"
        if [ $? = 0 ]
        then
                activity=$(tail -n 1 /home/drardin/minecraftbe/BDS/logs/BDS.$logfile.log | grep "Player connected" | cut -d " " -f 8 | tr -d ',',']')
                screen -Rd BDS -X stuff "say Welcome back§5 $activity§f!$(printf '\r')"
                webhookURL="https://discord.com/api/webhooks/restofurl"
                username="NFO Bot"
                title="Player Activity"
                color="3093151"

                curl \
                  -H "Content-Type: application/json" \
                  -X POST \
                  -d '{"username": "'"$username"'", "embeds": [{"title": "'"$title"'", "description": "'"$activity"' is online!:smile:",  "color": "'"$color"'"}]}' \
                $webhookURL
        fi
done
