module Colors.Nord where

import XMonad

colorScheme = "nord"

colorBack = "#2E3440" --Color for border of a unfocused window
colorFore = "#5fb3b3" --Color for border of a focused window

color01 = "#81A1C1" --Color for visible workspace in xmobar
color02 = "#EC5f67" --Color for current workspace in xmobar
color03 = "#99C794" --Color for the bar under current workspace in xmobar
color04 = "#FAC863" --Color for invisible workspace in xmobar
color05 = "#6699cc" --Color for the bar under invisible workspace with window in xmobar
color06 = "#c594c5" --Color for invisible workspace with no windows in xmobar
color07 = "#81A1C1" --Color for window title in xmobar
color08 = "#d8dee9" --Color for window layout in xmobar
color09 = "#343d46" --Color for Seperator in xmobar
color10 = "#EC5f67" --
color11 = "#99C794" --
color12 = "#FAC863" --
color13 = "#6699cc" --UNUSED COLORS
color14 = "#c594c5" --
color15 = "#5fb3b3" --
color16 = "#d8dee9" --
colorName = "nord.conf" --Sets color for xmobar on monitor 1
colorName0 = "nord0.conf" --Sets color for xmobar on monitor 2

colorTrayer :: String
colorTrayer = "--transparent true --alpha 256 --tint 0xCACAEF --edge top --align right --widthtype request --heighttype pixel --height 30 --SetDockType true --SetPartialStrut true --distance 10 --margin 20" --Alpha for trayer (256=transperent; 0=solid)

