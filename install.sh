#!/bin/bash

if [[ $1 == "--help" ]]; then
  echo "This script installs various applications and configures them to provide a customized xmonad desktop experience."
  echo "Usage: ./install.sh"
  echo "Options:"
  echo "  --help        Display this help message"
  exit 0
fi

# Set color codes
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"
RESET="\e[0m"

echo -e "${BLUE}Starting Installer${RESET}"
echo -e "${BLUE}Updating${RESET}"

if [ -f /etc/debian_version ]; then
  sudo apt update
  sudo apt upgrade -y
elif [ -f /etc/arch-release ]; then
  sudo pacman -Syu
else
  echo -e "${RED}Unsupported distribution.${RESET}"
  exit 1
fi

echo -e "${BLUE}Install dependencies${RESET}"

if [ -f /etc/debian_version ]; then
  sudo apt-get install -y xmonad xmobar neofetch lxpolkit dunst fish picom copyq nitrogen emacs kitty flatpak arandr python3 curl wget 
elif [ -f /etc/arch-release ]; then
  sudo pacman -S xmonad xmobar neofetch lxpolkit dunst fish picom copyq nitrogen emacs kitty flatpak arandr python3 curl wget
  flatpak install flameshot
else
  echo -e "${RED}Unsupported distribution.${RESET}"
  exit 1
fi

echo -e "${BLUE}Install Fish Theme${RESET}"
curl -L https://get.oh-my.fish
omf install bobthefish

echo -e "${BLUE}Installing Doom Emacs${RESET}"
rm -rf ~/.emacs.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo -e "${BLUE}Install Nerd Fonts${RESET}"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip
unzip 3270.zip -d ~/.fonts
fc-cache -fv

echo -e "${BLUE}Copying Configs${RESET}"

cp  ./configuration.py ~/.configuration.py
cp -r ./config/dunst ~/.config/
cp -r ./config/neofetch ~/.config/
cp ./config/picom/picom.conf ~/.config/
cp -r ./config/volumeicon ~/.config/
cp -r ./xmonad/* ~/.xmonad/
cp ./configuration.py ~/.configuration.py
cp ./initial-setup.py ~/.initial-setup.py
cp ./logout-manager.py ~/.logout-manager.py

echo -e "${BLUE}Making xmonad dir${RESET}"
mkdir -p ~/.xmonad

echo -e "${GREEN}Installed${RESET}"

# prompt user for rofi themes installation
echo -e "${BLUE}Do you want to install rofi themes? (y/n)${RESET}"
read install_rofi_themes

if [[ $install_rofi_themes =~ ^[Yy]$ ]]
then
  if [ -f /etc/debian_version ]; then
    sudo apt-get install -y git
  elif [ -f /etc/arch-release ]; then
    sudo pacman -S git
  else
    echo -e "${RED}Unsupported distribution.${RESET}"
    exit 1
  fi

  git clone https://github.com/lr-tech/rofi-themes-collection.git
  cd rofi-themes-collection
  mkdir -p ~/.local/share/rofi/themes/
  cp themes/* ~/.local/share/rofi/themes/

