
#!//bin/bash


BACKUP_DIR="$HOME/backups"
# We removed the $DATE from the filename so it stays the same every month
# This forces the computer to overwrite the old "monthly" file with the new data.

mkdir -p "$BACKUP_DIR"

# 1. Overwrites the previous settings file
dconf dump / > "$BACKUP_DIR/monthly_settings_backup.ini"

# 2. Overwrites the previous zipped appearance files
# (Fixed: removed the extra '>' at the end)
tar -czf "$BACKUP_DIR/monthly_appearance.tar.gz" -C "$HOME" .themes .icons .local/share/themes .local/share/icons 2>/dev/null

echo "Monthly customization backup complete!"


notify-send "Backup Complete" "Your monthly system tweaks have been saved to $BACKUP_DIR" --icon=drive-harddisk
