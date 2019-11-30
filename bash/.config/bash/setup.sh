#!/usr/bin/env bash


export SHELL_CONF_DIR=$HOME/.config/bash

# custom utils, paths etc. 
source $SHELL_CONF_DIR/variables.sh
source $SHELL_CONF_DIR/paths.sh
source $SHELL_CONF_DIR/aliases.sh
source $SHELL_CONF_DIR/functions.sh

# Autojump activation
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh
