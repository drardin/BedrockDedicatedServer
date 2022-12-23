# BedrockDedicatedServer
The scope of this project is to develop some utilities that can be used to expand the functionality of the official Minecraft: Bedrock Server software (https://www.minecraft.net/en-us/download/server/bedrock).

Any contributors who are interested in this project, please submit a pull request.

The following command downloads this repo's main installer script and executes it in Bash. This is intended to be the only command needed for using this project on any installation of Linux. The current focus is Debian based distributions of Linux but am looking to containerize this project for use on other systems, including ARM (a large focus of mine)

**(NOT UPDATED) curl https://raw.githubusercontent.com/drardin/BedrockDedicatedServer/main/setup.sh | bash (NOT UPDATED)**

Currently working on writing a package installer, package update utility, package backup and migration utility.

List of dependencies (ongoing):
**This repo**
Unzip
Tmux

**Minecraft Bedrock Server**

I am looking for expertise with converting this codebase, once complete, to a Docker image as this is where I want this project to evolve for mobility and ease of dependency and environmental variable control.
