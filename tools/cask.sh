#!/usr/bin/env sh
if [ ! -d ~/.cask/ ]; then
    curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
fi
