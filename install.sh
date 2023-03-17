#!/bin/bash

echo Starting Installer
echo Updating

#if [ -f /etc/debian_version ]; then
#  sudo apt update
#  sudo apt upgrade -y
#elif [ -f /etc/arch-release ]; then
#  sudo pacman -Syu
#else
#  echo "Unsupported distribution."
#  exit 1
#fi

echo Install dependencies

#if [ -f /etc/debian_version ]; then
#  sudo apt-get install -y xmonad xmobar neofetch lxpolkit dunst fish picom copyq nitrogen emacs kitty flatpak arandr python3 curl wget 
#elif [ -f /etc/arch-release ]; then
#  sudo pacman -S xmonad xmobar neofetch lxpolkit dunst fish picom copyq nitrogen emacs kitty flatpak arandr python3 curl wget
#  flatpak install flameshot
#else
#  echo "Unsupported distribution."
#  exit 1
#fi

echo Install Fish Theme
curl -L https://get.oh-my.fish | fish
omf install bobthefish

echo Installing Doom Emacs
rm -rf ~/.emacs.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo Install Nerd Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip
unzip 3270.zip -d ~/.fonts
fc-cache -fv

echo Copying Configs

cp  ./configuration.py ~/.configuration.py
cp -r ./config/dunst ~/.config/
cp -r ./config/neofetch ~/.config/
cp ./config/picom/picom.conf ~/.config/
cp -r ./config/volumeicon ~/.config/
cp -r ./xmonad/* ~/.xmonad/
cp ./configuration.py ~/.configuration.py
cp ./initial-setup.py ~/.initial-setup.py
cp ./logout-manager.py ~/.logout-manager.py

echo Making xmonad dir
mkdir -p ~/.xmonad

echo Installed

# prompt user for rofi themes installation
echo "Do you want to install rofi themes? (y/n)"
read install_rofi_themes

if [[ $install_rofi_themes =~ ^[Yy]$ ]]
then
  if [ -f /etc/debian_version ]; then
    sudo apt-get install -y git
  elif [ -f /etc/arch-release ]; then
    sudo pacman -S git
  else
    echo "Unsupported distribution."
    exit 1
  fi

  git clone https://github.com/lr-tech/rofi-themes-collection.git
  cd rofi-themes-collection
  mkdir -p ~/.local/share/rofi/themes/
  cp themes/* ~/.local/share/rofi/themes/
  cd
  git clone --depth=1 https://github.com/adi1090x/rofi.git
  cd rofi
  chmod +x setup.sh
  ./setup.sh
  cd
fi

