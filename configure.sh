#!/usr/bin/env sh

tools(){
    for tool in tools/*.sh; do
        sh $tool
    done
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
    cp ./opt ~/opt -r 
}

install(){
    tools
    bashrc
    opt
}


if [ "$1" = "tools" ]; then
    echo "Installing dependencies"
    tools
else
    echo "Installing..."
    install
fi
echo "...Done"
