#!/bin/sh

echo "Installing all packages"
pacman --noconfirm -S xorg-server xorg-xrdb xorg-xinit xorg-xwininfo sxiv mpv dunst libnotify vim pulseaudio-alsa pulsemixer pamixer \
  noto-fonts-emoji noto-fonts noto-fonts-cjk qutebrowser youtube-dl fzf xclip maim unclutter xdotool zip unzip picom \
  zathura zathura-pdf-mupdf ffmpeg xwallpaper sxhkd ttf-joypixels ttf-jetbrains-mono mumble cowsay aria2 wget zsh

echo "Cloning suckless programs (dwm st dmenu)"
git clone https://github.com/bugswriter/dwm.git
git clone https://github.com/bugswriter/st.git
git clone https://github.com/lukesmithxyz/dmenu.git
git clone https://github.com/bugswriter/dwmblocks.git

echo "Installing programs"
cd dwm && make install && cd ..
cd st && make install && cd ..
cd dmenu && make install && cd ..
cd dwmblocks && make install && cd ..

echo "Cleaning up"
rm -rf dwm dmenu st

echo "Getting dotfiles"
git clone https://github.com/royalzeroo/dotfiles
# mv dotfiles/.* . && rm -rf dotfiles
#copy all files in dorfiles with the recursive comand
#cp -r directory 1 directory 2


# xinitrc stuff bitch
cp /etc/X11/xinit/xinitrc ~/.xinitrc
sed -i -r '/^\s*$/d' ~/.xinitrc
echo "dwmblocks &" >> ~/.xinitrc
echo "picom &" >> ~/.xinitrc
echo "setbg ~/.config/wall.png" >> ~/.xinitrc
echo "while true; do" >> ~/.xinitrc
echo "  exec dwm >/dev/null 2>&1" >> ~/.xinitrc
echo "done" >> ~/.xinitrc
echo "exec dwm" >> ~/.xinitrc


# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/random/alanpeabody/g' ~/.zshrc
echo "PATH='/home/radiation/.local/bin:$PATH'" >> ~/.xinitrc

