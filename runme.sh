#!/bin/bash

selfpath=$(cd $(dirname $0); pwd)
sys_name=$1

if [ "$sys_name" != "fedora" -a "$sys_name" != "macos" -a "$sys_name" != "opensuse" ]; then
    exit
fi

ln -s $selfpath/$sys_name/.inputrc $HOME/.inputrc
ln -s $selfpath/$sys_name/.vimrc $HOME/.vimrc
ln -s $selfpath/vim $HOME/.vim

echo -e "\n" >> $HOME/.bash_profile
echo "source $selfpath/$sys_name/.bashrc" >> $HOME/.bash_profile
