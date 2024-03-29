#!/bin/bash

#echo 'nastaveni systemu \n'


if [ -z $1 ]
then
  choose="*** Unknown vehicle ***"
elif [ -n $1 ]
then
# otherwise make first arg as a volume
  choose=$1
fi

# use case statement to make decision volume
case $choose in


"VYPNOUT_PC") xmessage -center  -geometry 1280x50 "!!! POZOR - Vypnuti PC, Vypnuti PC v case, restart PC !!!" -timeout 60 -center -title "VYPNOUT_PC" -default "Opustit" -buttons "Zrusit":1,"Vypnout":2,"Vypnout v 00:00":3,"Vypnout v 01:00":4,"Vypnout v 02:00":5,"Restart":6 >/dev/null

case $? in
1)
echo "Exit";;
2)
xterm  -title Vypnout -hold -e 'echo Vypnout;sudo poweroff';;
3)
xterm  -title Vypnout_v_00:00 -hold -e 'echo Vypnout_v_00:00;sudo shutdown -h 00:00';;
4)
xterm  -title Vypnout_v_01:00 -hold -e 'echo Vypnout_v_01:00;sudo shutdown -h 01:00';;
5)
xterm  -title Vypnout_v_02:00 -hold -e 'echo Vypnout_v_02:00; sudo shutdown -h 02:00';;
6)
xterm  -title Reboot -hold -e 'echo Reboot;sudo reboot';;
esac ;;

"POZNAMKY") xmessage -center  -geometry 1280x50 "POZNAMKY" -timeout 60 -center -title "Vyber" -default "Opustit" -buttons "Zrusit":1,"WEB":2,"POZNAMKY":3    >/dev/null

case $? in
1)
echo "Exit";;
2)
xterm -T WEB -hold -e bash -c 'echo nazev;read nazev;echo www;read www; echo "[$nazev]($www)" >> $HOME/.config/openbox/web.md ; xterm -T WEB -hold -e tail $HOME/.config/openbox/web.md' ;;
3)
xterm -T POZNAMKY -hold -e bash -c 'echo poznamka;read poznamka;echo "$poznamka" >> $HOME/.config/openbox/poznamky.md ; xterm -T WEB -hold -e tail $HOME/.config/openbox/poznamky.md';;
esac ;;

"SYSTEM") xmessage -center  -geometry 1280x50 "SYSTEM" -timeout 60 -center -title "Vyber" -default "Opustit" -buttons "Zrusit":1,"Dropbox st":2,"Dropbox web":3,"sysv-rc-conf":4,"HP install":5,"Xd kill":6,"Xd l":7,"Xd p":8,"Xd h":9,"Xd d":10,"debian upgr":11,"bash rc":12,"bash alias":13,"tisk konf":14,"cups web":15,"Debian procisteni":16,"Autostart systemu":17,"hpsystray":18,"trash":19 >/dev/null

case $? in
1)
echo "Exit";;
2)
dropbox start;;
3)
sensible-browser https://www.dropbox.com/home;;
4)
xterm -hold -e sudo sysv-rc-conf;;
5)
xterm -hold -e sudo hp-setup -i;;
6)
Xdotool kill;;
7)
xdotool behave_screen_edge  --quiesce 750 left  key ctrl+alt+q;;
8)
xdotool behave_screen_edge --quiesce 750 --delay 999 right exec sakura;;
9)
xdotool behave_screen_edge --quiesce 750 top key ctrl+alt+q;;
10)
xdotool behave_screen_edge --quiesce 750 --delay 999 bottom exec sakura;;
11)
xterm -hold -title UPGRADE_SYSTEMU -e sudo bash -c 'apt list --upgradable;sudo apt-get update -y; apt -y dist-upgrade;exec bash';;
12)
xterm -hold -e sudo mousepad .bashrc;;
13)
xterm -hold -e sudo mousepad .bash_aliases;;
14)
xterm -hold -e system-config-printer;;
15)
sensible-browser http://localhost:631/admin/ ;;
16)
xterm -hold -title CISTENI_SYSTEMU -e sudo bash -c "apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')";;
17)
xterm -hold -title AUTOSTART_SYSTEMU -e sudo bash -c "ls /etc/xdg/autostart/" & ;;
18)
/usr/bin/python3 /usr/bin/hp-systray -x ;;
19)
thunar /home/$USER/.local/share/Trash/files ;;
esac ;;

"OPENBOX") xmessage -center  -geometry 1280x50 "Openbox" -timeout 60 -center -title "OPENBOX" -default "Opustit" -buttons "Zrusit":1,"Obmenu":2,"Obconf":3,"Reconfigure":4,"Restart":5,"Exit":6,"AUTOSTART":7,"MENU":8,"RC":9,"vzhled":10,"Conky restart":11,"Tint2 restart":12,"Vystup HDMI":13,"Vystup VGA":14  >/dev/null

