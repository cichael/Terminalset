" 文字コードの設定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,iso-2022-jp,euc-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8,euc-jp

" 検索文字をハイライト
set hlsearch

" 大文字小文字無視
set ignorecase

" 大文字ではじめたら大文字小文字無視しない
set smartcase

" 常にステータスラインを表示
set laststatus=2
set statusline=%<%F\ %r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).'\|'.&ff.']'}\ \ %l/%L\ (%P)%m%=%{strftime(\"%Y/%m/%d\ %H:%M\")}

" ファイル内の <Tab> が対応する空白の数
set tabstop=4

" 自動インデントの各段階に使われる空白の数
set shiftwidth=2

" Insertモードで: <Tab> を挿入するのに、適切な数の空白を使う（タブをスペースに展開する）
set expandtab

" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

" Vi互換をオフ Vimの便利な機能が使えなくなるため
set nocompatible

" 強調表示(色付け)のON/OFF設定
syntax on

" <Tab>、行末の半角スペースを明示的に表示
set list
set listchars=tab:>-,trail:-

" 行数表示
set nu

" バッファを切替えてもundoの効力を失わない
set hidden

" コマンドライン補完を拡張モードにする
set wildmenu
set wildmode=list:longest,full

" 行にラインを表示
set cursorline

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" クリップボード同期
set clipboard=unnamed,autoselect

" バックアップファイルの保存場所指定
set backupdir=~/.vim/vimbackup

" スワップファイルを作らない
set directory=~/.vim/vimbackup

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" 色テーマ指定
colorscheme wombat256mod


" http://tech.thekyo.jp/現在のvimrc-vimrc/165/
" 全角スペース表示
function! ZenkakuSpace()
"ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
"全角スペースを明示的に表示する。
silent! match ZenkakuSpace /　/
endfunction

if has('syntax')
augroup ZenkakuSpace
autocmd!
autocmd VimEnter,BufEnter * call ZenkakuSpace()
augroup END
endif


" http://www.e2esound.com/wp/2010/11/07/add_vimrc_settings/
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap “” “”<Left>
imap ” ”<Left>
imap <> <><Left>
imap “ “<Left>


" http://d.hatena.ne.jp/yuroyoro/20101104/1288879591
" Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>
" Ctrl-iでヘルプ
nnoremap <C-i>  :<C-u>help<Space>
" CTRL-hjklでウィンドウ移動
nnoremap <C-j> ;<C-w>j
nnoremap <C-k> ;<C-k>j
nnoremap <C-l> ;<C-l>j
nnoremap <C-h> ;<C-h>j

" neocomplcache
" https://github.com/Shougo/neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
" tabで補完選択
function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
