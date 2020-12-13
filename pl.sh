#!/bin/bash/
   
pacman -Qqen > pkglist.txt
pacman -Qqem > localpkglist.txt
mv ~/pkglist.txt ~/archscript
mv ~/localpkglist.txt ~/archscript
