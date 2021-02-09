#!/bin/bash/
#Bash script to install packages and configure a new system.


####UPDATE AND INSTALL SOFTWARE####

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

#Install paru
echo '###Installing paru..'
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd

#Install packages from localpkglist
paru -S --needed --noconfirm - < ~/localpkglist.txt

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
qutebrowser &

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

#Install katriawm, bevelbar, infofeld, and nhkd
git clone https://github.com/xenophile-mode/nhkd.git ~/.local/src/nhkd
git clone https://github.com/xenophile-mode/katriawm.git ~/.local/src/katriawm
git clone https://github.com/xenophile-mode/bevelbar.git ~/.local/src/bevelbar
git clone https://www.uninformativ.de/git/infofeld2.git ~/.local/src/infofeld2
cd ~/.local/src/nhkd
make
sudo make install
cd
cd ~/.local/src/katriawm/src
make
sudo make install
cd
cd ~/.local/src/bevelbar
make
sudo make install
cd
cd ~/.local/src/infofeld2
make
sudo make install

#Install fonts
sudo cp ~/dotfiles/home/fonts/ScreenBold.ttf /usr/share/fonts/TTF
sudo cp ~/dotfiles/home/fonts/ScreenMedium.ttf /usr/share/fonts/TTF


####ENABLE SERVICES####

#Enable dwm in display manager
sudo cp ~/dotfiles/root/Xsessions/usr/share/xsessions/dwm.desktop /usr/share/xsessions

#Disable dislpay manager
sudo systemctl disable lightdm.service


#Enable windscribe vpn
sudo systemctl start windscribe
sudo systemctl enable windscribe

#Enable ntp sync
sudo systemctl enable --now chronyd

#Enable haveged
sudo systemctl start haveged
sudo systemctl enable haveged





####CONFIGURE SYSTEM/SOFTWARE####

#Configure fonts
sudo cp ~/dotfiles/root/fonts/ScreenMedium.ttf /usr/share/fonts/TTF/

#Configure picom
cp ~/dotfiles/home/picom/.config/picom.conf ~/.config

#Keyboard configuration
setxkbmap -option caps:swapescape

#Configure vim 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/dotfiles/home/vim/.vimrc ~

#Configure dmenu_extended
cp ~/dotfiles/home/dmenu_extended/.config/dmenu-extended/config/dmenuExtended_preferences.txt ~/.config/dmenu-extended

#Configure xprofile
cd
cp ~/dotfiles/home/xprofile/.xprofile ~
cd
sudo chmod +x .xprofile

#Configure qutebrowser
cp ~/dotfiles/home/qutebrowser/.config/qutebrowser/autoconfig.yml ~/.config/qutebrowser

#Configure moc
cp ~/dotfiles/home/.moc/config ~/.moc

#Configure xterm
cp ~/dotfiles/home/Xresources/.Xresources ~
xrdb -merge .Xresources

#Configure Grub
sudo cp ~/dotfiles/root/grub/etc/default/grub /etc/default
sudo cp ~/dotfiles/root/update-grub/update-grub /usr/sbin
sudo chown root:root /usr/sbin/update-grub
sudo chmod 755 /usr/sbin/update-grub
sudo update-grub

#Configure .bashrc
cp ~/dotfiles/home/bash/.bashrc ~

#Configure shell
sudo chsh --shell /bin/bash $USER

#Configure .bash_profile
cp ~/dotfiles/home/bash/.bash_profile ~

#Configure .xinitrc
cp ~/dotfiles/home/xinitrc/.xinitrc ~

#Configure kakoune
sudo cp ~/dotfiles/home/kak/kakrc ~/.config/kak

#Configure twm
sudo cp ~/dotfiles/home/twm/.twmrc ~

#Run pywal
cd
cp ~/dotfiles/papes/Wallpaper13.jpg ~
wal -i Wallpaper17.png

###Configure Fish shell (UNCOMMENT THIS SECTION IF YOU WANT FISH SHELL)
#cp ~/dotfiles/bash/.bash_aliases ~
#cd ~/.config/fish
#mkdir functions
#cd
#cp ~/dotfiles/fish/fish_import_bash_aliases.fish ~/.config/fish/functions
#cd ~/.config/fish/functions
#fish_import_bash_aliases

#Configure termite
cp ~/dotfiles/home/termite/.config/termite/config ~/.config/termite

#Configure cwm
cp ~/dotfiles/home/cwm/.cwmrc ~

#Copy pl.sh to home directory
cp ~/archscript/pl.sh ~

#Configure mpv
cp ~/dotfiles/home/mpv/mpv.conf ~/.config/mpv

#Configure cmus
cp ~/dotfiles/home/cmus/autosave ~/.config/cmus

#Configure hosts
sudo cp ~/dotfiles/root/hosts/hosts /etc

#Configure mimi for default applications
cp ~/dotfiles/home/mimi/mime.conf ~/.config/mimi

#Configure kbshortcut-scripts
cp ~/dotfiles/home/kbshortcut-scripts ~

#Configure bevelbar and infofeld
cp ~/dotfiles/home/bevelbar-scripts/katriawm-launch ~
cp ~/dotfiles/home/bevelbar-scripts/bevelbar-launch-status-bars ~


echo '###Finished!###'

exec bash
