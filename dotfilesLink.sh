#! /bin/bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
cat .gitconfig >> ../.gitconfig
echo 'alias be=bundle exec' >> ~/.bashrc
