#! /bin/bash

### link
mv ~/.bashrc ~/.bashrc.ba
cp ./bashrc ~/.bashrc
mv ~/.bash_aliases ~/.bash_aliases.ba
cp ./bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
cat .gitconfig >> ~/.gitconfig

### bashrc
BASHRC=~/.bashrc

cat '##### my bash config #####' >> $BASHRC

# for mac
if [ "$(uname)" == 'Darwin' ]; then

  # load .bashrc
  touch ~/.bash_profile
  cat <<-EOF >> ~/.bash_profile
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
EOF

  # install terminal-notifier
  TERMINAL_NOTIFIER=`brew list | grep terminal-notifier`
  if [ ! $TERMINAL_NOTIFIER == 'terminal-notifier' ]; then
    brew install terminal-notifier;
	echo "installed terminal-notifier"
  fi
  echo "alias noti='terminal-notifier -message 'コマンド完了''"
  echo "alias noti='terminal-notifier -message 'コマンド完了''" >> $BASHRC

  # install tmux
  TMUX=`brew list | grep tmux`
  if [ ! $TERMINAL_NOTIFIER == 'tmux' ]; then
    brew install tmux
	echo "installed tmux";
  fi
fi
