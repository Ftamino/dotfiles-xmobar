![desktop](https://user-images.githubusercontent.com/83065176/170823009-9a9f9c55-4316-4305-b3bb-ad1d6dbb7a3b.png)

## Info

This is my current setup which is using xmonad as a wm. You are able to click the workspace names btw 😎. A list of keybinds will come soon. Feel free to fork it and do sth cool out of it, you dont need to give credits but I would be happy about it. 😁

## Installing 
Disclaimer: The script is not perfect and my not work for everyone or destroy sth. I only tested it on PopOS 22.04 twice. If sth does not work open a issue

Pop! OS, Ubuntu, Linux Mint, Debian, etc:
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
 
Others:
 1. Use your package manager to install dependences (if u dont use the flatpak of flameshot you have to change the hotkey action for it in the xmonad config)
 ```
 xmonad xmobar neofetch lxpolkit dunst rofi picom copyq volumeicon nitrogen emacs kitty git flameshot
 ```
 2. Download the repo
 ```
 git clone https://github.com/Ftamino/dotfiles.git dotfiles
 ```
 3. Find out where the files need to go (look at the ubuntnu install script)
