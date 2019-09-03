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
