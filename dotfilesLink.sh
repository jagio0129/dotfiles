#! /bin/bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
cat .gitconfig >> ~/.gitconfig

echo 'alias be="bundle exec"' >> ~/.bashrc
echo 'alias dc="docker-compse"' >> ~/.bashrc
echo "export PS1='\[\e[0;35m\][\h@\w]\$\[\e[0;0m\]'" >> ~/.bashrc

# clone ruby_style_guide
if [ ! -d ~/ruby_style_guide ]; then
  git clone git@github.com:jagio0129/ruby_style_guide.git ~ ;
  echo 'export $RUBY_STYLE_GUILDE=~/ruby_style_guide'
fi

# for mac
if [ "$(uname)" == 'Darwin' ]; then
  brew install terminal-notifier &&
  echo "alias noti='terminal-notifier -message 'コマンド完了''" >> ~/.bashrc
fi

# tmux auto start when login
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