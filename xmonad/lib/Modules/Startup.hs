module Modules.Startup where

import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Util.SpawnOnce
import XMonad.Util.Cursor
import Colors.NordSolid

myStartupHook = do
        --Start nitrogen for wallpaper 
        spawnOnce "nitrogen --restore &"
        
        --Start Trayer on Monitor 1 
        spawn ("killall trayer; trayer --monitor 1 --edge top --align right --SetDockType true --expand true --widthtype request " ++ colorTrayer ++ " --height 19")
        
        -- Start Notfiaction Service 
        spawn "killall dunst; dunst"
        
        --Spawn Flameshot (flatpak)
        spawn "/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=flameshot org.flameshot.Flameshot"

        --Set default Cursor 
        setDefaultCursor xC_left_ptr
        
        --Spawn oversteer (can be removed when you dont have a sterring wheel)
        spawn "oversteer -p Profil1"
                    
        --Spawn Streamdeck UI 
        spawn "killall streamdeck; ~/.local/bin/streamdeck -n"
        
        --Setup screens correctly 
        spawn "~/.xmonad/screenlayout/main.sh"
        

        --Start lxpolkit for authentication 
        spawn "lxpolkit &"
       
        --Spwan picom 
        spawn "killall picom; sleep 2; picom &"
        
        --Spawn CopyQ 
        spawn "copyq &"
        
        --Spawn Emacs deamon
        spawn "/usr/bin/emacs --daemon"
         
        --Simulate a de to get some java programms working 
        setWMName "LG3D"
  
        --Laucnch Kde Connect Indicator 
        --spawn "kdeconnect-indicator"
        
        --Start open RGB with a color 
        --spawn "/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=openrgb org.openrgb.OpenRGB "
        
        --Spawn Volumeicon
        --spawn "killall volumeicon; volumeicon"
                  
        --Spawn Discord (flatpak)
        --spawn "/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=discord com.discordapp.Discord"                  
