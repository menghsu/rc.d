#!/bin/bash

selfpath=$(cd $(dirname $0); pwd)
sys_name=$1

ln -s $selfpath/$sys_name/.inputrc $HOME/.inputrc
ln -s $selfpath/$sys_name/.vimrc $HOME/.vimrc
ln -s $selfpath/vim $HOME/.vim

echo -e "\n" >> $HOME/.bashrc
echo "source $selfpath/$sys_name/.bashrc"
