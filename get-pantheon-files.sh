#!/bin/bash

#usage ./get-pantheon-files.sh <site-name> [environment]

# Check if Terminus is installed
if ! command -v terminus &> /dev/null; then
    echo "Terminus is not installed. Please install it first."
    exit 1
fi

# Check if site name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <site-name> [environment]"
    echo "Example: $0 my-site dev"
    exit 1
fi

SITE_NAME=$1
ENVIRONMENT=${2:-dev}  # Default to 'dev' if environment not specified

# Check if user is authenticated with Terminus
if ! terminus auth:whoami &> /dev/null; then
    echo "Please login to Terminus first using: terminus auth:login"
    exit 1
fi

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOWNLOAD_DIR="$SCRIPT_DIR/pantheon-files-$SITE_NAME-$ENVIRONMENT"

# Create download directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"
echo "Downloading files to: $DOWNLOAD_DIR"

# Download files using Terminus
echo "Downloading files from $SITE_NAME.$ENVIRONMENT..."
terminus backup:get $SITE_NAME.$ENVIRONMENT --element=files --to="$DOWNLOAD_DIR"

if [ $? -eq 0 ]; then
    echo "Files have been downloaded successfully to: $DOWNLOAD_DIR"
    echo "You can find the files in the 'files' directory within the downloaded archive"
else
    echo "Failed to download files"
    rm -rf "$DOWNLOAD_DIR"
    exit 1
fi