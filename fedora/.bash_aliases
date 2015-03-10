if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias igrep='grep -i --color=auto'
fi

alias ll='ls -lFh'
alias lla='ls -lFhA'
alias la='ls -A'
alias l='ls -CF'

alias tz='cd /work/code/tz'
alias conf='cd /opt/conf/tz-data'
alias gitu="git fetch && git rebase -v"
alias gitp='git push origin HEAD:refs/for/$(git rev-parse --abbrev-ref HEAD)'
alias gita='git add -A'
alias gits='git status'
alias gito='git checkout'
alias gitm='git commit -m'
alias gitb='git branch'
alias gitl='git log --graph --pretty=format:"%Cred%h%Creset %Cgreen[%ci]%Creset %C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gith='git stash'
alias gitup='gitu && gitp'
