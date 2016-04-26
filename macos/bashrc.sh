# linux like commands
#if brew list | grep coreutils > /dev/null; then
#    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#    alias ls='ls -F --show-control-chars --color=auto'
#    eval `gdircolors -b $HOME/.dir_colors`
#fi

if [ -r $HOME/.bin ]; then
    export PATH="$PATH:$HOME/.bin"
fi

if type brew>/dev/null 2>&1; then
    brew_prefix=$(brew --prefix)
    if [ -f $brew_prefix/etc/bash_completion ]; then
        source $brew_prefix/etc/bash_completion
    fi
fi

export CLICOLOR=1

#PS1="$BLUE\u$BCYAN@${YELLOW}macos $PURPLE[$GREEN\w$PURPLE] $BCYAN\$>$RESET "
