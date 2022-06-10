# Info

This is my current setup which is using xmonad as a wm. You are able to click the workspace names btw 😎. A list of keybinds will come soon. Feel free to fork it and do sth cool out of it, you dont need to give credits but I would be happy about it. 😁

## What's included?

Xmonad as a window manager 

Xmobar as a panel for the top 

Trayer for the system tray

Dunst for notifications

Flameshot as a screenshot tool

Kitty as the terminal

Qclip as a clipboard manager

Picom for the rounded corners and transperency

Lxpolkit for apps that need authentication

Rofi to get the run promt (Super+Y)

Volumeicon for the volume indicator (To get it working uncomment some lines in startup hook)

A costum Python Application to configure themes

Emacs as a Text Editor (I would reccomend intalling doom emacs)

# Themes

[Make your own theme](https://github.com/Ftamino/dotfiles#themeing)
  ## Standart (trasnsperent)
  ![standart](https://user-images.githubusercontent.com/83065176/173049288-e32979f1-a706-4b0f-8a14-1b4ea4ef4505.png)
  ## Standart (solid)
  ![standart-solid](https://user-images.githubusercontent.com/83065176/173049614-06468254-c50d-4831-a302-60686fdaaaf3.png)
  ## Nord (trasnsperent)
 ![nord](https://user-images.githubusercontent.com/83065176/173049724-bdbab4e6-6eaf-46bf-b14f-f7a518a60821.png)
  ## Nord (solid)
  ![nord-solid](https://user-images.githubusercontent.com/83065176/173049916-c36141db-75a1-4a72-a15a-11278ab03eb5.png)
  ## Solarized (trasnsperent)
![solarized](https://user-images.githubusercontent.com/83065176/173050234-bdd0d3ca-fb55-4111-9ae0-d849908fe4c4.png)
  ## Solarized (solid)
![solarized-solid](https://user-images.githubusercontent.com/83065176/173050299-9793d395-2830-46a7-8091-1e1c7c360927.png)

## Themeing

To change Themes use the Python Programm. A simple python3 ./configuration.py should do it.
To make your own theme just go into .xmonad/lib/colors and copy one of the .hs files. Give it a new name and change in line 1 behind "Colors." the eg Standart to the name of your file. In line five to the same. Change the scheme in xmonad.hs in the imports section by changing the argument import Colors.Standart to the name of yours.
 
# Installing 
Disclaimer: The script is not perfect and my not work for everyone or destroy sth. I only tested it on PopOS 22.04 twice. If sth does not work open a issue

## Pop! OS, Ubuntu, Linux Mint, Debian, etc:
 1. Install dependences
```
sudo apt install git
```
 2. Download the repo
```
git clone https://github.com/Ftamino/dotfiles.git dotfiles
```
 3. Go into the downloaded dir
```
cd dotfiles
```
 4. Give the script permissions 
```
chmod +x ./install-ubuntu.sh
```
 5. Run it
```
./install-ubuntu.sh
```
 6. To get the icons in xmobar (top bar) you need to install [Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip)

 Done
 
## Arch and Arch based:

 1. Install dependences
```
sudo pacman -S git
```
 2. Download the repo
```
git clone https://github.com/Ftamino/dotfiles.git dotfiles
```
 3. Go into the downloaded dir
```
cd dotfiles
```
 4. Give the script permissions 
```
chmod +x ./install-arch.sh
```
 5. Run it
```
./install-arch.sh
```
 6. To get the icons in xmobar (top bar) you need to install [Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip)

 Done

Others:
 1. Use your package manager to install dependences (if u dont use the flatpak of flameshot you have to change the hotkey action for it in the xmonad config)
 ```
 xmonad xmobar neofetch lxpolkit dunst rofi picom copyq volumeicon nitrogen emacs kitty git flameshot arandr
 ```
 2. Download the repo
 ```
 git clone https://github.com/Ftamino/dotfiles.git dotfiles
 ```
 3. Find out where the files need to go (look at the ubuntnu install script)
