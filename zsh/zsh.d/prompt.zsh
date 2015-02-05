setopt prompt_subst

current_git_branch() {
    [ -n "$(git branch 2>/dev/null)" ] && echo "$YELLOW-> $FINISH""$MAGENTA$(git branch | grep '^*' | cut -d ' ' -f 2,2)$FINISH""$YELLOW <-$FINISH"
}

PROMPT="$YELLOW"["$CYAN%n$YELLOW"$"$GREEN%~$YELLOW]>$FINISH "
RPROMPT='$(current_git_branch)'
