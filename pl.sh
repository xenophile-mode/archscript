#!/bin/bash/
#Pkglist generation script

pacman -Qqen > pkglist.txt
pacman -Qqem > localpkglist.txt
mv ~/pkglist.txt ~/archscript
mv ~/localpkglist.txt ~/archscript
cd archscript
git add pkglist.txt localpkglist.txt
git commit -m "updated pkglists"
git push
