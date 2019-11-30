#!/usr/bin/env sh


if hash docker 2>/dev/null; then
    echo "Docker already installed"
else
    sudo pacman -S -yy docker
fi


if groups $USER | grep -qw "docker"; then
    echo $USER already in docker group
else
    sudo usermod -a -G docker $USER
fi

echo "Docker configuration done"
