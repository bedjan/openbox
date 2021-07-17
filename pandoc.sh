#!/bin/bash
pandoc -s $HOME/.config/openbox/web.md -o $HOME/.config/openbox/web.html
pandoc -s $HOME/.config/openbox/mm.md -o $HOME/.config/openbox/mm.html
pandoc -s $HOME/.config/openbox/zivotopis.md -o $HOME/.config/openbox/zivotopis.html
pandoc -s $HOME/.config/openbox/all.md -o $HOME/.config/openbox/all.html
pandoc -s $HOME/.config/openbox/manipulace.md -o $HOME/.config/openbox/manipulace.html
pandoc -s $HOME/.config/openbox/bal.md -o $HOME/.config/openbox/bal.html
pandoc -s $HOME/.config/openbox/zivotopis.md -o $HOME/.config/openbox/zivotopis.pdf
