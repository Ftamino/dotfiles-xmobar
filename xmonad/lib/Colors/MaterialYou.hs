module Colors.MaterialYou where

import XMonad

colorScheme = "standart"

colorBack = "#9E9A35" --Color for border of a unfocused window
colorFore = "#65651C" --Color for border of a focused window

color01 = "#65651C" --Color for visible workspace in xmobar
color02 = "#827D39" --Color for current workspace in xmobar
color03 = "#9A9A9E" --Color for the bar under current workspace in xmobar
color04 = "#9E9A35" --Color for invisible workspace in xmobar (with windows on it)
color05 = "#65651C" --Color for the bar under invisible workspace with window in xmobar
color06 = "#353510" --Color for invisible workspace with no windows in xmobar
color07 = "#353510" --Color for window title in xmobar
color08 = "#353510" --Color for window layout in xmobar
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
colorTrayer = "--transparent true --alpha 0 --tint 0xCACAEF --edge top --align right --widthtype request --heighttype pixel --height 30 --SetDockType true --SetPartialStrut true --distance 10 --margin 20" --Alpha for trayer (256=transperent; 0=solid)
