#!/bin/bash

#stazeni git
#https://github.com/bedjan/openbox/raw/main/install.sh
#http://install.jdem.cz/ http://debian.jdem.cz/

which git || sudo apt install git
which wget || sudo apt install wget

# prvni instalace do ~/.config/openbox
#cd ~/.config/openbox && git clone https://github.com/bedjan/openbox/
mkdir ~/.config/glue && cd ~/.config/glue && git clone https://github.com/bedjan/openbox/

which mc || sudo apt install mc 
which openbox || sudo apt install openbox
which obconf || sudo apt install obconf
which obmenu || sudo apt install obmenu

sudo apt install --no-install-recommends git openbox obmenu obconf mousepad nano mc stalonetray fspanel gexec volumeicon-alsa tint2 pnmixer pulseaudio numlockx sakura stterm firefox-esr firefox-esr-l10n-cs mpv  obsidian-icon-theme gxmessage smtube smplayer smplayer-l10n mpv vlc vlc-l10n xfe xfe-i18n pcmanfm streamtuner2 calcoo dmenu mpg123 scrot screen fbreader pandoc

#firejail firejail-profiles firetools
