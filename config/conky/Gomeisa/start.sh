#!/bin/bash

killall conky
sleep 2s
		
conky -c $HOME/.config/conky/Gomeisa/Gomeisa.conf &> /dev/null &