case $? in
1)
echo "Exit";;
2)
obmenu;;
3)
obconf;;
4)
openbox --reconfigure;;
5)
openbox --restart;;
6)
openbox --exit && killall openbox;;
7)
xterm -e 'mousepad $HOME/.config/openbox/autostart';;
8)
xterm -e 'mousepad $HOME/.config/openbox/menu.xml';;
9)
xterm -e 'mousepad $HOME/.config/openbox/rc.xml';;
10)
xterm -hold -e lxappearance;;
11)
killall conky;sleep 2;conky --config=$HOME/.config/openbox/conky.conf ;;
12)
killall tint2;sleep 2;tint2 -c $HOME/.config/openbox/tint2rc ;;
13)
xterm -T VYSTUP_HDMI -hold -e 'xrandr --output LVDS-1 --off --output HDMI-1 --auto';;
14)
xterm -T VYSTUP_VGA -hold -e 'xrandr --output LVDS-1 --off --output VGA-1 --auto';;
esac ;;


"SLUZBY") xmessage -center  -geometry 1280x50 "Vybirej opatrne" -timeout 60 -center -title "SLUZBY" -default "Opustit" -buttons "Zrusit":1,"Odhlaseni":2,"! PC restart !":3,"! PC vypnuti !":4 >/dev/null

case $? in
1)
echo "Exit";;
2)
killall openbox;;
3)
sudo sudo reboot;;
4)
sudo sudo poweroff;;
esac ;;

"TV") xmessage -center  -geometry 1280x50 "Vyber YOUTUBE, nebo TV" -timeout 60 -center -title "TV" -default "Opustit" -buttons "Zrusit":1,"Youtube - smtube":2,"TV program":3,"CT1":4,"CT2":5,"Ard":6 >/dev/null

case $? in
1)
echo "Exit";;
2)
smtube;;
3)
sh ~/.config/openbox/all.sh tvprogram;;
4)
sh ~/.config/openbox/all.sh ct1;;
5)
sh ~/.config/openbox/all.sh ct2;;
6)
sh ~/.config/openbox/all.sh ard;;
esac ;;

"DOWNLOAD") xmessage -center  -geometry 1280x50 "Vyber AUDIO, VIDEO" -timeout 60 -center -title "DOWNLOAD" -default "Opustit" -buttons "Zrusit":1,"Stahni AUDIO YOUTUBE":2,"Stahni WORST AUDIO YOUTUBE":3,"Stahni WORST VIDEO YOUTUBE":4,"Stahni DATA Z ULOZTO":5  >/dev/null

case $? in
1)
echo "Exit";;
2)
xterm -T AUDIO_YOUTUBE -e 'cd $HOME/hudba;youtube-dl  --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "$(xsel --clipboard)"';;
3)
xterm -T WORST_AUDIO_YOUTUBE -e 'cd $HOME/hudba;youtube-dl  -f worstaudio[ext=m4a] "$(xsel --clipboard)"';;
4)
xterm -T WORST_VIDEO_YOUTUBE -e 'cd $HOME/videa;youtube-dl  -f 18 "$(xsel --clipboard)"';;
5)
xterm -T DATA_ULOZTO -e 'cd $HOME/videa;$HOME/.local/bin/ulozto-downloader --auto-captcha --parts 15 "$(xsel --clipboard)"'  && aplay  /usr/share/sounds/alsa/Front_Center.wav || xmessage "HOTOVO_Uloz_to_data_stazeno" -center  ;;
esac ;;



"PROGRAMY") xmessage -center  -geometry 1280x50 "Vyber" -timeout 60 -center -title "OSTATNI" -default "Opustit" -buttons "Zrusit":1,"Kalkulacka":2,"Streamtuner":3,"Gesta":4,"Kalendar":5,"Misto na disku":6 >/dev/null

case $? in
1)
echo "Exit";;
2)
calcoo;;
3)
streamtuner2 --gtk3;;
4)
easystroke;;
5)
yad --calendar;;
6)
eval exec yad --title="Mista na disku" --image=drive-harddisk --text="Disk :" --buttons-layout=end --width=650 --multi-progress $(df -hT $1 | tail -n +2 | awk '{printf "--bar=\"<b>%s</b> (%s - %s) [%s/%s]\" %s ", $7, $1, $2, $4, $3, $6}') ;;
esac ;;

