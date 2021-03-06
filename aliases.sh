if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ "$os_name" = "linux" ]; then
    time_style="+%Y|%m|%d_%H:%M:%S"
    alias ls="ls -CF --color=auto"
    alias ll='ls -lFh --time-style=$time_style'
    alias lla='ls -lFhA --time-style=$time_style'
elif [ "$os_name" = "macos" ];then
    alias ls="ls -CF"
    alias ll='ls -lFh'
    alias lla='ls -lFhA'
fi

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep -in --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias la='ls -A'
alias l='ls'

alias rmf='rm -rf'

# git aliases
if type git > /dev/null 2>&1 ; then
    alias gita='git add -A'
    alias gitm='git commit -m'
    alias gits='git status'
    alias gitd='git diff'
    alias gitu="git fetch && git rebase -v --autostash @{upstream}"
    #alias gitu="git pull -r -v"
    alias gitpr='git push origin HEAD:refs/for/$(git rev-parse --abbrev-ref HEAD)'
    alias gitp='git push origin $(git rev-parse --abbrev-ref HEAD)'
    alias gitup='gitu && gitp'
    alias gitam='git add -A && git commit -m'
    alias gitlog='git log --graph --pretty=format:"%Cred%h%Creset %Cgreen[%ci]%Creset %C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset" --abbrev-commit'
    alias gittag='git --no-pager log --tags --decorate --simplify-by-decoration --oneline'
fi
