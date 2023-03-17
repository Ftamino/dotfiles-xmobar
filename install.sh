echo Starting Installer
echo Updating

sudo apt update
sudo apt upgrade -y

echo Install dependencies

sudo apt-get install -y xmonad xmobar neofetch lxpolkit dunst fish rofi picom copyq nitrogen emacs kitty flatpak arandr python3 curl wget 
sudo pacman -Sy xmonad xmobar neofetch lxpolkit dunst fish rofi picom copyq nitrogen emacs kitty flatpak arandr python3 curl wget
flatpak install flameshot

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo Install Fish Theme
omf install bobthefish

echo Installing Doom Emacs
rm -rf ~/.emacs.d
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install

echo Install Nerd Fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip
unzip 3270.zip -d ~/.fonts
fc-cache -fv

echo Install rofi Themes

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
