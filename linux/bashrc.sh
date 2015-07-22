PS1="$BLUE\u$BCYAN@${YELLOW}linux $PURPLE[$GREEN"'$(pwd | sed "s/^\/\([^\/]\+\)\/.*\/\([^\/]\+\)\/\([^\/]\+\)\/\([^\/]*\)$/\/\1\/ ... \/\3\/\4/")'"$PURPLE]"'$(test -n "$(git branch 2>/dev/null)" && echo " [")'"$BYELLOW"'$(git branch 2>/dev/null | grep "^*" | cut -d " " -f 2,2)'"$PURPLE"'$(test -n "$(git branch 2>/dev/null)" && echo "]")'" $BCYAN)>$RESET "

# for root
#PS1="\[\e[31m\]\u \[\e[35m\][\[\e[32m\]\W\[\e[35m\]] \[\e[1;36m\]\$>\[\e[0m\] "

export INPUT_METHOD=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK3_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
