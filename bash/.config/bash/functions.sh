sif(){
    if(( $# == 1 )); then
        path=.
        patt=$1
    else
        path=$1
        patt=$2
    fi;
    if [ $1 == "--help" ]; then
        cat <<'EOF'
Search in file(s). Usage:
    sif <pattern> # will look in current directory for given <pattern>
    sif <path> <pattern> # will look at given path for given <pattern>
EOF

    fi
    grep -rnw $path -e $patt
}

inspect(){
    if [ "$1" == "--help" ]; then
        echo "Opens chromium with chrome://inspect as URL. Needs xdotool package to work"
    else
        bash -c "chromium-browser &> /dev/null&sleep 2&&xdotool type 'chrome://inspect'&&xdotool key Return"
    fi
}

geo-app-status () {
    confName=$2
    appName=$1
    status=$(ps -A -F | grep $confName | wc -l)
    if [ $status -gt 0 ]; then
        echo $appName running
    else
        echo $appName stopped
    fi
}

geo-status (){
    geo-app-status 'Geo AWS' 'aws.conf'
    geo-app-status 'Geo Core' 'core.conf'
}


activate-ruby(){
    source ~/.rvm/scripts/rvm
    rvm use 2.6.1
}

activate-ruby-if-needed(){
    if hash bundle 2>/dev/null; then
        echo "bundle set" > /dev/null
    else
        activate-ruby
    fi
}

guard(){
    activate-ruby-if-needed
    bundle exec guard
}

asciidoctor-pdf(){
    activate-ruby-if-needed
    bundle exec asciidoctor-pdf $@
}

asciidoctor-docx(){
    adoc=$1
    filename="$(basename "$adoc" .adoc)"
    activate-ruby-if-needed
    bundle exec asciidoctor -b docbook $adoc
    pandoc -f docbook -t docx "$filename.xml" -o "$filename.docx"
}

grep-history(){
    cat ~/.bash_history | grep $@
}
