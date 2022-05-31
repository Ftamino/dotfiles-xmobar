# Info

This is my current setup which is using xmonad as a wm. You are able to click the workspace names btw 😎. A list of keybinds will come soon. Feel free to fork it and do sth cool out of it, you dont need to give credits but I would be happy about it. 😁

# Themes

  ## Standart (trasnsperent)
  ![standart](https://user-images.githubusercontent.com/83065176/171192508-9170fe4c-e359-44c0-b7f9-9c6a7c79f397.png)
  ## Nord (trasnsperent)
  ![nord](https://user-images.githubusercontent.com/83065176/171192575-fc789119-e4f1-4290-b8a1-6675d7f4b643.png)
  ## Solarized (trasnsperent)
![Solarized](https://user-images.githubusercontent.com/83065176/171192721-8704b56f-3042-47c7-a7f6-bfc3963c74b8.png)


## Themeing

I tried making it as themeable as possible, but its not there yet. The only things you can easily theme is the xmobar PP (the thing that displays workspace names etc in the top bar) and the colors of xmonad itself (window borders). To do this you need to go into xmonad/lib/Colors (or .xmonad/lib/Colors if you have it on your system) and copy the Standart.hs and rename it to eg Yellow.hs. In there change the colors to your liking (some colors dont have a function yet) and edit the xmonad.hs in the bottom of the imports section: "import Colors.Standart". There change Standart to the name you gave to it in the file (at the top). A theming Software is planned but not there yet. 

# Installing 
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
