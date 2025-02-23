#!/bin/bash

###
### This script clears "cstrike_for_sourcemod_default/" and downloads both MMS and SM. 
### Update the constants below to update the versions.
###

# Constants for URLs
mm_url="https://mms.alliedmods.net/mmsdrop/2.0/mmsource-2.0.0-git1333-linux.tar.gz"
sm_url="https://sm.alliedmods.net/smdrop/1.13/sourcemod-1.13.0-git7214-linux.tar.gz"

# Delete existing directory and create a fresh one
rm -rf cstrike_for_sourcemod_default
mkdir -p cstrike_for_sourcemod_default

# Function to download, extract, and clean up
download_and_extract() {
    local url=$1
    local filename=$(basename "$url")
    
    # Download
    wget "$url"
    
    # Extract and untar
    tar -xzf "$filename" -C cstrike_for_sourcemod_default
    
    # Clean up
    rm "$filename"
}

# Process MetaMod
download_and_extract "$mm_url"

# Process SourceMod
download_and_extract "$sm_url"

echo "MetaMod and SourceMod have been downloaded, extracted, and cleaned up in cstrike_for_sourcemod_default"
