#!/bin/bash

selfpath=$(cd $(dirname $0); pwd)
os_name=$1
rctarget=""

if [ "$os_name" = "macos" ]; then
    rctarget=".bash_profile"
elif [ "$os_name" = "linux" ]; then
    rctarget=".bashrc"
else
    echo "linux or macos"
    exit 1
fi

function setrclink() {
    test -e $HOME/$1 && mv $HOME/$1 $HOME/$1.backup
    ln -s $selfpath/$2 $HOME/$1
}

setrclink .inputrc $os_name/inputrc.sh
setrclink .vimrc rc.vim
setrclink .vim vim
setrclink .gitconfig git/.gitconfig

echo -e "" > $HOME/$rctarget
echo "export os_name=$os_name" >> $HOME/$rctarget
echo "source $selfpath/common_bashrc.sh" >> $HOME/$rctarget
echo "source $selfpath/$os_name/bashrc.sh" >> $HOME/$rctarget
echo "source $selfpath/aliases.sh" >> $HOME/$rctarget
echo "source $selfpath/git/git-completion.bash" >> $HOME/$rctarget
