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
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#Install packages from localpkglist
yay -S --needed --noconfirm - < ~/localpkglist.txt

#Clone my dotfiles repo
cd
git clone https://github.com/xenophile-mode/dotfiles.git

#Install suckless software
echo '###Installing suckless software..'
sudo pacman -S base-devel git libx11 libxft xorg-server xorg-xinit terminus-font
mkdir -p ~/.local/src
git clone https://github.com/xenophile-mode/dwm.git ~/.local/src/dwm
cd ~/.local/src/dwm
make clean
sudo make install
cd
git clone https://github.com/xenophile-mode/st.git ~/.local/src/st
cd ~/.local/src/st
make clean
sudo make install
cd
git clone https://github.com/xenophile-mode/dmenu.git ~/.local/src/dmenu
cd ~/.local/src/dmenu
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

#Install my fork of dwmbar
git clone https://github.com/xenophile-mode/dwmbar.git
cd dwmbar
sudo ./install.sh
cd

#Enable dwm in display manager
sudo cp ~/dotfiles/dwm.desktop /usr/share/xsessions

#Enable ly dislpay manager
sudo systemctl disable lightdm.service
sudo systemctl enable ly.service

#Enable windscribe vpn
sudo systemctl start windscribe
sudo systemctl enable windscribe

#Enable ntp sync
sudo systemctl enable --now chronyd

#Configure picom
cp ~/dotfiles/picom.conf ~/.config

#Keyboard configuration
setxkbmap -option caps:swapescape

#Configure vim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/dotfiles/.vimrc ~

#Configure dmenu_extended
cp ~/dotfiles/dmenu_extended/dmenuExtended_preferences.txt ~/.config/dmenu-extended

#Configure xprofile
cd
cp ~/dotfiles/.xprofile ~
cd
sudo chmod +x .xprofile

#Configure status bar
cd /
sudo cp -R ~/dotfiles/dwmbar/config usr/share/dwmbar

#Configure qutebrowser
qutebrowser
cp ~/dotfiles/qutebrowser/autoconfig.yml ~/.config/qutebrowser

#Configure moc
cp ~/dotfiles/.moc/config ~/.moc

#Configure xterm
cp ~/dotfiles/.Xresources ~
xrdb -merge .Xresources

#Configure text editors


#Configure Grub
sudo cp ~/dotfiles/grub/grub /etc/default
sudo cp ~/dotfiles/grub/update-grub /usr/sbin
sudo chown root:root /usr/sbin/update-grub
sudo chmod 755 /usr/sbin/update-grub
sudo update-grub

#Configure .bashrc
cp ~/dotfiles/bash/.bashrc ~

#Configure shell
sudo chsh --shell /bin/bash $USER

#Run pywal
cd
cp ~/dotfiles/papes/Wallpaper13.jpg ~
wal -i Wallpaper17.png

#Configure Fish shell
cp ~/dotfiles/bash/.bash_aliases ~
cd ~/.config/fish
mkdir functions
cd
cp ~/dotfiles/fish/fish_import_bash_aliases.fish ~/.config/fish/functions
cd ~/.config/fish/functions
fish_import_bash_aliases

#Configure termite
cp ~/dotfiles/terms/termite/config ~/.config/termite

#Copy pl.sh to home directory
cp ~/archscript/pl.sh ~

echo '###Please run fish_import_bash_aliases'

exec bash
