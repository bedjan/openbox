#!/bin/bash

#echo '~~OVLADANI~~ down ~ up ~ monitor ~ dpms ~ ytdl_update ~ ytdl_download ~ mixer \n'
#echo '~~PROGRAMY~~ terminal ~ files ~ aup ~ chromium ~ netsurf ~ procesy ~ streamtuner ~ gesta ~ easystroke ~ mpc ~ kalkulacka ~ links ~ netsurf ~ default_web_browser \n' echo '~~VIDEO~~ youtubedl_video ~ youtubedl_audio ~ mpv_youtube_mute ~ mpv_youtube ~ mpv_youtube_audio \n'
#echo '~~VYPNOUT~~ restart ~ vypnout ~ vypnout0 ~ vypnout1 ~ vypnout2 \n'
#echo '~~OPENBOX~~ obconf ~ obmenu ~ orestart ~ oreconfigure ~ ostart ~ omenu ~ orc \n'
#echo '~~SYSTEM~~  github_all ~ bash ~ bash_aliases \n '
#echo '~~RADIA~~ humor ~ city90 ~ city80 ~ 4u \n'
#echo '~~TV~~ Das_erste ~ Hr ~ Kulturmd ~ Ndr_hamburg ~ Nrwision \n Okessau ~ Ok_kassel ~ Ok_kiel ~ Ok_ludwigshafen ~ Ok_magdeburg ~ Ok_Merseburg ~ Ok_nahetv ~ Ok_rhein main ~ Ok_rheinlokal ~ Ok_salzwedel ~ Ok_stendal ~ Ok_suedwestpfalz ~ Ok_weinstrasse ~ Ok wernigerode ~ Ok54_trier \n Tagesschau24 ~ Tidetv ~ Tvhalle ~ Wdr ~ Wtv_ok_wettin ~ Punktum ~ Ran1 ~ Rockland ~ Rt ~ Studio47 ~ Dw_e ~ Dw ~ Dw+ ~ Elbekanal \n'
#echo '~~WEBY~~ kalendar ~ cas ~ zdrojak ~ linuxexpress ~ cs ~ sparkasse ~ gkeep ~ gmail ~ yahoo_email ~ seznam_email ~ seznam_sweb ~ seznam_ftp ~ ulozto ~ vinted ~ soundcloud ~ difm ~ gdisk ~ gdocs ~ gphotos ~ gsites ~ gtranslate \n jobs ~ seznam ~ abclinuxu ~ tvprogram ~ root ~ simplenote ~ gtakeout ~ web ~ dropbox ~ github ~ github_all ~ Facebook ~ youtube ~ bazos ~ ct ~ ctzive ~ csfd ~ tvonline ~ nemcina_youtube \n thinfi ~ bitly ~ jdem ~ protectedtext ~ dillinger ~ githack ~ tinyurl ~ github_poznamky ~ programovani ~ linux ~ github_linux ~ enviweb ~ mzp ~ pronaladu ~ github_akupresura ~ psychologie ~ epsychologie ~ statistiky ~ zw ~ zw1 ~ zw2 ~ zw3 ~ minimalismus ~ minimalismus1 \n github_zajmy ~ github_manipulace ~ github_windows ~ github_home ~ open_with ~ open_with_nastaveni \n'


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

##OVLADANI##

   "down") echo "$choose volume"  | osd_cat -d 1 -s 1 -A LEFT -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' &  pactl set-sink-volume 0 -5%;;
   "up")  echo "$choose volume"  | osd_cat -d 1 -s 1 -A LEFT -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' &  pactl set-sink-volume 0 +5%;;
   "toggle") echo "$choose volume"  | osd_cat -d 1 -s 1 -A LEFT -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1' &  pactl set-sink-mute 0 toggle;;
   "monitor") echo "XXX___Vypinam monitor___XXX"  | osd_cat -d 1 -s 1 -A LEFT -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';sleep 10;xset dpms force off ;;
   "dpms") STATUS=`xset -q | grep -e 'DPMS is'| cut -c 10-17`
if [ "$STATUS" = " Disable" ]] ;
then xset s on +dpms 
echo "|||___Vypinam DPMS monitor___|||"  | osd_cat -d 1 -s 1 -A LEFT -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1'
elif [ "$STATUS" = " Enabled" ]] ; 
then xset s on -dpms 
echo "XXX___Nevypinam DPMS monitor___XXX"  | osd_cat -d 1 -s 1 -A LEFT -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1'
fi;;
   "ytdl_update") xterm -title Youtube-dl-update -hold -e "pip install --upgrade youtube-dl";;
   "ytdl_download") xterm -title Youtube-dl-update -hold -e "pip install --upgrade youtube-dl";;

   "mixer") echo "$choose volume";alsamixergui ;;

