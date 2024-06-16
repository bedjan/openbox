# Openbox

cd $HOME/;git clone https://github.com/bedjan/openbox.git; mkdir $HOME/.config/openbox/.themes; cp -rf $HOME/openbox/*.* $HOME/.config/openbox/;echo Final

## Web

https://raw.githack.com/bedjan/openbox/main/web.html

## Obkey

wget https://github.com/luffah/obkey/raw/master/obkey.deb; sudo dpkg -i obkey.deb;obkey

## Obmenu-generator

https://software.opensuse.org/download.html?project=home%3AHead_on_a_Stick%3Aobmenu-generator&package=obmenu-generator

# Openbox themes

cd $HOME/;git clone https://github.com/addy-dclxvi/openbox-theme-collections.git; mkdir $HOME/.themes; cp -rf $HOME/openbox-theme-collections/*.* $HOME/.themes;;echo Final;obconf

# Markdown to html

perl Markdown.pl index.md > index.html

pandoc -s index.md | lynx -stdin

# Mpv player

mpv  --player-operation-mode=pseudo-gui   --fs=no  --cache-secs=60 --demuxer-readahead-secs=0 --ytdl-raw-options=no-check-certificate=

# Vzhled mac osx

https://github.com/vinceliuice/WhiteSur-gtk-theme

