     --Base
import XMonad
import System.Exit
import qualified XMonad.StackSet as W

     --Actions
import XMonad.Actions.MouseResize

    -- Data
import Data.Maybe (fromJust)
import Data.Char (isSpace)
import Data.Monoid
import qualified Data.Map        as M

    -- Hooks
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog 
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers

    -- Layouts
import XMonad.Layout.Grid
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoBorders
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.MultiColumns
import XMonad.Layout.SimpleFloat

   -- Utilities
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.Loggers
import XMonad.Util.Cursor

--Here you can set a color scheme
--Avaiable:
--Standart: Greenish thing
  --StandartSolid: Standart but without transperency in the top
--Nord: Nord you know
  --Nord Solid: Nord but without transperency in the top
--Solarized: a bit old feeling (;
  --Solarized Solid: Solarized without transperency in the top
import Colors.Standart

--Defaults

myTerminal      = "kitty"

myBrowser       = "google-chrome"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth   = 2

myModMask       = mod4Mask

myFont = "xft:GE Inspira:wight=bold:pixelsize=13:antialias=true:hinting=true"

myWorkspaces = [" <fn=1> \xf268 </fn> "," <fn=1> \xf17c </fn> "," <fn=1> \xfb6e </fn> "," <fn=1> \xf03d </fn> "," <fn=1> \xf11b </fn> "," <fn=1> \xf16a </fn> "," <fn=1> \xf001 </fn> "," <fn=1> \xf03e </fn> "," <fn=1> \xf07c </fn> "]
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..]

clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>"
    where i = fromJust $ M.lookup ws myWorkspaceIndices


myNormalBorderColor  = colorBack
myFocusedBorderColor = colorFore

---------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
   -- launch a terminal
    [ 
    ((modm,               xK_t), spawn "kitty") 
    
   
    -- launch rofi
    , ((modm, xK_y), spawn "rofi -modi run,drun -show drun -show-icons -sidebar-mode")
 
    --launch browser
    , ((modm,               xK_c     ), spawn myBrowser)

    --launch flameshot gui
    , ((0,               xK_Print ), spawn "/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=flameshot org.flameshot.Flameshot gui")

    --open the xmonad.hs config with emacs
    , ((modm,            xK_F10 ), spawn "emacs ~/.xmonad/xmonad.hs")
    
    --Media keys
    , ((0, 0x1008ff13), spawn "amixer set Master 5%+ unmute")
    , ((0, 0x1008ff11), spawn "amixer set Master 5%- unmute")
    , ((0, 0x1008ff12), spawn "amixer set Master 100%- unmute")

    , ((modm,            xK_F12 ), spawn "python3 ~/.configuration.py")

    -- close focused window
    , ((modm,               xK_q    ), kill)

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

    -- Quit Dialog
    , ((modm .|. shiftMask, xK_o     ), spawn "python3 /home/finn/.logout-manager.py")

    -- Restart xmonad
    , ((modm              , xK_z     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


----------------------------------------------------------------------
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

------------------------------------------------------------------------
-- Layouts:

myLayout = toggleLayouts (noBorders Full) (avoidStruts (Tall 1 (3/100) (1/2) ||| Grid ||| multiCol [1] 1 0.01 (-0.5) ||| Mirror (Tall 1 (3/100) (3/5))  ))                           
                          
-------------------------------------------------------------------------
-- Window rules:

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
    , className =? "flameshot"                            --> doFloat
    , className =? "discord"                              --> doShift ( myWorkspaces !! 2 )
    -- , isFullscreen --> doFullFloat
    , isDialog --> doFloat
    ]

------------------------------------------------------------------------
-- Event handling

myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

--myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

myStartupHook = do

        --Start nitrogen for wallpaper
        spawnOnce "nitrogen --restore &"

        --Start Trayer on Monitor 1
        spawn ("killall trayer; trayer --monitor 1 --edge top --align right --SetDockType true --expand true --widthtype request " ++ colorTrayer ++ " --height 19")

        -- Start Notfiaction Service
        spawn "killall dunst; dunst"

        --Spawn Flameshot
        spawn "/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=flameshot org.flameshot.Flameshot"

        --Spawn Discord
        --spawn "/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=discord com.discordapp.Discord"

        --Set default Cursor
        setDefaultCursor xC_left_ptr

        --Spawn Volumeicon
        --spawn "killall volumeicon; volumeicon"

        --Laucnch Kde Connect Indicator
        --spawn "kdeconnect-indicator"

        --Spawn Streamdeck UI
        spawn "killall streamdeck; ~/.local/bin/streamdeck -n"

        --Setup screens correctly
        spawn "~/.xmonad/screenlayout/main.sh"

        --Start open RGB with a color
        spawn "killall openrgb; openrgb -c 16FD31 --startminimized"

        --Start lxpolkit for authentication
        spawn "lxpolkit &"

        --Spwan picom
        spawn "killall picom; sleep 2; picom &"

        --Spawn CopyQ
        spawn "copyq &"


------------------------------------------------------------------------
-- Main Function

main = do
  xmproc0 <- spawnPipe ("killall xmobar; sleep 3; xmobar -x 1 ~/.xmonad/xmobar/" ++ colorName0 ++ "")
  xmproc <- spawnPipe ("killall xmobar; sleep 3; xmobar -x 0 ~/.xmonad/xmobar/" ++ colorName ++ "")
  xmonad $ ewmh . docks $ def {logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = \x -> hPutStrLn xmproc x
                                        >> hPutStrLn xmproc0 x
                        , ppVisible = xmobarColor color01 "" . clickable
                        , ppCurrent = xmobarColor color02 ""
                        , ppHidden = xmobarColor color04 "" . wrap
                           ("<box type=Bottom width=2 color=" ++ color05 ++ ">")"</box>" . clickable
                        , ppHiddenNoWindows = xmobarColor color06 "" . clickable
                        , ppLayout = xmobarColor color08 ""
                        , ppTitle = xmobarColor color07 "" . shorten 60
                        , ppSep = "<fc=" ++ color09 ++ "> | </fc>"
                        --Uncomment below to remove the layout 
                        --, ppOrder = \(ws:_:l:_) -> [ws,l]
                        }

        ,terminal           = myTerminal
        ,focusFollowsMouse  = myFocusFollowsMouse
        ,clickJustFocuses   = myClickJustFocuses
        ,borderWidth        = myBorderWidth
        ,modMask            = myModMask
        ,workspaces         = myWorkspaces
        ,normalBorderColor  = myNormalBorderColor
        ,focusedBorderColor = myFocusedBorderColor
        ,keys               = myKeys
        ,mouseBindings      = myMouseBindings
        ,layoutHook         = myLayout
        ,manageHook         = myManageHook 
        ,handleEventHook    = myEventHook -- <+> fullscreenEventHook
        ,startupHook        = myStartupHook
    }
