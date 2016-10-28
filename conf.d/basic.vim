" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" 行番号を表示
set number
" バックアップファイルを作成しない
set nobackup
" 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set showmatch
set matchtime=1
" Vi互換モードをオフ
set nocompatible
" コマンドライン補完を便利に
set wildmenu wildmode=list:longest,full
"コマンド、検索パターンを1000まで保存
set history=1000
" タイプ途中のコマンドを画面最下行に表示
set showcmd
" インクリメンタルサーチを有効
set incsearch
" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch
" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が混在しているときは区別する
set ignorecase
"大文字で検索されたら対象を大文字限定にする
set smartcase
"行末まで検索したら行頭に戻る
set wrapscan
" オートインデント、改行、インサートモード開始直後にバックスペースキーで 削除できるようにする
set backspace=indent,eol,start
" 画面最下行にルーラーを表示する
set ruler
"ステータスラインを常に表示する
set laststatus=2
" 全モードでマウスを有効化
set mouse=a
" コマンドラインの高さを二行に
set cmdheight=2
" スワップファイルを作らない
set noswapfile
" 10行余裕を持たせてスクロールする
set scrolloff=10
" Insertモードで <Tab> を挿入するのに、適切な数の空白を使う
set expandtab
" <Tab> が対応する空白の数。
set tabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数。
set softtabstop=4
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set showtabline=4
" フォント設定
if has('win32')
    set guifont=Ricty:h13.5
    set guifontwide=Ricty:h13.5
elseif has('mac')
    set guifont=Myrica\ M:h10
    set guifontwide=Myrica\ M:h10
else
    set guifont=Ricty\ 10.5
    set guifontwide=Ricty\ 10.5
endif
set iminsert=0
set imsearch=0
" タブをCUIにする
set guioptions-=e
" ツールバーを非表示
set guioptions-=T
" メニューバーを非表示
set guioptions-=m
" 右スクロールバー非表示
set guioptions-=r
" 右スクロールバー非表示(画面分割時)
set guioptions-=R
" 左スクロールバー非表示
set guioptions-=l
" 左スクロールバー非表示(画面分割時)
set guioptions-=L
" コンソールダイアログを使用する
set guioptions=c
" タブ文字、行末など不可視文字を表示する
set list
" listで表示される文字のフォーマットを指定する
set listchars=tab:>-,trail:_
" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
" Windows でもパスの区切り文字を / にする
set shellslash
" ビープ音 ビジュアルベルを使用しない
set visualbell t_vb=
" エラーメッセージの表示時にビープ音を鳴らさない
set noerrorbells
" ファイルブラウザの初期ディレクトリ
set browsedir=buffer
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 256色で利用
set t_Co=256
" 一部の文字を全角として扱う
set ambiwidth=double
" 他でファイルが編集された時に自動で読み込む
set autoread
" 現在モードを表示する
set showmode
" バッファ切り替え
set hidden
" タイトルを表示
set title
" 一行を表示する
set display=lastline
" 補完メニューの高さ
set pumheight=10
" ステータスライン表示
set statusline=%{g:Date()}\%<%f%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=[0x%B]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%{tagbar#currenttag('[%s]','')}[%l/%L][%c%V]%3p%%
" インデントを丸める
set shiftround
"
set synmaxcol=300

let g:did_install_default_menus = 1

let g:did_menu_trans = 1
" 相対行で表示する
set relativenumber
" 画面をスクロールする行数の最大値
set ttyscroll=3
" 高速ターミナル接続を行う
set ttyfast
