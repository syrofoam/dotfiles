#!/bin/bash
#mousefix
gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true

#disable meta+1+2+3+4
gsettings set org.gnome.shell.keybindings switch-to-application-N [1-4]
