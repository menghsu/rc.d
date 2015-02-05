#加载命令别名
#if [ -f $HOME/.bash_aliases ]; then
#	. $HOME/.bash_aliases
#fi

#路径别名 {{{
#进入相应的路径时只要 cd ~xxx
#hash -d A="/media/ayu/dearest"
#hash -d H="/media/data/backup/ayu"
#hash -d E="/etc/"
#hash -d D="/home/ayumi/Documents"
#}}}

#[Esc][h] man 当前命令时，显示简短说明
alias run-help >&/dev/null && unalias run-help
autoload run-help
 
#历史命令 top10
alias top10='print -l  ${(o)history%% *} | uniq -c | sort -nr | head -n 10'
#}}}