"BANKY") xmessage -center  -geometry 1280x50 "Vyber" -timeout 60 -center -title "BANKY" -default "Opustit" -buttons "Zrusit":1,"CS george":2,"Sparkasse":3 >/dev/null

case $? in
1)
echo "Exit";;
2)
sh ~/.config/openbox/all.sh cs;;
3)
sh ~/.config/openbox/all.sh sparkasse;;
esac ;;

"RADIA") xmessage -center  -geometry 1280x50 "Vyber RADIO" -timeout 60 -center -title "RADIA" -default "Opustit" -buttons "Zrusit":1,"Radia online":2,"Humor":3,"4U":4,"Tranceup":5,"Evropa2":6,"Evropa2 Movin":7,"Evropa2 flashback":8,"Evropa2 Top40":9,"Freerave":10,"City 80":11,"City 90":12,"WEB Cesky rozhlas":13,"WEB VSECHNA RADIA":14 >/dev/null


case $? in
1)
echo "Exit";;
2)
sensible-browser https://online-radio.eu/country/Czech%20Republic;;
3)
echo "Humor"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv --volume=25 --stop-screensaver=no http://mp3stream4.abradio.cz:8000/humor.mp3;;
4)
echo "4U"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv --volume=25 --stop-screensaver=no http://mpc1.mediacp.eu:8342/stream;;
5)
echo "Tranceup"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv --volume=25 --stop-screensaver=no http://5.39.71.159:8223/stream;;
6)
echo "E2"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv --volume=25 --stop-screensaver=no https://playerservices.streamtheworld.com/api/livestream-redirect/EVROPA2AAC.aac?dist=onlineradioeu;;
7)
echo "E2 movin"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv --volume=25 --stop-screensaver=no https://ice.actve.net/web-e2-movin;;
8)
echo "E2 flashback"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv --volume=25 --stop-screensaver=no https://ice.actve.net/web-e2-flashback;;
9)
echo "E2 top40"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv --volume=25 --stop-screensaver=no https://ice.actve.net/web-e2-top40;;
10)
echo "Freerave"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv --volume=25 --stop-screensaver=no http://164.68.122.137:8061/;;
11)
echo "City 80"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv --volume=25 --stop-screensaver=no http://ice.abradio.cz/city80128.mp3;;
12)
echo "City 90"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv --volume=25 --stop-screensaver=no http://ice.abradio.cz/city90128.mp3;;
13)
sh ~/.config/openbox/all.sh cr_online;;
14)
bash -c "wget --timestamping  --tries=100 --wait=1 https://raw.githubusercontent.com/bedjan/mm/master/radia_online.m3u & vlc radia_online.m3u";;
esac ;;

"YOUTUBE_HUDBA") xmessage -center  -geometry 1280x50 "Vyber YOUTUBE HUDBU" -timeout 60 -center -title "YOUTUBE HUDBA" -default "Opustit" -buttons "Zrusit":1,"AUDIO url":2,"VIDEO url":3,"Trance_2009":4,"Space ambient":5 >/dev/null


case $? in
1)
echo "Exit";;
2)
echo "AUDIO - Mpv drag copy url"  | osd_cat -d 1 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv  --no-video --fs=no --ytdl-raw-options=no-check-certificate=  --cache-secs=180 --demuxer-readahead-secs=0  --ontop=yes --save-position-on-quit=yes --geometry=35%+0-50 --config=yes;;
3)
echo "VIDEO - Mpv drag copy url"  | osd_cat -d 1 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' & mpv  --ytdl-format=worst --fs=no --ytdl-raw-options=no-check-certificate= --cache-secs=180 --demuxer-readahead-secs=0  --ontop=yes --save-position-on-quit=yes --geometry=35%+0-50 --config=yes;;
4)
mpv  --no-video https://www.youtube.com/watch?v=8rK7Qef0fCk;;
5)
mpv  --no-video https://www.youtube.com/watch?v=tNkZsRW7h2c;;
esac ;;

"OVLADANI") xmessage -center  -geometry 1280x50 "Vyber" -timeout 60 -center -title "OVLADANI" -default "Opustit" -buttons "Zrusit":1,"up":2,"down":3,"mute":4,"monitor":5,"dpms":6,"ytdl_update":7,"ytdl_download":8,"mixer":9,"ulozto_download":10,"pip_all_upgrade":11 >/dev/null

