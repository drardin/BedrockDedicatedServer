# BedrockDedicatedServer

## Scope
The scope of this project is to develop some utilities that can be used to expand the functionality of the official Minecraft: Bedrock Server software (https://www.minecraft.net/en-us/download/server/bedrock).

## Short Description
The following command downloads this repo's main installer script and executes it in Bash. This is intended to be the only command needed for using this project on any installation of Linux. The current focus is Debian based distributions of Linux but am looking to containerize this project for use on other systems, including ARM (a large focus of mine)

## Main Install Script
**(NOT UPDATED)** `curl https://raw.githubusercontent.com/drardin/BedrockDedicatedServer/main/setup.sh | bash`

## Project Focus
Currently working on writing a package installer, package update utility, package backup and migration utility.

## Project Dependencies

**This repository**
- Unzip
- Tmux

**Minecraft Bedrock Server v1.19**
- libdl.so.2
- libcurl.so.4
- libstdc++.so.6
- libm.so.6
- libgcc_s.so.1
- libpthread.so.0
- libc.so.6
- ld-linux-x86-64.so.2

I am looking for expertise with converting this codebase, once complete, to a Docker image as this is where I want this project to evolve for mobility and ease of dependency and environmental variable control. Any contributors who are interested in this project, please submit a pull request.
