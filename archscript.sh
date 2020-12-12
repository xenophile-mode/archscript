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
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
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
git clone git://git.suckless.org/st ~/.local/src/st
git clone git://git.suckless.org/dwm ~/.local/src/dwm
git clone git://git.suckless.org/st ~/.local/src/slstatus
cd ~/.local/src/st
make clean
sudo make install
cd
cd ~/.local/src/dwm
make clean
sudo make install
cd
cd ~/.local/src/slstatus
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
sudo cp ~/archscript/dotfiles/slstatus/config.h ~/.local/src/slstatus
cd
cd .local/src/slstatus
sudo make install
cd



#Configure xprofile
cd
cp ~/archscript/dotfiles/.xprofile ~
cd
sudo chmod +x .xprofile



#Configure slstatus

#Configure st
#Configure text editors

#Configure Grub
sudo cp ~/archscript/dotfiles/grub/grub /etc/default
sudo cp ~/archscript/dotfiles/grub/update-grub /usr/sbin
sudo chown root:root /usr/sbin/update-grub
sudo chmod 755 /usr/sbin/update-grub
sudo update-grub


#Configure .bashrc
cp ~/archscript/dotfiles/.bashrc ~




exec bash


