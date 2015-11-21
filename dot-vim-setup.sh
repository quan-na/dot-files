#!/bin/bash

ln -s `pwd`/dot-vimrc ~/.vimrc

mkdir ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/colors

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

curl https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim > ~/.vim/colors/badwolf.vim

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/bling/vim-airline.git ~/.vim/bundle/vim-airline
