#!/bin/sh

# made by kyungjik.min
# this script need to sudo authorization.
# ver 0.3

echo "Step#1. install vim ..."
result=$(dpkg -l | grep vim | wc -l)
if [ $result -eq 0 ]
then
    sudo apt-get install -y vim > /dev/null
fi
sleep 0.5

echo "\nStep#2. install ctags ..."
result=$(dpkg -l | grep ctags | wc -l)
if [ $result -eq 0 ]
then
    sudo apt-get install -y ctags > /dev/null
fi
sleep 0.5

echo "\nStep#3. install cscope ..."
result=$(dpkg -l | grep cscope | wc -l)
if [ $result -eq 0 ]
then
    sudo apt-get install -y cscope > /dev/null
fi
sleep 0.5

echo "\nStep#4. download Vundle plugin ..."
bundle_dir=".vim/bundle"
if [ ! -d ~/$bundle_dir ] 
then
    mkdir ~/$bundle_dir
fi
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sleep 0.5

echo "\nStep#5. install plugins ..."
vim +PluginInstall +qall
sleep 0.5

echo "\nStep#6. copy vimrc ..."
cp .vimrc ~/.vimrc
sleep 0.5

echo "\nStep#7. copy mkcscope ..."
sudo cp mkcscope.sh /usr/bin/
sleep 0.5
