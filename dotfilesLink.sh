#! /bin/bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
cat .gitconfig >> ../.gitconfig
echo 'alias be="bundle exec"' >> ~/.bashrc
echo "export PS1='\[\e[0;35m\][\h@\w]\$\[\e[0;0m\]'" >> ~/.bashrc
echo "alias noti='terminal-notifier -message 'コマンド完了''" >> ~/.bashrc
