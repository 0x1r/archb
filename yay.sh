#!/bin/bash
git clone https://aur.archlinux.org/yay-git.git
chown -R radiation:radiation ./yay-git
cd yay-git
makepkg -si
#install libxft-bgra from yay 
# these from pacman libx11 libxinerama webkit2gtk base-devel ttf-joypixels 
