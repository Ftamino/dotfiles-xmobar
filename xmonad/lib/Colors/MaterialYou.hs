module Colors.MaterialYou where

import XMonad

colorScheme = "standart"

colorBack = "#733" --Color for border of a unfocused window
colorFore = "#513D35" --Color for border of a focused window

color01 = "#513D35" --Color for visible workspace in xmobar
color02 = "#927971" --Color for current workspace in xmobar
color03 = "#733" --Color for the bar under current workspace in xmobar
color04 = "#733" --Color for invisible workspace in xmobar (with windows on it)
color05 = "#513D35" --Color for the bar under invisible workspace with window in xmobar
color06 = "#1C1818" --Color for invisible workspace with no windows in xmobar
color07 = "#1C1818" --Color for window title in xmobar
color08 = "#1C1818" --Color for window layout in xmobar
color09 = "#455A64" --Color for Seperator in xmobar
color10 = "#EC5f67" --
color11 = "#99C794" --
color12 = "#FAC863" --
color13 = "#6699cc" --UNUSED COLORS
color14 = "#c594c5" --
color15 = "#5fb3b3" --
color16 = "#d8dee9" --
colorName = "materialYou.conf" --Xmobar Config to be used for mon 1
colorName0 = "materialYou0.conf"  --Xmobar Config to be used for mon 2

colorTrayer :: String
colorTrayer = "--transparent true --alpha 0 --tint 0xE3E7E7 --distancefrom right --distance 40" --Alpha for trayer (256=transperent; 0=solid)

