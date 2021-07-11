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

sudo apt install --no-install-recommends git openbox obmenu obconf mousepad nano mc stalonetray fspanel gexec volumeicon-alsa tint2 pnmixer pulseaudio numlockx sakura stterm firefox-esr firefox-esr-l10n-cs mpv  obsidian-icon-theme gxmessage smtube smplayer smplayer-l10n mpv vlc vlc-l10n xfe xfe-i18n pcmanfm streamtuner2 calcoo dmenu mpg123 scrot screen fbreader pandoc retext python3-pip qmplay2 galternatives seamonkey stacer ttf-mscorefonts-installer xterm qmplay2 sysv-rc-conf yad xosd-bin waterfox-g3 waterfox-g3-i18n-cs netsurf-gtk audacious lxtask pavucontrol smtube lxappearance alsamixergui chromium chromium-l10n gdebi python-pip python3-pip xsel ffmpeg mpc-qt ttf-mscorefonts-installer libavcodec-extra mpg123 mplayer torbrowser-launcher tor filezilla

echo "instalace youtube-dl" 

sudo pip install --upgrade --no-deps --force-reinstall pathlib
pip3 install --upgrade pip setuptools wheel
xterm -title Youtube-dl-update -hold -e "pip install -U youtube-dl"

echo "stahni deb soubor slimjet"
netsurf-gtk https://www.slimjet.com/download.php?version=lnx64&type=deb&beta=&server=
echo "stahni deb soubor min"
netsurf-gtk https://github.com/minbrowser/min/releases/download/v1.20.0/min_1.20.0_amd64.deb


echo "instalovat stazene soubory deb"
sudo dpkg -i *.deb
echo "instalovat zavislosti k deb souborum"
sudo apt install -f

#firejail firejail-profiles firetools
