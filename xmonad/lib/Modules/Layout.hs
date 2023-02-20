module Modules.Layout where

import XMonad
import XMonad.Layout.Grid
import XMonad.Layout.Gaps
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoBorders
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.MultiColumns
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import Modules.Defaults

myLayout = toggleLayouts (noBorders Full)
  $ avoidStruts 
  $ smartSpacing 4 
  $ Tall 1 (3/100) (1/2) 
  ||| Grid 
  ||| multiCol [1] 1 0.01 (-0.5) 
  ||| Mirror (Tall 1 (3/100) (3/5))
