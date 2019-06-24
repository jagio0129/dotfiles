#! /bin/bash

### link
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
cat .gitconfig >> ~/.gitconfig

### bashrc
BASHRC=~/.bashrc
echo 'alias be="bundle exec"'
echo 'alias be="bundle exec"' >> $BASHRC

echo 'alias dc="docker-compse"'
echo 'alias dc="docker-compse"' >> $BASHRC

# プロンプトに色付け
echo "export PS1='\[\e[0;35m\][\h@\w]\$\[\e[0;0m\]'"
echo "export PS1='\[\e[0;35m\][\h@\w]\$\[\e[0;0m\]'" >> $BASHRC

# clone ruby_style_guide
RUBY_STYLE_GUILDE=~/ruby_style_guide
if [ ! -d $RUBY_STYLE_GUILDE ]; then
  mkdir $RUBY_STYLE_GUILDE
  git clone git@github.com:jagio0129/ruby_style_guide.git $RUBY_STYLE_GUILDE ;
fi
echo 'export RUBY_STYLE_GUILDE=~/ruby_style_guide'
echo 'export RUBY_STYLE_GUILDE=~/ruby_style_guide' >> $BASHRC

# for mac
if [ "$(uname)" == 'Darwin' ]; then
  TERMINAL_NOTIFIER=`brew list | grep terminal-notifier`
  if [ ! $TERMINAL_NOTIFIER == 'terminal-notifier' ]; then
    brew install terminal-notifier
  fi
  echo "alias noti='terminal-notifier -message 'コマンド完了''"
  echo "alias noti='terminal-notifier -message 'コマンド完了''" >> $BASHRC
fi

# tmux auto start when login
cat <<-EOF >> ~/.bashrc

SESSION_NAME=ope
if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
  option=""
  if tmux has-session -t ${SESSION_NAME}; then
    option="attach -t ${SESSION_NAME}"
  else
    option="new -s ${SESSION_NAME}"
  fi
  tmux $option && exit
fi
EOF
