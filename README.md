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

## Notes

### Sudo and Cron
Since the script uses `sudo` to install the package, ensure that it can run without interactive password prompts at boot. You may need to configure `/etc/sudoers` to allow passwordless execution of `dpkg -i` for your user. To do this, run:

```bash
sudo visudo
```

Then add the following line at the end (replace `yourusername` with your actual username):

```bash
yourusername ALL=(ALL) NOPASSWD: /usr/bin/dpkg -i
```

⚠️ **Be cautious when editing sudoers, as incorrect configurations may lock you out of sudo access.**

### Environment in Cron
Cron jobs run in a minimal environment, which is why the script uses full paths (e.g., `/tmp/discord.deb`). Verify that commands like `curl`, `dpkg-query`, and `dpkg-deb` are available in the standard `PATH`. Usually, they are, but if the script fails, check by running:

```bash
env
```
inside a cron job and ensure required commands are accessible.

---
Now, every time your system boots up, the script will check if Discord is up-to-date and install a new version if needed. 🚀