case $? in
1)
echo "Exit";;
2)
echo " + "  | osd_cat -d 1 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' &  pactl set-sink-volume 0 +5%;;
3)
echo " - "  | osd_cat -d 1 -s 1 -A left -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' &  pactl set-sink-volume 0 -5%;;
4) 
echo " mute "  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' &  pactl set-sink-mute 0 toggle;;
5)
echo "XXX___Vypinam monitor___XXX"  | osd_cat -d 1 -s 1 -A center -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';sleep 10;xset -display $DISPLAY dpms force off;;
6)
STATUS=`xset -q | grep -e 'DPMS is'| cut -c 10-17`
if [ "$STATUS" = " Disable" ]] ;
then xset  -display $DISPLAY s on +dpms 
echo "|||___Vypinam DPMS monitor___|||"  | osd_cat -d 1 -s 1 -A LEFT -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1'
elif [ "$STATUS" = " Enabled" ]] ; 
then xset  -display $DISPLAY s on -dpms  
echo "XXX___Nevypinam DPMS monitor___XXX"  | osd_cat -d 1 -s 1 -A LEFT -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1'
fi;;
7)
xterm -title Youtube-dl-update -hold -e "/usr/bin/python3 -m pip install --upgrade pip --no-warn-script-location || pip install --upgrade youtube-dl";;
8)
xterm -title Youtube-dl-update -hold -e "pip install --upgrade youtube-dl";;
9)
echo "$choose volume";alsamixergui ;;
10)
xterm -title Ulozto-dl-update -hold -e "pip3 install --upgrade ulozto-downloader;sudo apt-get install python3-tk tor";;
11)
xterm -title pip_all_upgrade -hold -e "pip freeze > requirements.txt & sed -i 's/==/>=/g' requirements.txt & pip install -r requirements.txt --upgrade";;
esac ;;


##ZACHOVAT VIDEO##

"VIDEO") xmessage -center  -geometry 1280x50 "Vyber" -timeout 60 -center -title "VIDEO" -default "Opustit" -buttons "Zrusit":1,"mpv_youtube_mute":2,"mpv_youtube":3,"mpv_youtube_worst":4,"mpv_youtube_audio":5,"ytdl_download":6,"pip_all_upgrade":7,"ulozto-downloader":8  >/dev/null

case $? in
1)
echo "Exit";;
2)
XSEL=$(xsel --clipboard);stterm -t Video_youtube -g 80x20-40-40 -e bash -c "echo '=====Spoustim_video_ve_worst_rozliseni...=====';echo '=====URL="${XSEL}"=====';echo '===========================';mpv --mute=yes --ytdl-format=worst --fs=no  --cache-secs=60 --demuxer-readahead-secs=0 --ytdl-raw-options=no-check-certificate=  --slang=cs,en  '${XSEL}'  && exit 1;echo '=====Spoustim_video_v_plnem_rozliseni ...=====';mpv --mute=yes  --slang=cs,en  '${XSEL}'" ;;
3)
XSEL=$(xsel --clipboard);stterm -t Video_youtube -g 80x20-40-40 -e bash -c "echo '=====Spoustim_video_ve_mp4_rozliseni...=====';echo '=====URL="${XSEL}"=====';echo '===========================';mpv --ytdl-format=mp4 --fs=no  --cache-secs=60 --demuxer-readahead-secs=0 --ytdl-raw-options=no-check-certificate=  --slang=cs,en  '${XSEL}'  && exit 1;echo '=====Spoustim_video_v_plnem_rozliseni ...=====' || echo 'Spoustene video neslo spustit ... spoustim bez parametru ...'  | osd_cat -d 1 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-2';mpv  --slang=cs,en  '${XSEL}'" ;;
4) 
xSEL=$(xsel --clipboard);stterm -t Video_youtube -g 80x20-40-40 -e bash -c "echo '=====Spoustim_video_ve_worst_rozliseni...=====';echo '=====URL="${XSEL}"=====';echo '===========================';mpv --ytdl-format=worst --fs=no  --cache-secs=60 --demuxer-readahead-secs=0 --ytdl-raw-options=no-check-certificate=  --slang=cs,en '${XSEL}'  && exit 1;echo '=====Spoustim_video_v_plnem_rozliseni ...=====' || echo 'Spoustene video neslo spustit ... spoustim bez parametru ...'  | osd_cat -d 1 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-2';mpv  --slang=cs,en '${XSEL}'" ;;
5)
XSEL=$(xsel --clipboard);stterm -t Audio_youtube -g 80x20-40-40 -e bash -c "echo '=====Spoustim_audio_v_kvalite_best ...=====';echo '=====URL="${XSEL}"=====';echo '===========================';mpv  --no-video --fs=no --player-operation-mode=pseudo-gui  --cache-secs='60' --no-stop-screensaver --ytdl-raw-options=no-check-certificate=  --slang=cs,en  '${XSEL}'  && exit 1;echo '=====Spoustim_audio_v_plnem_rozliseni ...=====' || echo 'Spoustene video neslo spustit ... spoustim bez parametru ...'  | osd_cat -d 1 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-2';mpv --no-video --fs=no --player-operation-mode=pseudo-gui  --cache-secs='60' --no-stop-screensaver --ytdl-raw-options=no-check-certificate=  --slang=cs,en  '${XSEL}'" ;; 
6)
xterm -title Youtube-dl-update -hold -e "pip install --upgrade youtube-dl";;
7)
xterm -title Pip-dl-update -hold -e "pip install --upgrade pip";;
8)
xterm -title ulozto-downloader -hold -e "pip3 install --upgrade ulozto-downloader";;
esac ;;

