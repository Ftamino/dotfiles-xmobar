#!/bin/bash

whiptail --title "FDots Installer" --yesno "Do you want to start the installer?" 8 78 
if [[ $? -eq 0 ]]; then 
   clear
elif [[ $? -eq 1 ]]; then 
   exit
fi   

# Ask for additonal Packages
ADPKG=$(whiptail --title "FDots Installer" --menu \
"Select a install option please!" 15 60 7 \
"Normal" "Default" \
"Minimal" "Just the minimum"  \
"Custom" "Your own things" 3>&1 1>&2 2>&3)

exitstatus=$?

if [ $exitstatus = 0 ]; then       
        echo "Progressing"
else
	echo "Canceled"
fi

#Install the packages
if [ $ADPKG = "Normal" ]; then
	sudo apt-get install -y xmonad xmobar neofetch lxpolkit dunst fish rofi picom copyq nitrogen emacs kitty flatpak arandr python3 curl wget
	sudo pacman -Sy xmonad xmobar neofetch lxpolkit dunst fish rofi picom copyq nitrogen emacs kitty flatpak arandr python3 curl wget

	#Fish
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
        omf install bobthefish

        #Doom Emacs
        rm -rf ~/.emacs.d
        git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
	~/.emacs.d/bin/doom install
	
	#Nerd Fonts
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip
	unzip 3270.zip -d ~/.fonts
	fc-cache -fv
	
	#Rofi Themes
	git clone https://github.com/lr-tech/rofi-themes-collection.git
	cd rofi-themes-collection
	mkdir -p ~/.local/share/rofi/themes/
	cp themes/* ~/.local/share/rofi/themes/
	cd
	
	mkdir ~/.xmonad
	
	cp  ./configuration.py ~/.configuration.py
	cp -r ./config/dunst ~/.config/
	cp -r ./config/neofetch ~/.config/
	cp ./config/picom/picom.conf ~/.config/
	cp -r ./config/volumeicon ~/.config/
	cp -r ./xmonad/* ~/.xmonad/
	cp ./configuration.py ~/.configuration.py
	cp ./initial-setup.py ~/.initial-setup.py
	cp ./logout-manager.py ~/.logout-manager.py
  
  
elif [ $ADPKG = "Minimal" ]; then
	
	sudo apt-get install -y xmonad xmobar lxpolkit dunst rofi picom nitrogen kitty arandr python3 curl wget
	sudo pacman -Sy xmonad xmobar lxpolkit dunst rofi picom nitrogen kitty arandr python3 curl wget
	
	#Nerd Fonts
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip
	unzip 3270.zip -d ~/.fonts
	fc-cache -fv
	
	#Rofi Themes
	git clone https://github.com/lr-tech/rofi-themes-collection.git
	cd rofi-themes-collection
	mkdir -p ~/.local/share/rofi/themes/
	cp themes/* ~/.local/share/rofi/themes/
	cd
	
	mkdir ~/.xmonad

        cp  ./configuration.py ~/.configuration.py
	cp -r ./config/dunst ~/.config/
	cp ./config/picom/picom.conf ~/.config/
	cp -r ./config/volumeicon ~/.config/
	cp -r ./xmonad/* ~/.xmonad/
	cp ./configuration.py ~/.configuration.py
	cp ./initial-setup.py ~/.initial-setup.py
	cp ./logout-manager.py ~/.logout-manager.py

elif [ $ADPKG = "Custom" ]; then
        
      echo "
______ _______   __
|  _  \_   _\ \ / /
| | | | | |  \ V / 
| | | | | |   \ /  
| |/ / _| |_  | |  
|___/  \___/  \_/  
                   
"                                                                                                           

fi
