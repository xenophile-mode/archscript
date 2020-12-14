#!/bin/bash/
#Bash script to install packages and configure a new system.

#Run these commands to generate new package lists
#pacman -Qqen > pkglist.txt
#pacman -Qqem > localpkglist.txt

#Move to home and add pkglist files
cd	
cp ~/archscript/pkglist.txt ~ 	
cp ~/archscript/localpkglist.txt ~

#Update system
echo '###Updating System..'
sudo pacman -Syyu

#Install packages from pkglist
echo '###Installing Packages from pkglist..'
sudo pacman -S --needed $(comm -12 <(pacman -Slq|sort) <(sort pkglist.txt) )

#Install yay
echo '###Installing yay..'
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay
makepkg -si
cd

#Install pacaur and auracle-git dependancy for pacaur
echo '###Installing pacaur and dependancies..'
yay -S --needed --noconfirm - < ~/localpkglist.txt

#Install suckless software
echo '###Installing suckless software..'
sudo pacman -S base-devel git libx11 libxft xorg-server xorg-xinit terminus-font
mkdir -p ~/.local/src
git clone git://git.suckless.org/dwm ~/.local/src/dwm
cd ~/.local/src/dwm
make clean
sudo make install
cd

#Install Doom Emacs
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom upgrade
~/.emacs.d/bin/doom sync

#Install mcross browser
pip install --user mcross

#Enable dwm in display manager
sudo cp ~/archscript/dotfiles/dwm.desktop /usr/share/xsessions

#Enable ly dislpay manager
sudo systemctl disable lightdm.service
sudo systemctl enable ly.service

#Enable windscribe vpn
sudo systemctl start windscribe
sudo systemctl enable windscribe

#Configure picom
cp archscript/dotfiles/picom.conf ~/.config

#Keyboard configuration
setxkbmap -option caps:swapescape

#Configure vim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/archscript/dotfiles/.vimrc ~

#Configure dwm
sudo cp ~/archscript/dotfiles/dwm/config.h ~/.local/src/dwm
cd
cd .local/src/dwm
sudo make install
cd

#Configure xprofile
cd
cp ~/archscript/dotfiles/.xprofile ~
cd
sudo chmod +x .xprofile

#Configure status bar
cd /
sudo cp -R ~/archscript/dotfiles/dwmbar/config usr/share/dwmbar




#Configure st/terminal
#Configure text editors


#Configure Grub
sudo cp ~/archscript/dotfiles/grub/grub /etc/default
sudo cp ~/archscript/dotfiles/grub/update-grub /usr/sbin
sudo chown root:root /usr/sbin/update-grub
sudo chmod 755 /usr/sbin/update-grub
sudo update-grub

#Configure .bashrc
cp ~/archscript/dotfiles/bash/.bashrc ~

#Configure Fish shell
cp ~/archscript/dotfiles/bash/.bash_aliases ~
cd ~/.config/fish
mkdir functions
cd
cp ~/archscript/dotfiles/fish/fish_import_bash_aliases.fish ~/.config/fish/functions
cd ~/.config/fish/functions
fish_import_bash_aliases

#Configure termite
cp ~/archscript/dotfiles/terms/termite/config ~/.config/termite

#Copy pl.sh to home directory
cp ~/archscript/pl.sh ~

exec bash
