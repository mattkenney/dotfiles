#!/bin/sh

set -e

# put window minimize/maximize/close buttons on the right, not the left
#gsettings set org.gnome.desktop.wm.preferences button-layout :minimize,maximize,close
#gsettings get org.gnome.shell.overrides button-layout

# do not use overlay scrollbars
#gsettings set org.gnome.desktop.interface ubuntu-overlay-scrollbars false
#gsettings set com.canonical.desktop.interface scrollbar-mode normal

# change mouse word text selection break chars
dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/word-char-exceptions '@ms "$_"'
