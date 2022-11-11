#!/usr/bin/env bash

# This script is linked to Antares.conf lines
# So don't  add a line there unless you change here too

COLOR=${1}

echo "Processing....."
sleep 2s

echo "Stoping Antares"
killall conky

sleep 0.7s
echo "Creating bg.png"
convert -size 80x80 xc:#$COLOR ~/.config/conky/Antares/res/bg.png

sleep 0.7s
echo "Set up Accent"
sed -i "36s|color2 = .*|color2 = '${COLOR}',|" ~/.config/conky/Antares/Antares.conf &
sleep 0.2s
sed -i "27s|fg_colour=0x.*|fg_colour=0x${COLOR},|" ~/.config/conky/Antares/scripts/rings-v1.2.1.lua &
sleep 0.2s
sed -i "41s|fg_colour=0x.*|fg_colour=0x${COLOR},|" ~/.config/conky/Antares/scripts/rings-v1.2.1.lua &
sleep 0.2s
sed -i "55s|fg_colour=0x.*|fg_colour=0x${COLOR},|" ~/.config/conky/Antares/scripts/rings-v1.2.1.lua &
sleep 0.2s
sed -i "69s|fg_colour=0x.*|fg_colour=0x${COLOR},|" ~/.config/conky/Antares/scripts/rings-v1.2.1.lua &

sleep 1s
echo "Success.."

sleep 1s
echo "Restarting Antares..."
conky -c $HOME/.config/conky/Antares/Antares.conf &> /dev/null &

sleep 5s
echo "Done"
