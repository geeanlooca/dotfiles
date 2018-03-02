#!/bin/bash

#
# Vim configuration and plugins
#

echo "Installing VIM configuration files"
echo "Removing current configuration"

rm ~/.vimrc
rm -rf ~/.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim

echo "Installing compton configuration"
mkdir -p ~/.config/compton
rm ~/.config/compton/*
ln -s ~/dotfiles/compton.conf ~/.config/compton/compton.conf

echo "Installing i3 configuration"
mkdir -p ~/.config/i3/
rm ~/.config/i3/*
ln -s ~/dotfiles/i3config ~/.config/i3/config


echo "Downloading and installing Lock script"
mkdir -p ~/bin/lock-repo
git clone https://github.com/guimeira/i3lock-fancy-multimonitor ~/bin/lock-repo
chmod +x ~/bin/lock-repo/lock
ln -s ~/bin/lock-repo/lock ~/bin/lock
