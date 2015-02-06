#if brew list | grep coreutils > /dev/null; then
#    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#    alias ls='ls -F --show-control-chars --color=auto'
#    eval `gdircolors -b $HOME/.dir_colors`
#fi

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
