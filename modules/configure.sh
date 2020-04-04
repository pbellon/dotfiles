#!/usr/bin/env sh

SCRIPTPATH=`dirname $0`

cd $SCRIPTPATH

stow -t ~ \
	bash \
	fish \
	emacs \
	notes \
	secrets

./fonts/install-fonts.sh

cd -
