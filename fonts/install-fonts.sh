#!/usr/bin/env sh

SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`


# Install iA writer fonts
for dir in $SCRIPTPATH/ia-writer/ia-writer-*; do
    dirname=${dir##*/}
    if [ ! -L /usr/share/fonts/$dirname ]; then
        sudo ln -s $dir /usr/share/fonts/$dirname
    fi
done

sudo fc-cache -v
