if [ ! -d ~/.sdkman ]; then
    curl -s "https://get.sdkman.io" | bash
fi

source "$HOME/.sdkman/bin/sdkman-init.sh"
