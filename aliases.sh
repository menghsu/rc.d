if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ "$os_name" = "linux" ]; then
    alias ls="ls -CF --color=auto"
    alias ll='ls -lFh --time-style="+%Y/%m/%d_%H:%M:%S"'
elif [ "$os_name" = "macos" ];then
    alias ls="ls -CF"
    alias ll='ls -lFh'
fi

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias igrep='grep -i --color=auto'

alias lla='ls -lFhA'
alias la='ls -A'
alias l='ls'

if type git > /dev/null 2>&1 ; then
    alias gita='git add -A'
    alias gits='git status'
    alias gitl='git log --graph --pretty=format:"%Cred%h%Creset %Cgreen[%ci]%Creset %C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset" --abbrev-commit'
    alias gitu="git fetch && git rebase -v --autostash"
    alias gitp='git push origin HEAD:refs/for/$(git rev-parse --abbrev-ref HEAD)'
    alias gitup='gitu && gitp'
fi
