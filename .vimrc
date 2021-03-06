" 文字コードの設定
set encoding=utf-8
set termencoding=utf-8
"set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp932,iso-2022-jp,sjis,euc-jp
"set fileencodings=utf-8,sjis,euc-jp,ucs-bom,cp932,iso-2022-jp

"set encoding=utf-8
"set termencoding=utf-8
"set fileencoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp932,iso-2022-jp,euc-jp
"set fileencodings+=,ucs-2le,ucs-2,utf-8,euc-jp

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
"syntax on
syntax enable

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

" スワップファイルを作らない set noswapfile
set directory=~/.vim/tmp

" 保存時に行末の空白を除去する
"autocmd BufWritePre * :%s/\s\+$//ge

" 色テーマ指定
"colorscheme jellybeans
set background=light
colorscheme solarized

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

" filetype=.twig
autocmd BufNewFile,BufRead *.twig set filetype=html

" filetype=.txt
autocmd BufNewFile,BufRead *.txt set filetype=qfix_memo


" pathogen
" https://github.com/tpope/vim-pathogen.git
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
call pathogen#infect()
call pathogen#helptags()
"syntax on
filetype plugin indent on

" unite.vim
" http://d.hatena.ne.jp/ruedap/20110117/vim_unite_plugin_1_week
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-b> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer file_mru<CR>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ヒストリ
let g:unite_source_history_yank_enable =1  "history/yankの有効化
nnoremap <silent> ,uh :<C-u>Unite history/yank<CR>

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction


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

" vim-pastefire
" https://github.com/delphinus35/vim-pastefire
"let g:pastefire_email='yume76@gmail.com'
"let g:pastefire_password='yume7612'
"map ,P <Plug>(pastefire)


" qfixapp howm
" https://sites.google.com/site/fudist/Home/qfixhowm
" qfixappにruntimepathを通す
set runtimepath+=~/.vim/bundle/qfixapp
" キーマップリーダー
let QFixHowm_Key = 'g'
" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '~/memo/howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
" QFixHowmのファイルタイプ
let QFixHowm_FileType = 'qfix_memo'
" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeoutlen=3500

" Vimで開くファイルの正規表現指定
let QFixHowm_OpenVimExtReg = '\.\(txt\|mkd\|wiki\|rd\|vim\|js\|java\|py\|rb\|h\|c\|cpp\|ini\|conf\|html\|php)$'

" QuickFixウィンドウコマンド
let QFixHowm_OpenURIcmd = 'netrw'

" menuのプレビューをoff
let QFixHowm_MenuPreviewEnable = 0

" gundo.vim
"nnoremap <silent> ,ud :<C-u> :GundoToggle<CR>
"nmap U :<C-u>GundoToggle<CR> "Shift + U

" rキーでdiffを表示
""let g:gundo_auto_preview = 0


" Vim-php-cs-fixer
" https://github.com/stephpy/vim-php-cs-fixer
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
let g:php_cs_fixer_fixers_list = ""             " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                  " Return the output of command if 1, else an inline information.

nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