"KLAVESNICE") xmessage -center  -geometry 1280x50 "Vyber" -timeout 60 -center -title "KLAVESNICE" -default "Opustit" -buttons "Zrusit":1,"ZAPNOUT":2,"VYPNOUT":3,"VIRTUAL KLAV.":4  >/dev/null

case $? in
1)
echo "Exit";;
2)
xinput enable "AT Translated Set 2 keyboard";;
3)
xinput disable "AT Translated Set 2 keyboard";;
4)
xvkbd;;
esac ;;

##TV_CESKO##

"tvprogram") sensible-browser  https://www.tvprogram.cz/;;
"tv_ceske") sensible-browser  https://www.tvonline.cz/;;
"ct1") sensible-browser https://www.ceskatelevize.cz/ivysilani/zive/ct1;;
"ct2") sensible-browser https://www.ceskatelevize.cz/ivysilani/zive/ct2;;
"prima") sensible-browser https://prima.iprima.cz/#main-wrapper;;
"primamax") sensible-browser https://max.iprima.cz/#main-wrapper;;
"primacool") sensible-browser https://cool.iprima.cz/#main-wrapper;;
"primakrimi") sensible-browser https://krimi.iprima.cz/#main-wrapper;;
"primalove") sensible-browser https://love.iprima.cz/#main-wrapper;;
"primazoom") sensible-browser https://zoom.iprima.cz/#main-wrapper;;
"tvnatura") sensible-browser https://www.tvnatura.cz;;
"nova") sensible-browser  https://novaplus.nova.cz/;;

##TV_NEMECKO##

"tv_nemecke") sensible-browser https://www.2ix2.com/;;

"ard") sensible-browser https://www.2ix2.com/ard/;;
"rtl2") sensible-browser https://www.2ix2.com/rtl2-live/;;
"ntv") sensible-browser https://www.2ix2.com/n-tv-live/;;
"rtlnitro") sensible-browser https://www.2ix2.com/rtl-nitro-live/;;
"superrtl") sensible-browser https://www.2ix2.com/super-rtl-live/;;
"tlc") sensible-browser https://www.2ix2.com/tlc/;;
"pro7") sensible-browser https://www.2ix2.com/pro7/;;
"pro7maxx") sensible-browser https://www.2ix2.com/prosieben-maxx/;;
"kabel1") sensible-browser https://www.2ix2.com/kabel-1/;;
"sat1") sensible-browser https://www.2ix2.com/sat1/;;
"sixx") sensible-browser https://www.2ix2.com/sixx/;;
"dmax") sensible-browser https://www.2ix2.com/dmax/;;
"kabel1doku") sensible-browser https://www.2ix2.com/kabel-1-doku/;;
"disney") sensible-browser https://www.2ix2.com/disney-channel/;;
"tele5") sensible-browser https://www.2ix2.com/tele-5/;;
"zdf") sensible-browser https://www.2ix2.com/zdf/;;

##TV_VSE##

"TV_1") sensible-browser https://www.2ix2.com/sat1-gold/;;

"TV_2") sensible-browser https://nydus.org/stream/;;

"Erste") sensible-browser https://live.daserste.de/;;

"Das_erste") vlc --loop https://mcdn.daserste.de/daserste/de/master.m3u8;;

"Ard") palemoon https://fernsehzone.online/ard-live/;;	

"Hr") vlc --loop https://hrhls.akamaized.net/hls/live/2024525/hrhls/index.m3u8;;
	

"Kulturmd") vlc --loop https://58bd5b7a98e04.streamlock.net/medienasa-live/_definst_/mp4:kulturmd_high/playlist.m3u8;;
	

"Ndr_hamburg") vlc --loop https://ndrfs-lh.akamaihd.net/i/ndrfs_hh@430231/index_3776_av-p.m3u8;;
	

"Nrwision") vlc --loop https://fms.nrwision.de/live/livestreamHD.stream_source/chunklist.m3u8;;
	

"Okessau") vlc --loop rtmp://62.113.210.250/medienasa-live/ok-dessau_high;;
	

