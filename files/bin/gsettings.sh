#!/bin/sh

set -e

# change mouse word text selection break chars
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/word-char-exceptions '@ms "$_"'

# free up Super key combos that GNOME Shell grabs before wezterm can see them:
# Super+N (SpawnWindow), Super+V (PasteFrom), Super+M (Hide)
gsettings set org.gnome.shell.keybindings focus-active-notification "[]"
gsettings set org.gnome.shell.keybindings toggle-message-tray "[]"

# lock screen on Ctrl+Super+Q instead of Super+L
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Control><Super>q']"

# --- no longer needed, kept for reference ---

# put window minimize/maximize/close buttons on the right, not the left
#gsettings set org.gnome.desktop.wm.preferences button-layout :minimize,maximize,close
#gsettings get org.gnome.shell.overrides button-layout

# do not use overlay scrollbars
#gsettings set org.gnome.desktop.interface ubuntu-overlay-scrollbars false
#gsettings set com.canonical.desktop.interface scrollbar-mode normal
