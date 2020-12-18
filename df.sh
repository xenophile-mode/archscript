#!/bin/bash/
#A bash script to automatically update dotfiles repo

cp ~/.bashrc ~/archscript/dotfiles/bash
cp ~/.bash_aliases ~/archscript/dotfiles/bash

cp ~/.config/dmenu-extended/config/dmenuExtended_preferences.txt ~/archscript/dotfiles/dmenu_extended

cp ~/.local/src/dwm/config.h ~/archscript/dotfiles/dwm

sudo cp /usr/share/dwmbar/config ~/archscript/dotfiles/dwmbar

cp ~/.config/fish/functions/fish_import_bash_aliases.fish ~/archscript/dotfiles/fish

sudo cp /etc/default/grub ~/archscript/dotfiles/grub
sudo cp /usr/sbin/update-grub ~/archscript/dotfiles/grub

cp ~/.config/qutebrowser/autoconfig.yml ~/archscript/dotfiles/qutebrowser

cp ~/.config/termite ~/archscript/dotfiles/terms/termite

cp ~/.vimrc ~/archscript/dotfiles

cp ~/.xprofile ~/archscript/dotfiles

cp /usr/share/xsessions/dwm.desktop ~/archscript/dotfiles

cp ~/.config/picom.conf ~/archscript/dotfiles 

cd ~/archscript
git add .
git commit -m "updated dotfiles"
git push
