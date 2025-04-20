# Discord Auto-Update Script for Linux

## Purpose
On Linux, Discord does not update automatically like on Windows or macOS. This script ensures that Discord stays up to date by checking for the latest version and installing it when needed. The script runs at system startup, ensuring you always have the latest version without manual intervention.

## Installation

1. **Create the script file**
   ```bash
   sudo nano /usr/local/bin/discord_update.sh
   ```
   Copy and paste the script into the file and save it (CTRL+X, then Y, then ENTER).

2. **Make the script executable**
   ```bash
   sudo chmod +x /usr/local/bin/discord_update.sh
   ```

3. **Schedule the script to run at startup**
   Open the crontab editor:
   ```bash
   sudo crontab -e
   ```
   Add the following line at the end:
   ```bash
   @reboot /usr/local/bin/discord_update.sh > /tmp/discord_cron.log 2>&1
   ```

---
Now, every time your system boots up, the script will check if Discord is up-to-date and install a new version if needed. 🚀