##PROGRAMY##


   "terminal") sakura;;
 
   "aup") xterm -hold -e 'sudo apt update -y &&  sudo apt upgrade -y &&  sudo apt autoremove -y &&  sudo apt autoclean -y';;
   "chromium") chromium;;
   "files") pcmanfm;;
   "netsurf") netsurf www.google.cz;;
   "procesy") lxtask;;
   "streamtuner") streamtuner2 --gtk3;;
   "gesta") easystroke;;
   "easystroke") easystroke;;
   "mpc") mpc-qt;;
   "kalkulacka") calcoo;;
   "links") links2 -g www.abclinuxu.cz;;
   "netsurf") netsurf www.abclinuxu.cz;;
   "default_web_browser") x-www-browser;;

##VIDEO##

  "youtubedl_video") xterm -hold -e 'cd /media/sda2;youtube-dl --ignore-errors  "$(xsel --clipboard)"';;
  "youtubedl_audio") xterm -hold -e 'cd /media/sda2;youtube-dl  --ignore-errors --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "$(xsel --clipboard)"';;

  "mpv_youtube_mute") XSEL=$(xsel --clipboard);stterm -t Video_youtube -g 80x20-40-40 -e bash -c "echo '=====Spoustim_video_ve_worst_rozliseni...=====';echo '=====URL="${XSEL}"=====';echo '===========================';mpv --mute=yes --ytdl-format='bestvideo[height<=?360]+bestaudio' --ytdl-raw-options=no-check-certificate= '${XSEL}'  && exit 1;echo '=====Spoustim_video_v_plnem_rozliseni ...=====';mpv --mute=yes '${XSEL}'" ;;

  "mpv_youtube")      XSEL=$(xsel --clipboard);stterm -t Video_youtube -g 80x20-40-40 -e bash -c "echo '=====Spoustim_video_ve_worst_rozliseni...=====';echo '=====URL="${XSEL}"=====';echo '===========================';mpv --ytdl-format=worst --ytdl-raw-options=no-check-certificate= '${XSEL}'  && exit 1;echo '=====Spoustim_video_v_plnem_rozliseni ...=====' || echo 'Spoustene video neslo spustit ... spoustim bez parametru ...'  | osd_cat -d 1 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-2';mpv '${XSEL}'" ;;

  "mpv_youtube_audio")        XSEL=$(xsel --clipboard);stterm -t Audio_youtube -g 80x20-40-40 -e bash -c "echo '=====Spoustim_audio_v_kvalite_best ...=====';echo '=====URL="${XSEL}"=====';echo '===========================';mpv  --no-video --fs=no --player-operation-mode=pseudo-gui  --cache-secs='60' --no-stop-screensaver --ytdl-raw-options=no-check-certificate= '${XSEL}'  && exit 1;echo '=====Spoustim_audio_v_plnem_rozliseni ...=====' || echo 'Spoustene video neslo spustit ... spoustim bez parametru ...'  | osd_cat -d 1 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-2';mpv --no-video --fs=no --player-operation-mode=pseudo-gui  --cache-secs='60' --no-stop-screensaver --ytdl-raw-options=no-check-certificate=  '${XSEL}'" ;; 


##VYPNOUT##

   "restart") xterm -hold -e 'echo Vypnout_v_00:00;sudo reboot';;
   "vypnout") xterm -hold -e 'echo Vypnout_v_00:00;sudo poweroff';;
   "vypnout0") xterm -hold -e 'echo Vypnout_v_00:00;sudo shutdown -h 00:00';;
   "vypnout1") xterm -hold -e 'echo Vypnout_v_00:00;sudo shutdown -h 01:00';;
   "vypnout2") xterm -hold -e 'echo Vypnout_v_02:00; sudo shutdown -h 02:00';;

##OPENBOX##
   "obconf") obconf;;
   "obmenu") obmenu;;
   "orestart") xterm -hold -e 'openbox --restart';;
   "oreconfigure") xterm -hold -e 'openbox --reconfigure';;
   "ostart") xterm -e 'mousepad ~/.config/openbox/autostart';;
   "omenu") xterm -e 'mousepad ~/.config/openbox/menu.xml';;
   "orc") xterm -e 'mousepad ~/.config/openbox/rc.xml';;

##SYSTEM##
   "github_all") firefox https://github.com/bedjan/debian/blob/master/skripty/all.sh;;
   "bash") xterm -hold -e 'sudo mousepad .bashrc';;
   "bash_aliases") xterm -e 'sudo mousepad .bash_aliases';;
  ## "history") xterm -hold -e "history";;

