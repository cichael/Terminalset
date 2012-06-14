* pathogen
https://github.com/tpope/vim-pathogen/tags

* unite
https://github.com/Shougo/unite.vim/tags

* neocomplcache
https://github.com/Shougo/neocomplcache/tags

* vimproc
https://github.com/Shougo/vimproc/tags
neocomplcacheはキャッシュの作成にvimprocを使用しています。
vimprocをインストールするとキャッシュの作成を非同期で行うようになり、
キャッシュ作成時の待ち時間がロになるようです。


* 参考URL
http://www.karakaram.com/vim/neocomplcache/





* [20110815] シンボリックリンクをはる
http://d.hatena.ne.jp/mkataigi/20101107/1289134775

ln -s .vim/bundle/vim-pathogen/autoload/pathogen.vim .vim/autoload/

