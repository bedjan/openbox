#!/bin/bash

#stazeni git
which git || sudo apt install git

# prvni instalace do ~/.config/openbox
cd ~/.config/openbox && git clone https://github.com/bedjan/openbox/

which mc || sudo apt install mc 
which openbox || sudo apt install openbox
which obconf || sudo apt install obconf
which obmenu || sudo apt install obmenu

sudo apt install --no-install-recommends git stalonetray fspanel gexec volumeicon-alsa tint2 pnmixer pulseaudio numlockx sakura firefox mpv
