echo Starting Installer
echo Updating

sudo apt update
sudo apt upgrade -y

echo Install dependencies

sudo apt install xmonad xmobar neofetch lxpolkit dunst rofi picom copyq volumeicon nitrogen emacs kitty

echo Making xmonad dir
mkdir /home/*/.xmonad

echo Copying Configs

cp -r ./config/dunst /home/*/.config/
cp -r ./config/neofetch /home/*/.config/
cp ./config/picom/picom.conf /home/*/.config/
cp -r ./config/volumeicon /home/*/.config/
cp -r ./xmonad/* /home/*/.xmonad/

echo Installed
