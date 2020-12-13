#!/bin/bash/
   
pacman -Qqen > pkglist.txt
pacman -Qqem > localpkglist.txt
cp ~/pkglist.txt ~/archscript
cp ~/localpkglist.txt ~/archscript
