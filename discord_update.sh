#!/bin/bash

# Fetch the latest version number from the Discord API
latest_version=$(curl https://discord.com/api/download\?platform\=linux\&format\=deb -sl | cut -d '"' -f2 | cut -d '>' -f5 | grep "deb" | cut -d '-' -f2 | sed 's/.deb//')

# Get the installed version (if Discord is installed)
installed_version=$(dpkg-query -W -f='${Version}' discord 2>/dev/null)

echo "Latest Version: $latest_version"
echo "Installed Version: ${installed_version:-Not Installed}"

# Check if Discord is already up-to-date
if [ -n "$installed_version" ] && [ "$installed_version" = "$latest_version" ]; then
    echo "Discord is already up-to-date."
    exit 0
fi

# Download and install the latest version if not up-to-date
TEMP_DEB="/tmp/discord.deb"
DOWNLOAD_URL="https://discord.com/api/download?platform=linux&format=deb"

echo "Downloading Discord $latest_version..."
curl -L "$DOWNLOAD_URL" -o "$TEMP_DEB"

echo "Installing Discord..."
sudo dpkg -i "$TEMP_DEB"

# Cleanup
rm "$TEMP_DEB"
echo "Discord update complete!"
