使いかた
=================
vimの設定ファイルを他の環境に導入するためのリポジトリ

dotfilesを$HOMEにクローン  
````
$ cd
$ git clone https://github.com/jagio0129/dotfiles.git
$ cd dotfiles
$ git submodule init
$ git submodule update
$ ./dotfilesLink.sh
```
最初はプラグインが反映されていないが、初回でyesを選択すれば次回以降は反映される。
vim内で:NeoBundleInstallでも可。

## ログ
### 201/04/24
追加  
- [vimproc](https://github.com/Shougo/vimproc.vim)  
- [neocomplete](https://github.com/Shougo/neocomplete.vim)
- [NERDTree](http://qiita.com/zwirky/items/0209579a635b4f9c95ee)
  - C-eで開く
  - Shift-iでdotfiles表示
  - C-n,C-pでタブの移動

### 2016/04/22
カラースキーマを一通り導入。molokaiに設定
```
" molokai カラースキーム
  NeoBundle 'tomasr/molokai'
```
