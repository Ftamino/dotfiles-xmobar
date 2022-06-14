echo Starting Installer for Arch Linux

echo Install dependencies

sudo pacman -S xmonad xmobar neofetch lxpolkit dunst rofi picom copyq fish nitrogen emacs kitty flatpak arandr python3 

flatpak install flameshot

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo Installing fish Theme
omf install bobthefish

echo Installing Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo Install Nerd Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip
unzip 3270.zip -d ~/.fonts
fc-cache -fv

echo Making xmonad dir
mkdir ~/.xmonad

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


echo Installed
