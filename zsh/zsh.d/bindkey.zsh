#Emacs风格 键绑定
bindkey -e
#bindkey -v
#设置 [DEL]键 为向后删除
bindkey "\e[3~" delete-char # DELETE
bindkey "^[OH" beginning-of-line # HOME
bindkey "^[OF" end-of-line # END
bindkey '^[[1;3D' backward-word # ALT-LEFT
bindkey '^[[1;3C' forward-word # ALT-RIGHT
bindkey '^[[3;3~' delete-word # ALT-DELETE
bindkey '^[[Z' reverse-menu-complete # SHIFT-TAB
bindkey -s '^[u' '^Ucd ..^M' # ALT-U; chdir to parent directory
bindkey '^[[5~' history-search-backward # PAGEUP; complete current command line using history
bindkey '^[[6~' history-search-forward # PAGEUP; complete current command line using history

##在命令前插入 sudo {{{
#定义功能
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line                 #光标移动到行末
}
zle -N sudo-command-line
#定义快捷键为： [Esc] [Esc]
bindkey "\e\e" sudo-command-line
#}}}

#{{{ F1 计算器
arith-eval-echo() {
	LBUFFER="${LBUFFER}echo \$(( "RBUFFER=" ))$RBUFFER"
}
zle -N arith-eval-echo
bindkey "^[[11~" arith-eval-echo
#}}}
