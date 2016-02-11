#!/bin/sh

# made by kyungjik.min
# ver 0.1

echo "Step#1. install vim ..."
sudo apt-get install -y vim
sleep 1

echo "Step#2. install ctags ..."
sudo apt-get install -y ctags
sleep 1

echo "Step#3. download Vundle plugin ..."
bundle_dir=".vim/bundle"
if [ ! -d ~/$bundle_dir ] 
then mkdir ~/$bundle_dir
fi
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sleep 1

echo "Step#4. install plugins ..."
vim +PluginInstall +qall
sleep 1

echo "Step#5. copy vimrc ..."
mv .vimrc ~/.vimrc
sleep 1
