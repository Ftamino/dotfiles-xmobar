--Base
import XMonad
import System.Exit
import qualified Data.Map        as M
-- Hooks
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog 
import XMonad.Hooks.EwmhDesktops
-- Utilities
import XMonad.Util.Run
-- Modules
import Modules.Keys (myKeys)
import Modules.MouseKeys (myMouseBindings)
import Modules.Layout (myLayout)
import Modules.Defaults
import Modules.Startup (myStartupHook)
import Modules.Manage (myManageHook)

import Colors.NordSolid

myEventHook = mempty
myBorderWidth   = 2

main = do 
  xmproc0 <- spawnPipe ("killall xmobar; sleep 3; xmobar -x 1 ~/.xmonad/xmobar/" ++ colorName0 ++ "")
  xmproc1 <- spawnPipe ("killall xmobar; sleep 3; xmobar -x 1 ~/.xmonad/xmobar/nord1-solid.conf")
  xmproc <- spawnPipe ("killall xmobar; sleep 3; xmobar -x 0 ~/.xmonad/xmobar/" ++ colorName ++ "") 
  xmonad $ ewmh $ docks $ def {logHook = dynamicLogWithPP $ xmobarPP 
                        { ppOutput = \x -> hPutStrLn xmproc x 
                                        >> hPutStrLn xmproc0 x                                        
                                        >> hPutStrLn xmproc1 x 
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
        ,keys               = \c -> myKeys c `M.union` keys def c 
        ,mouseBindings      = myMouseBindings 
        ,layoutHook         = myLayout 
        ,manageHook         = myManageHook  
        ,handleEventHook    = myEventHook -- <+> fullscreenEventHook 
        ,startupHook        = myStartupHook 
    }
