#if brew list | grep coreutils > /dev/null; then
#    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#    alias ls='ls -F --show-control-chars --color=auto'
#    eval `gdircolors -b $HOME/.dir_colors`
#fi

if [ -r $HOME/.bin ]; then
    export PATH="$PATH:$HOME/.bin"
fi

export CLICOLOR=1

#alias ll='ls -lhF'
#alias lla='ls -lhFA'
#alias la='ls -A'
#alias l='ls -CF'
#
#alias grep='grep --color'
#alias egrep='egrep --color'
#alias fgrep='fgrep --color'

. $HOME/.bash_aliases

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

PS1="$BLUE\u $PURPLE[$GREEN\w$PURPLE] $BCYAN\$>$RESET "

export ANT_HOME=/usr/local/Cellar/ant/1.9.4

