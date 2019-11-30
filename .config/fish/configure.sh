#!/usr/bin/env sh

DOTFILES_FISH=`dirname $0`

_cp(){
    f=$1
    n="$f.fish"
    t=$HOME/.config/fish/$n
    s=$DOTFILES_FISH/$n
    if [ ! -f $t ]; then
        cp $s $t
    fi
}

_cp functions 
_cp pathes
_cp aliases  
_cp config   
