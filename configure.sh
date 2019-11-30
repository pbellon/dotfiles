#!/usr/bin/env sh

mv ~/.bashrc ~/.bashrc.bak

git submodule update --init
stow -t ~ bash fish emacs secrets
./fonts/install-fonts.sh

