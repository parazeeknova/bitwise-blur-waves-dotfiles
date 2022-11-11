#!/usr/bin/env bash

# This script is linked to Graffias.conf and Graffias2.conf lines
# So don't  add or remove a line there unless you change here too

COLOR=${1}

echo "Processing....."
sleep 2s

echo "Stoping Graffias"
killall conky

sleep 0.7s
echo "Creating oval.png"
sleep 0.2s
convert -size 132x40 xc:#$COLOR ~/.config/conky/Graffias/res/oval.png
convert -size 132x40 xc:none -draw "roundrectangle 0,0,132,40,21,21" png:- | convert ~/.config/conky/Graffias/res/oval.png -matte - -compose DstIn -composite ~/.config/conky/Graffias/res/oval.png

sleep 1s
echo "Success.."

sleep 1s
echo "Restarting Graffias..."
sleep 0.2s
conky -c $HOME/.config/conky/Graffias/Graffias.conf &> /dev/null &

sleep 5s
echo "Done"

exit
