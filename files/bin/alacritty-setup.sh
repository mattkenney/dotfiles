#!/bin/sh

set -e

if [ -x /usr/bin/update-desktop-database ]; then
  # install Alacritty desktop file in Gnome

  desktop=$(find ~/.cargo -path '*/alacritty-*/extra/linux/Alacritty.desktop'|head -1)
  icon=$(find ~/.cargo -path '*/alacritty-*/extra/logo/alacritty-term.svg'|head -1)

  mkdir -p ~/.local/share/pixmaps
  cp "${icon}" ~/.local/share/pixmaps/Alacritty.svg

  mkdir -p ~/.local/share/applications
  cp "${desktop}" ~/.local/share/applications

  update-desktop-database ~/.local/share/applications
fi
