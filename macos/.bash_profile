#if brew list | grep coreutils > /dev/null; then
#    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#    alias ls='ls -F --show-control-chars --color=auto'
#    eval `gdircolors -b $HOME/.dir_colors`
#fi

if [ -r $HOME/.bin ]; then
    export PATH="$PATH:$HOME/.bin"
fi

target="$HOME/git/rc.d/common_bashrc.sh"
if [ -r "$target" ]; then
    . $target
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

PS1="$BLUE\u $PURPLE[$GREEN\w$PURPLE] $BCYAN\$>$RESET "

export ANT_HOME=/usr/local/Cellar/ant/1.9.4

. $HOME/.bash_aliases


