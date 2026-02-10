#!/bin/bash

# Script to reset terminal settings to default Ubuntu configuration

# Backup existing .bashrc and .bash_profile
if [ -f ~/.bashrc ]; then
    echo "Backing up existing .bashrc to .bashrc_backup"
    mv ~/.bashrc ~/.bashrc_backup
fi

if [ -f ~/.bash_profile ]; then
    echo "Backing up existing .bash_profile to .bash_profile_backup"
    mv ~/.bash_profile ~/.bash_profile_backup
fi

# Restore default .bashrc and .bash_profile
if [ -f /etc/skel/.bashrc ]; then
    echo "Restoring default .bashrc"
    cp /etc/skel/.bashrc ~
fi

if [ -f /etc/skel/.bash_profile ]; then
    echo "Restoring default .bash_profile"
    cp /etc/skel/.bash_profile ~
fi

# Reset GNOME Terminal settings
if command -v dconf &> /dev/null; then
    echo "Resetting GNOME Terminal settings"
    dconf reset -f /org/gnome/terminal/
else
    echo "dconf not found. GNOME Terminal settings not reset."
fi

# Reload the bash configuration
echo "Reloading bash configuration"
source ~/.bashrc

echo "Terminal settings have been reset to default Ubuntu configuration."