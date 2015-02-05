#标题栏、任务栏样式{{{
case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
precmd () { print -Pn "\e]0;%n@%M//%/\a" }
preexec () { print -Pn "\e]0;%n@%M//%/\ $1\a" }
;;
esac
#}}}
 
#编辑器
export EDITOR=vim
#输入法
export XMODIFIERS="@im=fcitx"
export QT_MODULE=fcitx
export GTK_MODULE=fcitx
#关于历史纪录的配置 {{{
#历史纪录条目数量
export HISTSIZE=1000
#注销后保存的历史纪录条目数量
export SAVEHIST=10000
#历史纪录文件
export HISTFILE=~/.zhistory
#以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY
#如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS     
#为历史纪录中的命令添加时间戳     
setopt EXTENDED_HISTORY     
 
#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS
 
#在命令前添加空格，不将此命令添加到纪录文件中
#setopt HIST_IGNORE_SPACE     
#}}}

##每个目录使用独立的历史纪录{{{
#cd() {
#	builtin cd "$@"                             # do actual cd
#	fc -W                                       # write current history  file
#	local HISTDIR="$HOME/.zsh_history$PWD"      # use nested folders for history
#	if  [ ! -d "$HISTDIR" ] ; then          # create folder if needed
#		mkdir -p "$HISTDIR"
#	fi
#	export HISTFILE="$HISTDIR/zhistory"     # set new history file
#	touch $HISTFILE
#	local ohistsize=$HISTSIZE
#	HISTSIZE=0                              # Discard previous dir's history
#	HISTSIZE=$ohistsize                     # Prepare for new dir's history
#	fc -R                                       #read from current histfile
#}
#mkdir -p $HOME/.zsh_history$PWD
#export HISTFILE="$HOME/.zsh_history$PWD/zhistory"
 
#function allhistory { cat $(find $HOME/.zsh_history -name zhistory) }
function allhistory { cat $HISTFILE }
function convhistory {
	sort $1 | uniq | sed 's/^:\([ 0-9]*\):[0-9]*;\(.*\)/\1::::::\2/' | awk -F"::::::" '{ $1=strftime("%Y-%m-%d %T",$1) "|"; print }' 
}
#使用 histall 命令查看全部历史纪录
function histall { convhistory =(allhistory) | sed '/^.\{20\} *cd/i\\' }
#使用 hist 查看当前目录历史纪录
function hist { convhistory $HISTFILE }
# 
#全部历史纪录 top50
function top50 { allhistory | awk -F':[ 0-9]*:[0-9]*;' '{ $1="" ; print }' | sed 's/ /\n/g' | sed '/^$/d' | sort | uniq -c | sort -nr | head -n 50 }
#}}}
 
#允许在交互模式中使用注释  例如：
#cmd #这是注释
setopt INTERACTIVE_COMMENTS     
 
#启用自动 cd，输入目录名回车进入目录
#稍微有点混乱，不如 cd 补全实用
#setopt AUTO_CD
 
#扩展路径
#/v/c/p/p => /var/cache/pacman/pkg
setopt complete_in_word
 
#禁用 core dumps
limit coredumpsize 0

#以下字符视为单词的一部分
#WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
WORDCHARS='*?_~&;!#$%^'

##for Emacs {{{
#在 Emacs终端 中使用 Zsh 的一些设置 不推荐在 Emacs 中使用它
#if [[ "$TERM" == "dumb" ]]; then
#setopt No_zle
#PROMPT='%n@%M %/
#>>'
#alias ls='ls -F'
#fi    
#}}}

function timeconv { date -d @$1 +"%Y-%m-%d %T" }
 
zmodload zsh/mathfunc
autoload -U zsh-mime-setup
zsh-mime-setup
setopt EXTENDED_GLOB


