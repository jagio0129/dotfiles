#! /bin/bash

### link
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
cat .gitconfig >> ~/.gitconfig

### bashrc
BASHRC=~/.bashrc

echo '##### my bash config #####'
cat '##### my bash config #####' >> $BASHRC

echo 'alias ll="ls -la"'
echo 'alias ll="ls -la"' >> $BASHRC

echo 'alias be="bundle exec"'
echo 'alias be="bundle exec"' >> $BASHRC

echo 'alias dc="docker-compse"'
echo 'alias dc="docker-compse"' >> $BASHRC

# show git branch in prompt
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh >> ~/.git-prompt.sh
source ~/.git-prompt.sh

# プロンプトに色付け
echo "export PS1='\[\e[0;35m\][\u@\h \W]\[\e[0;36m\]$(__git_ps1 " (%s)")\n\[\e[0;35m\]\$ \[\e[0;0m\]'"
echo "export PS1='\[\e[0;35m\][\u@\h \W]\[\e[0;36m\]$(__git_ps1 " (%s)")\n\[\e[0;35m\]\$ \[\e[0;0m\]'" >> $BASHRC

# clone ruby_style_guide
RUBY_STYLE_GUILDE=~/ruby_style_guide
if [ ! -d $RUBY_STYLE_GUILDE ]; then
  mkdir $RUBY_STYLE_GUILDE
  git clone git@github.com:jagio0129/ruby_style_guide.git $RUBY_STYLE_GUILDE ;
fi
echo 'export RUBY_STYLE_GUILDE=~/ruby_style_guide'
echo 'export RUBY_STYLE_GUILDE=~/ruby_style_guide' >> $BASHRC

# rspec bulk start
echo 'alias bulk_rspec="bundle exec ruby ~/dotfiles/bulk_rspec.rb"' >> $BASHRC

# for mac
if [ "$(uname)" == 'Darwin' ]; then
  touch ~/.bash_profile
  cat <<-EOF >> ~/.bash_profile
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
EOF

  # terminal-notifier
  TERMINAL_NOTIFIER=`brew list | grep terminal-notifier`
  if [ ! $TERMINAL_NOTIFIER == 'terminal-notifier' ]; then
    brew install terminal-notifier;
	echo "installed terminal-notifier"
  fi
  echo "alias noti='terminal-notifier -message 'コマンド完了''"
  echo "alias noti='terminal-notifier -message 'コマンド完了''" >> $BASHRC

  # tmux
  TMUX=`brew list | grep tmux`
  if [ ! $TERMINAL_NOTIFIER == 'tmux' ]; then
    brew install tmux
	echo "installed tmux";
  fi
fi

# tmux auto start when login
cat <<-'EOS' >> ~/.bashrc

SESSION_NAME=ope
if [[ -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
  option=""
  if tmux has-session -t ${SESSION_NAME}; then
    option="attach -t ${SESSION_NAME}"
  else
    option="new -s ${SESSION_NAME}"
  fi
  tmux -2 $option -d
fi
EOS
