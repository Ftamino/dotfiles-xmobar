echo Starting Installer
echo Updating

sudo apt update
sudo apt upgrade -y

echo Install dependencies

sudo apt install xmonad xmobar neofetch lxpolkit dunst rofi picom copyq volumeicon nitrogen emacs kitty flatpak arandr python3 

flatpak install flameshot

echo Making xmonad dir
mkdir ~/.xmonad

echo Copying Configs

cp -r ./config/dunst ~/.config/
cp -r ./config/neofetch ~/.config/
cp ./config/picom/picom.conf ~/.config/
cp -r ./config/volumeicon ~/.config/
cp -r ./xmonad/* ~/.xmonad/

echo Installed
