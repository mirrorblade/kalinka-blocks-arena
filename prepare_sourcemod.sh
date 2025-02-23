#!/bin/bash

###
### This script delete previous versions of MM and SM if exists and downloads new versions of them. 
### Update the constants below to update the versions.
###

# Constants for URLs
mm_url="https://mms.alliedmods.net/mmsdrop/2.0/mmsource-2.0.0-git1333-linux.tar.gz"
sm_url="https://sm.alliedmods.net/smdrop/1.13/sourcemod-1.13.0-git7214-linux.tar.gz"

rm -r addons
rm -r cfg/sourcemod

# Function to download, extract, and clean up
download_and_extract() {
    local url=$1
    local filename=$(basename "$url")
    
    # Download
    wget "$url"
    
    # Extract and untar
    tar -xzf "$filename"
    
    # Clean up
    rm "$filename"
}

# Process MetaMod
download_and_extract "$mm_url"

# Process SourceMod
download_and_extract "$sm_url"

echo "MetaMod and SourceMod have been downloaded, extracted and cleared"
