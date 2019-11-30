#!/usr/bin/env sh

git submodule update --init
stow -t ~ bash fish emacs secrets
./fonts/install-fonts.sh 
