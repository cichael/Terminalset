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
(vimshellにも必須らしい)

-- makeが必要
cd .vim/bundle/Shougo-vimproc-de945c8
make -f make_mac.mak
gcc -O2 -W -Wall -Wno-unused -bundle -fPIC -arch i386 -arch x86_64 -o autoload/proc.so autoload/proc.c -lutil




* 参考URL
http://www.karakaram.com/vim/neocomplcache/





* [20110815] シンボリックリンクをはる
http://d.hatena.ne.jp/mkataigi/20101107/1289134775

ln -s .vim/bundle/vim-pathogen/autoload/pathogen.vim .vim/autoload/

