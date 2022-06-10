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

Emacs as a Text Editor (I would reccomend intalling doom emacs)

# Themes

  ## Standart (trasnsperent)
  ![standart](https://user-images.githubusercontent.com/83065176/173049288-e32979f1-a706-4b0f-8a14-1b4ea4ef4505.png)
  ## Standart (solid)
  ![standart-solid](https://user-images.githubusercontent.com/83065176/173049614-06468254-c50d-4831-a302-60686fdaaaf3.png)
  ## Nord (trasnsperent)
 ![nord](https://user-images.githubusercontent.com/83065176/173049724-bdbab4e6-6eaf-46bf-b14f-f7a518a60821.png)
  ## Nord (solid)
  
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
 
Lazy Ubuntu: 
```
sudo apt install git; git clone https://github.com/Ftamino/dotfiles.git dotfiles; cd dotfiles; chmod +x ./install-ubuntu.sh; ./install-ubuntu.sh
```

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