"Ok_kassel") vlc --loop https://s.ok54.de/mok-ks/kassel/playlist.m3u8;;
	

"Ok_kiel") vlc --loop https://d1lv1lpzlrjn3y.cloudfront.net/play/hls/kieltv/index.m3u8;;
	

"Ok_ludwigshafen") vlc --loop https://s.ok54.de/oklu/livestream/playlist.m3u8;;
	

"Ok_magdeburg") vlc --loop rtmp://62.113.210.250/medienasa-live/ok-magdeburg_high;;
	

"Ok_Merseburg") vlc --loop rtmp://62.113.210.250/medienasa-live/ok-merseburg_high;;
	

"Ok_nahetv") vlc --loop https://s.ok54.de/nahetv/webstream/chunks.m3u8;;
	

"Ok_rhein main") vlc --loop https://s.ok54.de/mok-rm/mok-rm/playlist.m3u8;;
	

"Ok_rheinlokal") vlc --loop https://s.ok54.de/rheinlokal/rheinlOKal_stream/chunks.m3u8;;
	

"Ok_salzwedel") vlc --loop rtmp://62.113.210.250/medienasa-live/ok-salzwedel_high;;
	

"Ok_stendal") vlc --loop rtmp://62.113.210.250/medienasa-live/ok-stendal_high;;
	

"Ok_suedwestpfalz") vlc --loop https://s.ok54.de/okswp/test/chunks.m3u8;;
	

"Ok_weinstrasse") vlc --loop https://s.ok54.de/okweinstrasse/okweinstrasse/chunks.m3u8;;
	

"Ok wernigerode") vlc --loop rtmp://62.113.210.250/medienasa-live/ok-wernigerode_high;;
	

"Ok54_trier") vlc --loop https://s.ok54.de/ott/webstream/tv/webstream_720p/chunks.m3u8;;
	

"Tagesschau24") vlc --loop https://tagesschau-lh.akamaihd.net/i/tagesschau_1@119231/index_3776_av-b.m3u8;;
	

"Tidetv") vlc --loop https://5889e7d0d6e28.streamlock.net/tide-live/_definst_/smil:livestream.smil/playlist.m3u8;;
	

"Tvhalle") vlc --loop https://58bd5b7a98e04.streamlock.net/medienasa-live/_definst_/mp4:tvhalle_high/playlist.m3u8;;
	

"Wdr") vlc --loop https://wdrfs247.akamaized.net/hls/live/681509/wdr_msl4_fs247/master_3628.m3u8;;
	

"Wtv_ok_wettin") vlc --loop rtmp://62.113.210.250/medienasa-live/ok-wettin_high;;
	

"Punktum") vlc --loop https://58bd5b7a98e04.streamlock.net/medienasa-live/_definst_/mp4:punktum_high/playlist.m3u8;;
	

"Ran1") vlc --loop https://58bd5b7a98e04.streamlock.net/medienasa-live/_definst_/mp4:ran1_high/playlist.m3u8;;
	

"Rockland") vlc --loop http://api.new.livestream.com/accounts/22300522/events/6680139/live.m3u8;;
	

"Rt") vlc --loop https://rt-news.secure.footprint.net/1103.m3u8;;
	

"Studio47") vlc --loop https://5852afe96c9bb.streamlock.net/studio47-live/_definst_/mp4:livestream/playlist.m3u8;;
	

"Dw_e") vlc --loop http://dwstream1-lh.akamaihd.net/i/dwstream1_live@120422/index_1_av-p.m3u8;;
	

"Dw") vlc --loop https://dwstream6-lh.akamaihd.net/i/dwstream6_live@123962/index_1_av-p.m3u8;;
	

"Dw+") vlc --loop http://dwstream52-lh.akamaihd.net/i/dwstream52_live@500528/index_1_av-p.m3u8;;
	

"Elbekanal") vlc --loop http://62.113.210.250/medienasa-live/_definst_/mp4:elbe_high/playlist.m3u8;;
	
##WEB##

   "openbox") sensible-browser  http://www.fastlinux.eu/_archiv/index.php?page=linux026#Lock;;
   "filmy stazeni") sensible-browser  https://uloz.to/folder/dFY1yYQFavz0/name/Yperit-Paradise#!ZGAvMQR2ZGR0ZwIxZwV3LmL4Mwp5AGO6qzSIJTMUGJczDGVmZj==;;
