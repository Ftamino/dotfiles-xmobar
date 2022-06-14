echo Starting Installer
echo Updating

sudo apt update
sudo apt upgrade -y

echo Install dependencies

sudo apt install -y xmonad xmobar neofetch lxpolkit dunst fish rofi picom copyq nitrogen emacs kitty flatpak arandr python3 

flatpak install flameshot

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo Install Fish Theme
omf install bobthefish

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
