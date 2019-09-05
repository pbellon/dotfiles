#!/usr/bin/env sh

tools(){
    echo "Installing tools..."
    for tool in tools/*.sh; do
        echo "Running $tool"
        sh $tool
    done
    echo "...done with tools"
}

bashrc(){
    if [ -f ~/.bashrc ]; then
        backup_name=~/.bashrc.bak
        if [ -f $backup_name ]; then
            n=$(ls -Al ~ | grep $backup_name | wc -l)
            backup_name="$backup_name.$n"
        fi
        cp ~/.bashrc $backup_name
    fi
    cp ./.bashrc ~/.bashrc
}

opt(){
    if [ ! -d ~/opt ]; then
        mkdir ~/opt/
    fi;
    cp ./opt/* ~/opt -r 
}

config(){
    cp ./.config/* ~/.config -r
}

all(){
    tools
    opt
    config
    bashrc
}

help(){
    b=$(tput bold)
    n=$(tput sgr0)

    echo -e "Usage:
./configure.sh <task>

Available tasks:              

        ${b}help${n}    show this message
        ${b}all${n}     run all configuration tasks (see bellow)
        ${b}opt${n}     configure ~/opt directory
        ${b}tools${n}   install dependencies located under tools dir"
}


if [[ "$(type -t $@)" =~ .*function ]]; then
    eval $(printf "%q " "$@")
else
    help
fi
