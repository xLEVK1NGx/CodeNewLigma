#!/bin/sh

echo 'CodeNewLigma Nerd Font Installer'
echo '(1) System-wide install'
echo '(2) User-only install'

read CHOICE

if [ "$CHOICE" = "1" ]; then
	FONT_DIR="/usr/share/fonts/CodeNewLigma"
	sudo mkdir -p "$FONT_DIR"    || { printf "\033[31mERROR\033[0m: Couldn't create system-wide fonts/CodeNewLigma dir\n"; exit 1 } 
	sudo cp -R OTF/* "$FONT_DIR" || { printf "\033[31mERROR\033[0m: Couldn't copy font files\n"; exit 2 }

elif [ "$CHOICE" = "2" ]; then
	FONT_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts/CodeNewLigma"
	mkdir -p "$FONT_DIR"    || { printf "\033[31mERROR\033[0m: Couldn't create fonts/CodeNewLigma dir for this user\n"; exit 1 }
	cp -R OTF/* "$FONT_DIR" || { printf "\033[31mERROR\033[0m: Couldn't copy font files\n"; exit 2 }
	

else 
	printf "\033[31mERROR\033[0m: Invalid input\n"
	exit 3
fi

fc-cache -fv || { printf "\033[31mERROR\033[0m: fc-cache failed.\n"; exit 4 } 
exit 0
