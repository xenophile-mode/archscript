#!/bin/bash/
#Bash script to install packages and configure a new system.

#Run these commands to generate new package lists
#pacman -Qqen > pkglist.txt
#pacman -Qqem > localpkglist.txt

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

#Enable dwm in display manager
sudo mv dwm.desktop /usr/share/xsessions

#Enable ly dislpay manager
sudo systemctl disable lightdm.service
sudo systemctl enable ly.service

#Enable windscribe vpn
sudo systemctl start windscribe
sudo systemctl enable windscribe

#Configure picom
mv picom.conf .config

#Keyboard configuration
setxkbmap -option caps:swapescape



#Configure vim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#Configure dwm
cd archscript/dotfiles/dwm
cp config.h .local/src/dwm
cd
cd .local/src/dwm
sudo make install
cd
cd .local/src/dwm
git apply st-scrollback-0.8.4.diff
sudo make install

#Configure xprofile
cp /home/$USER/archscript/dotfiles/.xprofile /home/$USER
chmod +x .xprofile


#Configure slstatus
#Configure st
#Configure text editors

#Configure Grub
cp /home/$USER/archscript/dotfiles/grub /etc/default

#Configure .bashrc
cp /home/$USER/archscript/dotfiles/.bashrc /home/$USER




exec bash


