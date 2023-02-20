module Modules.Manage where

import XMonad
import Modules.Layout (myLayout)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog 
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import Modules.Defaults

myManageHook = composeAll 
    [ 
      title =? "GNU Image Manipulation Program"           --> doShift ( myWorkspaces !! 7 )
    , title =? "GIMP-Start"                               --> doShift ( myWorkspaces !! 7 ) 
    , title =? "ATLauncher"                               --> doFloat
    , title =? "xmessage"                                 --> doCenterFloat 
    , title =? "shutdown-menu"                            --> doCenterFloat 
    , title =? "Farbe des ausgewählten Texts ändern"      --> doCenterFloat 
    , title =? "Dateien öffnen"                           --> doCenterFloat 
    , title =? "Skripte"                                  --> doCenterFloat 
    , title =? "Change Browser"                           --> doCenterFloat 
    , className =? "flameshot"                            --> doFloat 
    , className =? "discord"                              --> doShift ( myWorkspaces !! 2 )     
    , isDialog --> doFloat
    , isFullscreen --> doFullFloat  
    ]
