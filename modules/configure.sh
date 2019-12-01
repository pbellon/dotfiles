#!/usr/bin/env sh

SCRIPTPATH=`dirname $0`

cd $SCRIPTPATH

stow -t ~ \
	bash \
	fish \
	emacs \
	secrets

./fonts/install-fonts.sh

cd -
