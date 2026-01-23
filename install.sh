#!/bin/bash
# #######################################################################################
# # /* ---- 🐧 https://github.com/Solrojo-Script 🐧 ---- */  #
# #######################################################################################
#
# Installation Script for Solrojo-Script's DotFiles
# This collection includes configurations for: hyprland, hyprpaper, hyprlock, waybar, wlogout, wofi, and kitty.
#
# It features scripts for changing wallpapers using hyprpaper, located in ~/.config/hypr/scripts, along with the wallpapers stored in ~/.config/wallpaper.
#
# Additionally, it contains folder icons from Adwaita++ combined with Suru++.
#
# WARNING: Before running this script, ensure that the following applications and fonts are installed: hyprland, hyprpaper, hyprlock, hyprpolkitagent, waybar, wlogout, wofi, kitty, nwg-look, xdg-desktop-portal-hyprland, xdg-desktop-portal-gtk, nautilus, git, ttf-font-awesome, ttf-jetbrains-mono-nerd, and wget.

#Copying files
if [ ! -d ~/.config/hypr ]; then
	mkdir  ~/.config/hypr
fi
cp -r hypr/* ~/.config/hypr/

if [ ! -d ~/.config/alacritty ]; then
	mkdir  ~/.config/alacritty
fi
cp -r alacritty/* ~/.config/alacritty/

mv wallpaper ~/.config/

if [ ! -d ~/.config/waybar ]; then
	mkdir ~/.config/waybar
fi
cp -r waybar/* ~/.config/waybar/

if [ ! -d ~.config/wlogout ]; then
	mkdir ~/.config/wlogout
fi
cp -r wlogout/* ~/.config/wlogout/

if [ ! -d ~/.config/wofi ]; then
	mkdir ~/.config/wofi
fi
cp -r wofi/* ~/.config/wofi/

# Setting the wallpaper scripts to be executable
cd ~/.config/hypr/scripts
chmod +x change_wallpaper.sh change_wallpaper_timer.sh change_wallpaper_wrapper.sh

cd /tmp/
rm -rf DotFiles

# WARNING: The following packages are required for the next steps: nwg-look, xdg-desktop-portal-gtk, and xdg-desktop-portal-hyprland.

# Installing Icons (Suru++ combined with Adwaita++)
git clone https://github.com/Bonandry/adwaita-plus.git
cd adwaita-plus
chmod +x install.sh && ./install.sh
cd ..
rm -rf adwaita-plus

git clone https://github.com/gusbemacbe/suru-plus-folders.git
cd suru-plus-folders
chmod +x install.sh && ./install.sh
cd ..
rm -rf suru-plus-folders

# Applying the icon theme and switching to 'Dark Mode'
suru-plus-folders -C purple --theme Adwaita++
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita++'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
nwg-look -a

printf "\nDONE AND ENJOY :D\n"
