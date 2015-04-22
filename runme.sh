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

test -f $HOME/.inputrc && mv $HOME/.inputrc $HOME/.inputrc.backup
ln -s $selfpath/$sys_name/inputrc.sh $HOME/.inputrc

test -f $HOME/.vimrc && mv $HOME/.vimrc $HOME/.vimrc.backup
ln -s $selfpath/rc.vim $HOME/.vimrc

test -d $HOME/.vim && mv $HOME/.vim $HOME/.vim.backup
ln -s $selfpath/vim $HOME/.vim

echo -e "" >> $HOME/$rctarget
echo "source $selfpath/common_bashrc.sh" >> $HOME/$rctarget
echo "source $selfpath/$sys_name/bashrc.sh" >> $HOME/$rctarget
echo "source $selfpath/aliases.sh" >> $HOME/$rctarget
