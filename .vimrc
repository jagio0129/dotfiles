if filereadable(expand('$HOME/dotfiles/.vimrc.neobundle')) " ファイルが読み込み可能かチェック
  source $HOME/dotfiles/.vimrc.neobundle " .vimrcファイル読み込み

  if filereadable(expand('$HOME/dotfiles/.vimrc.plugin'))
    source $HOME/dotfiles/.vimrc.plugin
  endif
endif

if filereadable(expand('$HOME/dotfiles/.vimrc.basic'))
  source $HOME/dotfiles/.vimrc.basic
endif
