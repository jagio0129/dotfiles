使いかた
=================
vim,gitconfigの設定ファイルを他の環境に導入するためのリポジトリ

dotfilesを$HOMEにクローン  
````
cd
git clone https://github.com/jagio0129/dotfiles.git
cd dotfiles
git submodule init
git submodule update
./dotfilesLink.sh
```
最初はプラグインが反映されていないが、初回でyesを選択すれば次回以降は反映される。
vim内で:NeoBundleInstallでも可。

