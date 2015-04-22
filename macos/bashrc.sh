#if brew list | grep coreutils > /dev/null; then
#    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#    alias ls='ls -F --show-control-chars --color=auto'
#    eval `gdircolors -b $HOME/.dir_colors`
#fi

if [ -r $HOME/.bin ]; then
    export PATH="$PATH:$HOME/.bin"
fi

export CLICOLOR=1

PS1="$BLUE\u $PURPLE[$GREEN\w$PURPLE] $BCYAN\$>$RESET "
