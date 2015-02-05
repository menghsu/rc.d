export MYZSHRC=$HOME/.zsh

# 颜色变量初始化 {{{
autoload colors
colors

for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval $color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done

FINISH="%{$terminfo[sgr0]%}"
# }}}

function load_zsh() {
	if [ -f $1 ]; then
		. $1
	fi
}

for z in $MYZSHRC/zsh.d/*.zsh; do
    load_zsh $z
done

[[ -r $HOME/.bash_aliases ]]; . $HOME/.bash_aliases
