#!/bin/sh

# made by kyungjik.min
# this script need to sudo authorization.
# ver 0.3

echo "Step#1. install vim ..."
sudo apt-get install -y vim
sleep 1

echo "\nStep#2. install ctags ..."
sudo apt-get install -y ctags
sleep 1

echo "\nStep#3. install cscope ..."
sudo apt-get install -y cscope
sleep 1

echo "\nStep#4. download Vundle plugin ..."
bundle_dir=".vim/bundle"
if [ ! -d ~/$bundle_dir ] 
then mkdir ~/$bundle_dir
fi
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sleep 1

echo "\nStep#5. install plugins ..."
vim +PluginInstall +qall
sleep 1

echo "\nStep#6. copy vimrc ..."
cp .vimrc ~/.vimrc
sleep 1

echo "\nStep#7. copy mkcscope ..."
sudo cp mkcscope.sh /usr/bin/
sleep 1
