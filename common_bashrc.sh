color_base=30
bgcolor_base=40

for color in BLACK RED GREEN YELLOW BLUE PURPLE CYAN GRAY; do
    eval $color=\"'\[\e[0;'${color_base}m'\]'\"
    eval B$color=\"'\[\e[1;'${color_base}m'\]'\"
    eval BG$color=\"'\[\e['${bgcolor_base}m'\]'\"
    (( color_base = $color_base + 1 ))
    (( bgcolor_base = $bgcolor_base + 1 ))
done

RESET="\[\e[0m\]"

mcd() { mkdir -p "$1"; cd "$1"; }

pd() {
    if [[ "$1" =~ ^[0-9+]$ ]]; then
        target_dir=".."
        for (( i=2; i<=$1; i++ )); do
            target_dir="${target_dir}/.."
        done;
        cd $target_dir
    fi
}

man() {
    env GROFF_NO_SGR=1 \
        LESS_TERMCAP_mb=$'\E[1;36m' \
        LESS_TERMCAP_md=$'\E[1;36m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[1;44;33m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[1;33m' \
        man "$@"
}

function proxy_on() {
    export no_proxy="localhost,127.0.0.1"
    export http_proxy="http://127.0.0.1:1024"
    export https_proxy=$http_proxy
    export ftp_proxy=$http_proxy
    export rsync_proxy=$http_proxy
    echo -e "Proxy set to $http_proxy"
}

function proxy_off(){
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
    echo -e "Proxy environment variable removed"
}
