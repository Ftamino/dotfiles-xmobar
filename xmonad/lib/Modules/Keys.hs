module Modules.Keys where

import XMonad

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Layout.ToggleLayouts

import XMonad.Actions.MouseResize
import XMonad.Actions.FloatKeys

import XMonad.Hooks.SetWMName

import XMonad.Util.SpawnOnce

import Modules.Layout
import Modules.Defaults

-- Key bindings. Add, modify or remove key bindings here.
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ 
    -- launch a terminal
    ((modm,               xK_t), spawn "kitty") 

    -- launch rofi
    , ((modm, xK_y), spawn "rofi -modi run,drun,window -show drun -show-icons -sidebar-mode") 

    --launch browser 
    , ((modm,               xK_c     ), spawn myBrowser) 

    --launch flameshot gui with fltpak 
    , ((0,               xK_Print ), spawn "/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=flameshot org.flameshot.Flameshot gui")

    --open emacsclient
    , ((modm,            xK_F10 ), spawn "emacsclient -c -a 'emasc'")

    --Media keys 
    , ((0, 0x1008ff13), spawn "amixer set Master 5%+ unmute") 
    , ((0, 0x1008ff11), spawn "amixer set Master 5%- unmute") 
    , ((0, 0x1008ff12), spawn "amixer set Master 100%- unmute")

    --Open Configuration Programm
    , ((modm,            xK_F12 ), spawn "python3 ~/.configuration.py")

    -- close focused window 
    , ((modm,               xK_q    ), kill)

    -- Force kill focused window
    , ((modm .|. shiftMask, xK_q     ), spawn"xkill" )

    -- Rotate through the available layout algorithms 
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default 
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Toggle Fullscreen 
    , ((modm,               xK_F11), sendMessage (Toggle "Full"))

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
      
    -- Move focus to the next window 
    , ((modm,               xK_Tab   ), windows W.focusDown)
    
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
      
    -- Move focus to the previous window 
    , ((modm,               xK_k     ), windows W.focusUp)
    
    -- Move focus to the master window 
    , ((modm,               xK_m     ), windows W.focusMaster)
    
    -- Swap the focused window and the master window 
    , ((modm,               xK_Return), windows W.swapMaster)
    
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_a     ), windows W.swapDown)
    
    -- Swap the focused window with the previous window 
    , ((modm .|. shiftMask, xK_d     ), windows W.swapUp)
    
    -- Shrink the master area 
    , ((modm,               xK_a     ), sendMessage Shrink)
    
    -- Expand the master area
    , ((modm,               xK_d     ), sendMessage Expand)
   
    -- Push window back into tiling 
    , ((modm .|. shiftMask, xK_t     ), withFocused $ windows . W.sink)
    
    -- Quit Dialog (Uncomment the first one to get a simpler logout menu)
    --, ((modm .|. shiftMask, xK_o     ), spawn "python3 ~/.logout-manager.py")
    , ((modm .|. shiftMask, xK_o     ), spawn "~/.config/rofi/powermenu/type-2/powermenu.sh")
    
    -- Restart xmonad 
    , ((modm              , xK_z     ), spawn "xmonad --recompile; xmonad --restart")
    
    --Resize current window to 5760*1200
    , ((modm .|. shiftMask, xK_f), withFocused (keysResizeWindow (5760, 1200) (0, 0)))
    ]
    ++
    -- mod-[1..9], Switch to workspace N 
    -- mod-shift-[1..9], Move client to workspace N
      [((m .|. modm, k), windows $ f i) 
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9] 
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]] 
    ++ 
 
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3  
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f)) 
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..] 
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 
    -- Mouse bindings: default actions bound to mouse events
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w 
                                       >> windows W.shiftMaster))
    
    -- mod-button2, Raise the window to the top of the stack 
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    
    -- mod-button3, Set the window to floating mode and resize by dragging 
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w 
                                       >> windows W.shiftMaster))
    -- you may also bind events to the mouse scroll wheel (button4 and button5) 
    ]
