#!/bin/bash

#Find current wallpaper of nitrogen
IMAGE="$(grep -a -m 1 -h -r file= ~/.config/nitrogen/bg-saved.cfg | cut --characters=6-200)"

#Copy current wallpaper as a backup and delete older ones
IMAGEBACKUP="$(echo "${IMAGE}.backup.png")" 

cp $IMAGE $IMAGEBACKUP

#Generate the palette
echo "Generating Colors..."

ffmpeg -i $IMAGEBACKUP -vf palettegen=max_colors=10 mat-you.png

convert mat-you.png -colors 8 -depth 6 txt:- | sed -e "1d;s/.* #/#/;s/ .*//" | awk '!/^#00000000/' | head -n20 | sort -u | tr -d 'FF' > log.txt

rm mat-you.png
rm $IMAGEBACKUP

sed -i 's/import Colors.*/import Colors.MaterialYou/g' ~/.xmonad/xmonad.hs
sed -i 's/import Colors.*/import Colors.MaterialYou/g' ~/.xmonad/lib/Modules/Defaults.hs
sed -i 's/import Colors.*/import Colors.MaterialYou/g' ~/.xmonad/lib/Modules/Startup.hs

rm ~/.xmonad/lib/Colors/MaterialYou.hs
rm ~/.xmonad/xmobar/materialYou.conf
rm ~/.xmonad/xmobar/materialYou0.conf
cp ~/.xmonad/material-you/MaterialYouTemplate.hs ~/.xmonad/lib/Colors/MaterialYou.hs
cp ~/.xmonad/material-you/materialYouTemplate.conf ~/.xmonad/xmobar/materialYou.conf
cp ~/.xmonad/material-you/materialYouTemplate0.conf ~/.xmonad/xmobar/materialYou0.conf

#Monitors Config
cp ~/.xmonad/screenlayout/main.sh ~/tmp.matyou 

#cat ~/tmp.matyou | tr -d 'randr' | tr -d 'output' | tr -d 'off' | tr -d 'mode' | tr -d 'pos' | tr -d 'rotate' | tr -d '#!/bin/sh' > tmp.matyou

#Change the colors
echo "Applying colors to theme..."

COLOR1="$(head -n 1 log.txt | tail -1)"
COLOR2="$(head -n 2 log.txt | tail -1)"
COLOR3="$(head -n 3 log.txt | tail -1)"
COLOR4="$(head -n 4 log.txt | tail -1)"
COLOR5="$(head -n 5 log.txt | tail -1)"

sed -i 's/color01 = "02color"*/color01 = "'$COLOR2'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs
sed -i 's/color02 = "03color"*/color02 = "'$COLOR3'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs
sed -i 's/color03 = "04color"*/color03 = "'$COLOR4'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs
sed -i 's/color04 = "05color"*/color04 = "'$COLOR5'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs
sed -i 's/color05 = "02color"*/color05 = "'$COLOR2'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs
sed -i 's/color06 = "01color"*/color06 = "'$COLOR1'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs
sed -i 's/color07 = "01color"*/color07 = "'$COLOR1'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs
sed -i 's/color08 = "01color"*/color08 = "'$COLOR1'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs

sed -i 's/colorBack = "05color"*/colorBack = "'$COLOR5'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs
sed -i 's/colorFore = "02color"*/colorFore = "'$COLOR2'"/g' ~/.xmonad/lib/Colors/MaterialYou.hs

sed -i 's/01color/'$COLOR1'/g' ~/.xmonad/xmobar/materialYou.conf
sed -i 's/01color/'$COLOR1'/g' ~/.xmonad/xmobar/materialYou0.conf

#Invert a color to get a background for xmobar and applay it to xmobar and trayer
printf -v color '#%06X' $((0x${COLOR1#\#} ^ 0xFFFFFF))

sed -i 's/00color/'$color'/g' ~/.xmonad/xmobar/materialYou.conf
sed -i 's/00color/'$color'/g' ~/.xmonad/xmobar/materialYou0.conf

color="$(echo $color | tr -d '#')"

sed -i 's/colorTrayBack/'$color'/g' ~/.xmonad/lib/Colors/MaterialYou.hs

#restart
xmonad --restart
