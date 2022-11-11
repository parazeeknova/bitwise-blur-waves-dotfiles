#!/bin/bash

killall conky
sleep 2s
		
conky -c $HOME/.config/conky/Antares/Antares.conf &> /dev/null &