"filmy nfa") sensible-browser  https://nfa.cz/cz/obchod-a-distribuce/distribuce-v-cr/filmy-do-1964/;;
   "kalendar") sensible-browser  https://time.is/calendar;;
   "cas") sensible-browser  https://time.is/;;
   "zdrojak") sensible-browser  https://zdrojak.cz/;;
   "linuxexpress") sensible-browser  https://www.linuxexpres.cz/;;
    "cs") sensible-browser  https://bezpecnost.csas.cz/login/?client_id=georgeclient_cz ;;
    "sparkasse") sensible-browser  https://www.ostsaechsische-sparkasse-dresden.de/de/home/service/online-mobile-banking.html ;;

   "gkeep") sensible-browser  https://keep.google.com/#home;;
   "gmail") sensible-browser  https://mail.google.com/mail/u/0/#inbox;;
   "yahoo_email") sensible-browser  https://login.yahoo.com;;
   "seznam_email") sensible-browser  https://login.szn.cz/;;
   "seznam_sweb") sensible-browser  https://login.szn.cz/?serviceId=sweb&loggedURL=http://webadmin.sweb.cz/;;
   "seznam_ftp") sensible-browser  ftp://sweb.cz/;;
   "ulozto") sensible-browser  https://uloz.to/login?key=logreg;;
   "vinted") sensible-browser  https://www.vinted.cz/member/general/login?ref_url=%2F&__cf_chl_captcha_tk__=06e60c0838f1e7a7cfd5731145275268b2f8d333-1622574905-0-AWud745mERmzGs9xCMmTroN332YOMEB1XBdXrPdWOQb8DLHtVc_N12zsvulYXNXLllall03fFZTibqJOiwZAUE81L6fVqCpHHbu8-3razVqegPH9re-QEQZfqN_EzyWYJCjI2_q2ZBDKAAQnTeVwL2CdkgiuZvHgTuBg8Jd0sF0cqNidaj8mYoXU3bamvN5TBnyEWwS7CHFcmdRPpW1RfAfMRh40-evwGj-9EHUsXZrma23ik_BXVbhs2URb_mb-GVAXMaakFCT3XV5bppHKz3oSSQz9jTwc73S1Ym0l089x-QfVBsc4XUGYtDeykKIjTo1rm7h9RLIAkGRq8nPcFCcdZBznaFb779UgKQ-KLYomfrqAkRsCYDPIvNSiPs_R3WRyAR2Y-jpSJTaKdTb78nX5sCH8qsqJ9Q9ksbvWsFlMsUE15ua8lyGrnQsN8KmTWkanrIneuVfsDHqVyqzpRZNAvz5r-CDm1pA5x5M4FkYXcwPL_KOJ6fR96lPDrN1cWOAlMHY8oRnfqNJMqhEva-zZ-BC31NoXdbsXtNr6xJtd3qr331Bq237FcAWYvwHtAWUsXCwV_Dh95L4WR747luRvi9htOMEXK34CgQk1GWc52dUVjzxTaz52vX-YNdjiKSYxnYlWP1stZtGLkRBqNyWdj7uGW-kdlOaKtfBqkWEpvg1OgUdgB21cuPY-GsWc6Gyq2XGrc35xgFbVdouNQxg;;
   "soundcloud") sensible-browser  https://soundcloud.com/signin;;
   "difm") sensible-browser  https://www.di.fm/;;
   "gdisk") sensible-browser  https://drive.google.com/drive/;;
   "gdocs") sensible-browser  https://docs.google.com/document/u/0/;;
   "gphotos") sensible-browser  https://photos.google.com/?hl=cs&pli=1;;
   "gsites") sensible-browser  https://sites.google.com/site/bedjansite/;;
   "gtranslate") sensible-browser  https://translate.google.cz/;;
   "jobs") sensible-browser  https://www.jobs.cz/;;
   "seznam") sensible-browser  https://www.seznam.cz/;;
   "abclinuxu") sensible-browser  https://www.abclinuxu.cz/;;

   "root") sensible-browser  https://www.root.cz/;;
   "simplenote") sensible-browser  https://app.simplenote.com/login/;;
   "gtakeout") sensible-browser  https://takeout.google.com/settings/takeout?pli=1;;
   "web") sensible-browser  http://janbednar.sweb.cz/;;
   "dropbox") sensible-browser  https://www.dropbox.com/home;;
   "github") sensible-browser  https://github.com/bedjan/;;
   "github_all") sensible-browser  https://github.com/bedjan/debian/blob/master/skripty/all.sh;;
   "facebook") sensible-browser  https://www.facebook.com/;;
   "youtube") sensible-browser  https://www.youtube.com/;;
   "bazos") sensible-browser  https://www.bazos.cz/;;
   "ct") sensible-browser  https://www.ceskatelevize.cz/porady/a-z/;;
   "ctzive") sensible-browser  https://www.ceskatelevize.cz/ivysilani/serialy;;
   "csfd") sensible-browser  https://www.csfd.cz/;;
   "tvonline") sensible-browser  https://www.spustit.cz/tv-ct1-online-zdarma/;;
   "nemcina_youtube") sensible-browser  https://www.youtube.com/channel/UC4LQ7gUVS5w45ba1VubmJpg/videos;;
   "thinfi") sensible-browser  https://thinfi.com/;;
   "bitly") sensible-browser  https://bitly.com/;;
   "jdem") sensible-browser  http://jdem.cz/;;
   "protectedtext") sensible-browser  https://www.protectedtext.com/;;
   "dillinger") sensible-browser  https://dillinger.io/;;
   "githack") sensible-browser  https://raw.githack.com/;;
   "tinyurl") sensible-browser  https://tinyurl.com/app;;
   "github_poznamky") sensible-browser  https://github.com/bedjan/github/blob/master/README.md;;
   "programovani") sensible-browser  https://www.itnetwork.cz/prace-a-podnikani-v-it/jak-zacit-programovat-tvorit-aplikace-programy/;;
   "linux") sensible-browser  https://translate.google.cz/translate?sl=en&tl=cs&js=y&prev=_t&hl=cs&ie=UTF-8&u=linux.press&edit-text=&act=url;;
   "github_linux") sensible-browser  https://github.com/bedjan/debian/blob/master/poznamky/linux_cli.md;;
   "enviweb") sensible-browser  http://www.enviweb.cz/;;
   "mzp") sensible-browser  https://www.mzp.cz/;;
   "pronaladu") sensible-browser  https://www.pronaladu.cz/;;
   "github_akupresura") sensible-browser  https://github.com/bedjan/akupresura/blob/master/akupresura_prvni_pomoc.md;;
   "psychologie") sensible-browser  https://psychologie.cz/clanky/;;
   "epsychologie") sensible-browser  https://e-psycholog.eu/archiv;;
   "statistiky") sensible-browser  https://www.czso.cz/csu/czso/statistiky;;
   "zw") sensible-browser  https://arnika.org/zero-waste;;
   "zw1") sensible-browser  https://www.czechzerowaste.cz/;;
   "zw2") sensible-browser  http://zerowaste.bezobalu.org/;;
   "zw3") sensible-browser  https://translate.google.cz/translate?sl=en&tl=cs&js=y&prev=_t&hl=cs&ie=UTF-8&u=zerowasteeurope.eu&edit-text=&act=url;;
   "minimalismus") sensible-browser  https://zijememinimalismem.cz/minimalismus-co-to-je-prosim-te/;;
   "minimalismus1") sensible-browser  https://translate.google.cz/translate?hl=cs?sl=en&tl=cs&u=www.becomingminimalist.com/most-popular-posts/;;
   "github_zajmy") sensible-browser  https://github.com/bedjan/zajmy;;
   "github_manipulace") sensible-browser  https://github.com/bedjan/manipulace;;
   "github_windows") sensible-browser  https://github.com/bedjan/windows;;
   "github_home") sensible-browser  https://github.com/bedjan/home;;
   "cr_online") sensible-browser  https://www.mujrozhlas.cz/zive;;
   "ulice") sensible-browser  https://novaplus.nova.cz/porad/ulice/cele-dily;;
   "ruzovka") sensible-browser  https://novaplus.nova.cz/porad/ordinace-v-ruzove-zahrade-2;;

##FIREFOX_ROZSIRENI##
   "firefox_ucet") firefox https://accounts.firefox.com/signin?context=fx_desktop_v3&entrypoint=fxa_app_menu&action=email&service=sync;;
   "open_with") firefox https://addons.mozilla.org/cs/firefox/addon/open-with/;;
   "open_with_nastaveni") wget https://github.com/darktrojan/openwith/raw/master/webextension/native/open_with_linux.py;chmod u+x open_with_linux.py;./open_with_linux.py install;;

##youtube video a audio
#mpv --force-window --ytdl 
#mpv --force-window  --no-video --ytdl


   *) echo "\n Script all.sh compatible, \n Error, Wrong choose!";;
esac




##--Notes--##

##down volume
#pactl set-sink-volume 0 -5% 
#amixer set Master 5-

##up volume
#pactl set-sink-volume 0 +5% 
#amixer set Master 5+

##toggle volume
#pactl set-sink-mute 0 toggle 
#amixer set Master toggle

##mixer
#xterm -hold -e alsamixer
#pavucontrol
#pasystray

##youtube video a audio
#mpv --force-window --ytdl 
#mpv --force-window  --no-video --ytdl