##RADIA##
   "humor") xterm -geometry 80x20-60-60 -title Humor_radio -e bash -c "mpg123 -C --no-seekbuffer --preload http://mp3stream4.abradio.cz:8000/humor.mp3";;
   "city90") xterm -geometry 80x20-60-60 -title 80_radio -e bash -c "mpg123 -C --no-seekbuffer --preload http://ice.abradio.cz/city80128.mp3";;
   "city80") xterm -geometry 80x20-60-60 -title 90_radio -e bash -c "mpg123 -C --no-seekbuffer --preload http://ice.abradio.cz/city90128.mp3";;
   "4u") xterm -geometry 80x20-60-60 -title 4U_radio -e bash -c "mplayer  -volume 90 http://mpc.mediacp.eu:8302/stream";;
   "e2") xterm -geometry 80x20-60-60 -title E2 -e bash -c "mplayer  -volume 90  https://playerservices.streamtheworld.com/api/livestream-redirect/EVROPA2AAC.aac?dist=onlineradioeu";;
   "e2movin") xterm -geometry 80x20-60-60 -title E2_movin -e bash -c "mplayer  -volume 90  https://ice.actve.net/web-e2-movin";;
   "e2flashback") xterm -geometry 80x20-60-60 -title E2_flashback -e bash -c "mplayer  -volume 90  https://ice.actve.net/web-e2-flashback";;
   "e2top40") xterm -geometry 80x20-60-60 -title E2_flashback -e bash -c "mplayer  -volume 90  https://ice.actve.net/web-e2-top40";;
   "freerave") xterm -geometry 80x20-60-60 -title Freerave -e bash -c "mplayer  -volume 90  http://164.68.122.137:8061/;";;
   "tranceup") xterm -geometry 80x20-60-60 -title Tranceup -e bash -c "mplayer  -volume 90 http://5.39.71.159:8223/stream";;
   "radia") bash -c "wget --timestamping  --tries=100 --wait=1 https://raw.githubusercontent.com/bedjan/mm/master/radia_online.m3u & vlc radia_online.m3u";;
   "radiaonline") firefox https://online-radio.eu/country/Czech%20Republic;;

##TV_CESKO##

"tvprogram") firefox https://www.tvprogram.cz/;;
"tv_ceske") firefox https://www.tvonline.cz/;;
"ct1") mpv --ytdl https://www.ceskatelevize.cz/ivysilani/zive/ct1;;
"ct2") mpv --ytdl https://www.ceskatelevize.cz/ivysilani/zive/ct2;;
"prima") firefox -new-window https://prima.iprima.cz/#main-wrapper;;
"primamax") firefox -new-window https://max.iprima.cz/#main-wrapper;;
"primacool") firefox -new-window https://cool.iprima.cz/#main-wrapper;;
"primakrimi") firefox -new-window https://krimi.iprima.cz/#main-wrapper;;
"primalove") firefox -new-window https://love.iprima.cz/#main-wrapper;;
"primazoom") firefox -new-window https://zoom.iprima.cz/#main-wrapper;;
"tvnatura") firefox -new-window https://www.tvnatura.cz;;
"nova") firefox https://novaplus.nova.cz/;echo "Nova Plus - bedjan@/o1" | osd_cat -d 60 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;

##TV_NEMECKO##

"tv_nemecke") firefox https://www.2ix2.com/;;

"ard") mpv --ytdl https://www.2ix2.com/ard/;;
"rtl2") mpv --ytdl https://www.2ix2.com/rtl2-live/;;
"ntv") mpv --ytdl https://www.2ix2.com/n-tv-live/;;
"rtlnitro") mpv --ytdl https://www.2ix2.com/rtl-nitro-live/;;
"superrtl") mpv --ytdl https://www.2ix2.com/super-rtl-live/;;
"tlc") mpv --ytdl https://www.2ix2.com/tlc/;;
"pro7") mpv --ytdl https://www.2ix2.com/pro7/;;
"pro7maxx") mpv --ytdl https://www.2ix2.com/prosieben-maxx/;;
"kabel1") mpv --ytdl https://www.2ix2.com/kabel-1/;;
"sat1") mpv --ytdl https://www.2ix2.com/sat1/;;
"sixx") mpv --ytdl https://www.2ix2.com/sixx/;;
"dmax") mpv --ytdl https://www.2ix2.com/dmax/;;
"kabel1doku") mpv --ytdl https://www.2ix2.com/kabel-1-doku/;;
"disney") mpv --ytdl https://www.2ix2.com/disney-channel/;;
"tele5") mpv --ytdl https://www.2ix2.com/tele-5/;;
"zdf") mpv --ytdl https://www.2ix2.com/zdf/;;

