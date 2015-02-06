#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '


# enable color support of ls and also add handy aliases

# aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep -n --color=auto'
    alias fgrep='fgrep -n --color=auto'
    alias egrep='egrep -n --color=auto'
fi

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

alias tz='cd /work/code/tz'
alias gitu="git fetch && git rebase -v"
alias gitp='git push origin HEAD:refs/for/$(git rev-parse --abbrev-ref HEAD)'
alias gita='git add -A'
alias gits='git status'
alias gito='git checkout'
alias gitc='git commit'
alias gitb='git branch'
alias gitl='git log --graph --pretty=format:"%Cred%h%Creset %Cgreen[%ci]%Creset %C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gitt='git stash'
