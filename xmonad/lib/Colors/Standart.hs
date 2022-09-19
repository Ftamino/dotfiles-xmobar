module Colors.Standart where

import XMonad

colorScheme = "standart"

colorBack = "#ABB8C3" --Color for border of a unfocused window
colorFore = "#166AE0" --Color for border of a focused window

color01 = "#00C504" --Color for visible workspace in xmobar
color02 = "#E41266" --Color for current workspace in xmobar
color03 = "#15D452" --Color for the bar under current workspace in xmobar
color04 = "#06BD92" --Color for invisible workspace in xmobar (with windows on it)
color05 = "#00C504" --Color for the bar under invisible workspace with window in xmobar
color06 = "#06BD92" --Color for invisible workspace with no windows in xmobar
color07 = "#06BD92" --Color for window title in xmobar
color08 = "#1ED5D5" --Color for window layout in xmobar
color09 = "#455A64" --Color for Seperator in xmobar
color10 = "#EC5f67" --
color11 = "#99C794" --
color12 = "#FAC863" --
color13 = "#6699cc" --UNUSED COLORS
color14 = "#c594c5" --
color15 = "#5fb3b3" --
color16 = "#d8dee9" --
colorName = "xmobar.conf" --Xmobar Config to be used for mon 1
colorName0 = "xmobar0.conf"  --Xmobar Config to be used for mon 2

colorTrayer :: String
colorTrayer = "--transparent true --alpha 256 --tint 0xCACAEF --edge top --align right --widthtype request --heighttype pixel --height 30 --SetDockType true --SetPartialStrut true --distance 10 --margin 20" --Alpha for trayer (256=transperent; 0=solid)
