# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

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

PS1="$BLUE\u $PURPLE[$GREEN\w$PURPLE]"'$(test -n "$(git branch 2>/dev/null)" && echo " [")'"$BYELLOW"'$(git branch 2>/dev/null | grep "^*" | cut -d " " -f 2,2)'"$PURPLE"'$(test -n "$(git branch 2>/dev/null)" && echo "]")'" $BCYAN\$>$RESET "

# for root
#PS1="\[\e[31m\]\u \[\e[35m\][\[\e[32m\]\W\[\e[35m\]] \[\e[1;36m\]\$>\[\e[0m\] "

. $HOME/.bash_aliases
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

mcd() { mkdir -p "$1"; cd "$1"; }

pd() {
    for i in $(seq "$1"); do
        cd ..
    done;
}
