#!/bin/bash
for pkgName in $(cat gnome) 

do
  pacman -R --noconfirm $pkgName
done
echo "Removed packages specified in file."
