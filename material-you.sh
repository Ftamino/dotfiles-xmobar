#!/bin/bash

#Find current wallpaper of nitrogen
whiptail --title "Material You" --msgbox "Do you want to start the script. It may not work." 8 78

whiptail --title "Material You" --yesno "Did you install the templates?" 8 78 
if [[ $? -eq 0 ]]; then 
  echo "Templates are installed"
elif [[ $? -eq 1 ]]; then 
  #
    whiptail --title "Material You" --yesno "Install the templates" 8 78 
    if [[ $? -eq 0 ]]; then 
      cp ./MaterialYouTemplate.hs ~/.xmonad/lib/Colors/MaterialYouTemplate.hs 
      cp ./materialYouTemplate.conf ~/.xmonad/xmobar/materialYouTemplate.conf 
      cp ./materialYouTemplate0.conf ~/.xmonad/xmobar/materialYouTemplate0.conf
    elif [[ $? -eq 1 ]]; then 
     exit
    elif [[ $? -eq 255 ]]; then 
     exit
fi 
  #
elif [[ $? -eq 255 ]]; then 
  exit
fi 

IMAGE="$(grep -a -m 1 -h -r file= ~/.config/nitrogen/bg-saved.cfg | cut --characters=6-200)"
if [ $? -eq 0 ]; then
   echo "Nitrogen background detected..."
else
   whiptail --title "Material You" --msgbox "The script couldnt detect nitrogen" 8 78
   exit
fi

#Copy current wallpaper as a backup and delete older ones
IMAGEBACKUP="$(echo "${IMAGE}.backup")" 

cp $IMAGE $IMAGEBACKUP

#Downscale current wallpaper
mogrify -resize 70% $IMAGEBACKUP
if [ $? -eq 0 ]; then
   echo "Downscaling Image..."
else
   whiptail --title "Material You" --msgbox "Please install imagemagik to use this script" 8 78
   exit
fi

#Generate the palette

echo "Generating Colors..."

convert $IMAGEBACKUP -colors 20 -depth 8 txt:- | sed -e "1d;s/.* #/#/;s/ .*//" | awk '!/^#00000000/' | head -n20 | shuf | sort -u | tr -d 'FF' > log.txt

rm $IMAGEBACKUP
if [ $? -eq 0 ]; then
   echo "Sucessfull generated palette..."
else
   echo "Something failed!!! Please contact the dev!!!"
fi
 
sed -i 's/import Colors.*/import Colors.MaterialYou/g' ~/.xmonad/xmonad.hs
rm ~/.xmonad/lib/Colors/MaterialYou.hs
rm ~/.xmonad/xmobar/materialYou.conf
rm ~/.xmonad/xmobar/materialYou0.conf
cp ~/.xmonad/lib/Colors/MaterialYouTemplate.hs ~/.xmonad/lib/Colors/MaterialYou.hs
cp ~/.xmonad/xmobar/materialYouTemplate.conf ~/.xmonad/xmobar/materialYou.conf
cp ~/.xmonad/xmobar/materialYouTemplate0.conf ~/.xmonad/xmobar/materialYou0.conf

#Change the colors
echo "Applying colors to theme..."

COLOR1="$(head -n 5 log.txt | tail -1)"
COLOR2="$(head -n 4 log.txt | tail -1)"
COLOR3="$(head -n 3 log.txt | tail -1)"
COLOR4="$(head -n 2 log.txt | tail -1)"
COLOR5="$(head -n 1 log.txt | tail -1)"

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


#restart xmonad
whiptail --title "Material You" --yesno "Do you want to restart xmonad now?" 8 78 
if [[ $? -eq 0 ]]; then 
  xmonad --restart
elif [[ $? -eq 1 ]]; then 
  whiptail --title "MESSAGE" --msgbox "To apply the theme restart xmonad" 8 78 
elif [[ $? -eq 255 ]]; then 
  exit
fi 

