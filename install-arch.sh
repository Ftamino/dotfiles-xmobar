echo Starting Installer for Arch Linux

echo Install dependencies

sudo pacman -S xmonad xmobar neofetch lxpolkit dunst rofi picom copyq fish nitrogen emacs kitty flatpak arandr python3 

flatpak install flameshot

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo Making xmonad dir
mkdir ~/.xmonad

echo Copying Configs

cp  ./configuration.py ~/.configuration.py
cp -r ./config/dunst ~/.config/
cp -r ./config/neofetch ~/.config/
cp ./config/picom/picom.conf ~/.config/
cp -r ./config/volumeicon ~/.config/
cp -r ./xmonad/* ~/.xmonad/

echo Installed
