# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

target="$HOME/git/rc.d/common_bashrc.sh"
if [ -r "$target" ]; then
    . $target
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

PS1="$BLUE\u $PURPLE[$GREEN"'$(pwd | sed "s/^\/\([^\/]\+\)\/.*\/\([^\/]\+\)\/\([^\/]\+\)\/\([^\/]*\)$/\/\1\/...\/\3\/\4/")'"$PURPLE]"'$(test -n "$(git branch 2>/dev/null)" && echo " [")'"$BYELLOW"'$(git branch 2>/dev/null | grep "^*" | cut -d " " -f 2,2)'"$PURPLE"'$(test -n "$(git branch 2>/dev/null)" && echo "]")'" $BCYAN\$>$RESET "

# for root
#PS1="\[\e[31m\]\u \[\e[35m\][\[\e[32m\]\W\[\e[35m\]] \[\e[1;36m\]\$>\[\e[0m\] "

. $HOME/.bash_aliases
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

