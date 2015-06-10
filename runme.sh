#!/bin/bash

selfpath=$(cd $(dirname $0); pwd)
sys_name=$1
rctarget=""

if [ "$sys_name" = "macos" ]; then
    rctarget=".bash_profile"
elif [ "$sys_name" = "fedora" ]; then
    rctarget=".bashrc"
else
    echo "fedora or macos"
    exit 1
fi

function setrclink() {
    test -e $HOME/$1 && mv $HOME/$1 $HOME/$1.backup
    ln -s $selfpath/$2 $HOME/$1
}

setrclink .inputrc $sys_name/inputrc.sh
setrclink .vimrc rc.vim
setrclink .vim vim
setrclink .gitconfig gitconfig/.gitconfig

echo -e "" >> $HOME/$rctarget
echo "source $selfpath/common_bashrc.sh" >> $HOME/$rctarget
echo "source $selfpath/$sys_name/bashrc.sh" >> $HOME/$rctarget
echo "source $selfpath/aliases.sh" >> $HOME/$rctarget
