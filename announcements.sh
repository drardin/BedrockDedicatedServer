#!/bin/bash

# Check if server is running
if ! screen -list | grep -q "\.BDS"; then
        echo "Server is not running!"
        echo "Exiting ..."
        exit 1
fi

#set msg variable to a random line from servermessages.txt
msg=$(shuf -n 1 /home/drardin/minecraftbe/BDS/tmp/servermessages.txt | tr "\r" "\n")

#announce message via in-game command execution by attaching to server session 
screen -Rd BDS -X stuff "say $msg$(printf '\r')"