##TV_VSE##

"TV_1") palemoon https://www.2ix2.com/sat1-gold/;;

"TV_2") palemoon https://nydus.org/stream/;;

"Erste") palemoon https://live.daserste.de/;;

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

   "kalendar") firefox https://time.is/calendar;;
   "cas") firefox https://time.is/;;
   "zdrojak") firefox https://zdrojak.cz/;;
   "linuxexpress") firefox https://www.linuxexpres.cz/;;
    "cs") chromium --incognito https://bezpecnost.csas.cz/login/?client_id=georgeclient_cz ;echo "George - 7522952063/F1" | osd_cat -d 180 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
    "sparkasse") chromium --incognito https://www.ostsaechsische-sparkasse-dresden.de/de/home/service/online-mobile-banking.html;echo "Sparkasse - janbednar/1" | osd_cat -d 180 -s 1 -A left -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;

   "gkeep") firefox https://keep.google.com/#home;echo "Keep - bedjan/od" | $osd;;
   "gmail") firefox https://mail.google.com/mail/u/0/#inbox;echo "Gmail - bedjan/od" | osd_cat -d 10 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
   "yahoo_email") firefox https://login.yahoo.com;echo "Yahoo - bednarjan/od" | osd_cat -d 10 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
   "seznam_email") firefox https://login.szn.cz/;echo "Seznam - janbednar /od | cizinou /o1" | osd_cat -d 10 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
   "seznam_sweb") firefox https://login.szn.cz/?serviceId=sweb&loggedURL=http://webadmin.sweb.cz/;echo "Seznam sweb - janbednar /od | cizinou /o1" | osd_cat -d 10 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
   "seznam_ftp") firefox ftp://sweb.cz/;echo "Seznam sweb - janbednar /o1 | cizinou /o1" | osd_cat -d 10 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
   "ulozto") firefox https://uloz.to/login?key=logreg;echo "Ulozto - drobek1015/o1 | bednarova.rk/S" | osd_cat -d 10 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
   "vinted") firefox https://www.vinted.cz/member/general/login?ref_url=%2F&__cf_chl_captcha_tk__=06e60c0838f1e7a7cfd5731145275268b2f8d333-1622574905-0-AWud745mERmzGs9xCMmTroN332YOMEB1XBdXrPdWOQb8DLHtVc_N12zsvulYXNXLllall03fFZTibqJOiwZAUE81L6fVqCpHHbu8-3razVqegPH9re-QEQZfqN_EzyWYJCjI2_q2ZBDKAAQnTeVwL2CdkgiuZvHgTuBg8Jd0sF0cqNidaj8mYoXU3bamvN5TBnyEWwS7CHFcmdRPpW1RfAfMRh40-evwGj-9EHUsXZrma23ik_BXVbhs2URb_mb-GVAXMaakFCT3XV5bppHKz3oSSQz9jTwc73S1Ym0l089x-QfVBsc4XUGYtDeykKIjTo1rm7h9RLIAkGRq8nPcFCcdZBznaFb779UgKQ-KLYomfrqAkRsCYDPIvNSiPs_R3WRyAR2Y-jpSJTaKdTb78nX5sCH8qsqJ9Q9ksbvWsFlMsUE15ua8lyGrnQsN8KmTWkanrIneuVfsDHqVyqzpRZNAvz5r-CDm1pA5x5M4FkYXcwPL_KOJ6fR96lPDrN1cWOAlMHY8oRnfqNJMqhEva-zZ-BC31NoXdbsXtNr6xJtd3qr331Bq237FcAWYvwHtAWUsXCwV_Dh95L4WR747luRvi9htOMEXK34CgQk1GWc52dUVjzxTaz52vX-YNdjiKSYxnYlWP1stZtGLkRBqNyWdj7uGW-kdlOaKtfBqkWEpvg1OgUdgB21cuPY-GsWc6Gyq2XGrc35xgFbVdouNQxg;echo "vinted.cz - bedjan@/o1" | osd_cat -d 10 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
   "soundcloud") firefox https://soundcloud.com/signin;echo "soundcloud.com - bedjan@/o1" | osd_cat -d 10 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
   "difm") firefox https://www.di.fm/;echo "di.fm/ bedjan@/o" | osd_cat -d 10 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
   "gdisk") firefox https://drive.google.com/drive/;;
   "gdocs") firefox https://docs.google.com/document/u/0/;;
   "gphotos") firefox https://photos.google.com/?hl=cs&pli=1;;
   "gsites") firefox https://sites.google.com/site/bedjansite/;;
   "gtranslate") firefox https://translate.google.cz/;;
   "jobs") firefox https://www.jobs.cz/;;
   "seznam") firefox https://www.seznam.cz/;;
   "abclinuxu") firefox https://www.abclinuxu.cz/;;

   "root") firefox https://www.root.cz/;;
   "simplenote") firefox https://app.simplenote.com/login/;;
   "gtakeout") firefox https://takeout.google.com/settings/takeout?pli=1;;
   "web") firefox http://janbednar.sweb.cz/;;
   "dropbox") firefox https://www.dropbox.com/home;;
   "github") firefox https://github.com/bedjan/;;
   "github_all") firefox https://github.com/bedjan/debian/blob/master/skripty/all.sh;;
   "facebook") firefox https://www.facebook.com/;;
   "youtube") firefox https://www.youtube.com/;;
   "bazos") firefox https://www.bazos.cz/;;
   "ct") firefox https://www.ceskatelevize.cz/porady/a-z/;;
   "ctzive") firefox https://www.ceskatelevize.cz/ivysilani/serialy;;
   "csfd") firefox https://www.csfd.cz/;;
   "tvonline") firefox https://www.spustit.cz/tv-ct1-online-zdarma/;;
   "nemcina_youtube") firefox https://www.youtube.com/channel/UC4LQ7gUVS5w45ba1VubmJpg/videos;;
   "thinfi") firefox https://thinfi.com/;;
   "bitly") firefox https://bitly.com/;;
   "jdem") firefox http://jdem.cz/;;
   "protectedtext") firefox https://www.protectedtext.com/;;
   "dillinger") firefox https://dillinger.io/;;
   "githack") firefox https://raw.githack.com/;;
   "tinyurl") firefox https://tinyurl.com/app;;
   "github_poznamky") firefox https://github.com/bedjan/github/blob/master/README.md;;
   "programovani") firefox https://www.itnetwork.cz/prace-a-podnikani-v-it/jak-zacit-programovat-tvorit-aplikace-programy/;;
   "linux") firefox https://translate.google.cz/translate?sl=en&tl=cs&js=y&prev=_t&hl=cs&ie=UTF-8&u=linux.press&edit-text=&act=url;;
   "github_linux") firefox https://github.com/bedjan/debian/blob/master/poznamky/linux_cli.md;;
   "enviweb") firefox http://www.enviweb.cz/;;
   "mzp") firefox https://www.mzp.cz/;;
   "pronaladu") firefox https://www.pronaladu.cz/;;
   "github_akupresura") firefox https://github.com/bedjan/akupresura/blob/master/akupresura_prvni_pomoc.md;;
   "psychologie") firefox https://psychologie.cz/clanky/;;
   "epsychologie") firefox https://e-psycholog.eu/archiv;;
   "statistiky") firefox https://www.czso.cz/csu/czso/statistiky;;
   "zw") firefox https://arnika.org/zero-waste;;
   "zw1") firefox https://www.czechzerowaste.cz/;;
   "zw2") firefox http://zerowaste.bezobalu.org/;;
   "zw3") firefox https://translate.google.cz/translate?sl=en&tl=cs&js=y&prev=_t&hl=cs&ie=UTF-8&u=zerowasteeurope.eu&edit-text=&act=url;;
   "minimalismus") firefox https://zijememinimalismem.cz/minimalismus-co-to-je-prosim-te/;;
   "minimalismus1") firefox https://translate.google.cz/translate?hl=cs?sl=en&tl=cs&u=www.becomingminimalist.com/most-popular-posts/;;
   "github_zajmy") firefox https://github.com/bedjan/zajmy;;
   "github_manipulace") firefox https://github.com/bedjan/manipulace;;
   "github_windows") firefox https://github.com/bedjan/windows;;
   "github_home") firefox https://github.com/bedjan/home;;
   "cr_online") firefox https://www.mujrozhlas.cz/zive;;
   "ulice") firefox https://novaplus.nova.cz/porad/ulice/cele-dily;;
   "ruzovka") firefox https://novaplus.nova.cz/porad/ordinace-v-ruzove-zahrade-2;;

##FIREFOX_ROZSIRENI##
   "firefox_ucet") firefox https://accounts.firefox.com/signin?context=fx_desktop_v3&entrypoint=fxa_app_menu&action=email&service=sync;echo "Firefox account/ bedjan@/o1" | osd_cat -d 10 -s 1 -A right -l 1 -p middle -o 60 -c green -f '-adobe-helvetica-bold-r-normal--34-240-100-100-p-182-iso8859-1';;
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


