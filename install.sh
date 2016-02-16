#!/bin/bash

# made by kyungjik.min
# this script need to sudo authorization.
# ver 0.4

packages=("vim" "ctags" "cscope")

function install_pkgs {
    for (( i = 0 ; i < ${#packages[@]} ; i++ )) ; do
        echo "Install ${packages[$i]} package ($((i+1))/${#packages[@]}) ..."

        result=$(dpkg -l | grep ${packages[$i]} | wc -l)
        if [ $result -eq 0 ]
        then
            sudo apt-get install -y ${packages[$i]} > /dev/null
        fi

        sleep 0.5
    done
}

install_pkgs

echo "Step#1. Install vim Vundle plugin ..."
bundle_dir=".vim/bundle"
if [ ! -d ~/$bundle_dir ] 
then
    mkdir ~/$bundle_dir
fi
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim > /dev/null
sleep 0.5

echo "Step#2. Install other vim plugins ..."
vim +PluginInstall +qall
sleep 0.5

echo "Step#3. copy vimrc ..."
cp .vimrc ~/.vimrc
sleep 0.5

echo "Step#4. copy mkcscope ..."
sudo cp mkcscope.sh /usr/bin/
sleep 0.5
