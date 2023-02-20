module Modules.MouseKeys where

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Layout.ToggleLayouts
import XMonad.Actions.MouseResize
import XMonad.Actions.FloatKeys
import XMonad.Hooks.SetWMName
import XMonad.Util.SpawnOnce
import Modules.Layout
import Modules.Defaults
import XMonad

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

