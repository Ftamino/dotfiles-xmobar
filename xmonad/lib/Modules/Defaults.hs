module Modules.Defaults where

import XMonad
import Colors.NordSolid
import qualified Data.Map        as M
import Data.Maybe (fromJust)

myTerminal      = "kitty"
myBrowser = "google-chrome"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myClickJustFocuses :: Bool
myClickJustFocuses = False
myModMask       = mod4Mask
myFont = "xft:GE Inspira:wight=bold:pixelsize=13:antialias=true:hinting=true"
myWorkspaces = [" <fn=1> \xf268 </fn> ",
                " <fn=1> \xf17c </fn> ",
                " <fn=1> \xfb6e </fn> ",
                " <fn=1> \xf03d </fn> ",
                " <fn=1> \xf11b </fn> ",
                " <fn=1> \xf16a </fn> ",
                " <fn=1> \xf001 </fn> ",
                " <fn=1> \xf03e </fn> ",
                " <fn=1> \xf07c </fn> "]
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..]
clickable ws = "<action=xdotool key super+"++show i++">"++ws++"</action>" 
    where i = fromJust $ M.lookup ws myWorkspaceIndices
myNormalBorderColor  = colorBack 
myFocusedBorderColor = colorFore
