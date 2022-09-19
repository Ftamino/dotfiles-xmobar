module Colors.Solarized where

import XMonad

colorScheme = "solarized"

colorBack = "#002b36" --Color for border of a unfocused window
colorFore = "#839496" --Color for border of a focused window

color01 = "#b58900" --Color for visible workspace in xmobar
color02 = "#dc322f" --Color for current workspace in xmobar
color03 = "#859900" --Color for the bar under current workspace in xmobar
color04 = "#d33682" --Color for invisible workspace in xmobar with window
color05 = "#268bd2" --Color for the bar under invisible workspace with window in xmobar
color06 = "#d33682" --Color for invisible workspace with no windows in xmobar
color07 = "#eee8d5" --Color for window title in xmobar
color08 = "#eee8d5" --Color for window layout in xmobar
color09 = "#455A64" --Color for Seperator in xmobar
color10 = "#cb4b16" --
color11 = "#586e75" --
color12 = "#657b83" --
color13 = "#839496" --UNUSED COLORS
color14 = "#6c71c4" --
color15 = "#93a1a1" --
color16 = "#fdf6e3" --
colorName = "solarized.conf"  --Xmobar Config to be used for mon 1
colorName0 = "solarized0.conf"  --Xmobar Config to be used for mon 2

colorTrayer :: String
colorTrayer = "--transparent true --alpha 256 --tint 0xCACAEF --edge top --align right --widthtype request --heighttype pixel --height 30 --SetDockType true --SetPartialStrut true --distance 10 --margin 20" --Alpha for trayer (256=transperent; 0=solid)

