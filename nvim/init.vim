if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.config/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/nvim')
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" ファイルエンコード
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin

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
elseif has('mac')
    set guifont=Ricty\ Diminished\ Discord\ Regular:h15
else
    set guifont=Ricty:h15
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

let g:did_install_default_menus = 1

let g:did_menu_trans = 1
" 相対行で表示する
set relativenumber

" -----
syntax on
if has("gui_running")
    if(has("win32") || has ("win64") || has("unix") || has("mac"))
        colorscheme molokai
        let g:molokai_original = 1
        let g:rehash256 = 1
        set background=dark
    endif
else
    colorscheme molokai
    let g:molokai_original = 1
    let g:rehash256 = 1
    set background=dark
endif


noremap // :<C-u>Migemo<CR>

inoremap <silent> <C-h> <BS>
inoremap <silent> <C-d> <Del>

nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap gj j
nnoremap gk k

nnoremap ; :
nnoremap : ;
nnoremap Q gQ
noremap sh  ^
noremap sl  $
nnoremap s/  *
noremap sm  %

" 行末までヤンクする
nnoremap Y y$

cnoremap <C-a> <Home>
" 一文字戻る
cnoremap <C-b> <Left>
" カーソルの下の文字を削除
cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
cnoremap <C-f> <Right>
" コマンドライン履歴を一つ進む
cnoremap <C-n> <Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-p> <Up>
" 前の単語へ移動
cnoremap <M-b> <S-Left>
" 次の単語へ移動
cnoremap <M-f> <S-Right>

" カーソル移動
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-d> <Del>

vnoremap ; :
vnoremap : ;

cnoremap %s/ %s/\v

augroup filetypedetect
    au! BufRead,BufNewFile *.min.js       setfiletype javascript
    au! BufRead,BufNewFile *.coffee       setfiletype javascript
    au! BufRead,BufNewFile *.scss         setfiletype css
    au! BufRead,BufNewFile *.sass         setfiletype css
    au! BufRead,BufNewFile *.less         setfiletype css
augroup END

filetype indent on
" YAMLファイル用タブストップ設定
au FileType yaml setlocal expandtab ts=2 sts=2 sw=2 fenc=utf-8
au FileType javascript setlocal expandtab ts=2 sts=2 sw=2
au FileType javascript.jsx setlocal expandtab ts=2 sts=2 sw=2

" 行頭のTAB文字を可視化
highlight TabString ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

"行頭のスペースの連続をハイライトさせる
highlight SOLSpace cterm=underline ctermbg=LightGray
au BufWinEnter * let w:m4 = matchadd("SOLSpace", '^\s+')
au WinEnter * let w:m4 = matchadd("SOLSpace", '^\s+')

" 勝手にコメントアウトされるのを防ぐ
autocmd FileType * setlocal formatoptions-=ro

" IME ON/OFF に合わせてカーソルの色を変更する
if has('multi_byte_ime')
    hi Cursor guifg=bg guibg=Yellow gui=NONE
    hi CursorIM guifg=NONE guibg=Red gui=NONE
endif

" ステータスラインに日時を表示する
function! g:Date()
    return strftime("%Y/%m/%d %H:%M ")
endfunction

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

let mapleader = "\<Space>"

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

vnoremap <silent> <C-p> "0p<CR>

" tcommentで使用する形式を追加
if !exists('g:tcomment_types')
      let g:tcomment_types = {}
  endif
let g:tcomment_types = {
      \'php_surround' : "<?php %s ?>",
      \'eruby_surround' : "<%% %s %%>",
      \'eruby_surround_minus' : "<%% %s -%%>",
      \'eruby_surround_equality' : "<%%= %s %%>",
\}

au FileType php nmap <buffer><C-_>c :TCommentAs php_surround<CR>
au FileType php vmap <buffer><C-_>c :TCommentAs php_surround<CR>
au FileType ctp nmap <buffer><C-_>c :TCommentAs php_surround<CR>
au FileType ctp vmap <buffer><C-_>c :TCommentAs php_surround<CR>

set imdisable
let g:eskk#directory = "~/.eskk"
let g:eskk#enable_completion = 1
" let g:eskk#log_cmdline_level = 4
" let g:eskk#log_file_level = 4
let g:eskk#large_dictionary = {
    \   'path': $HOME.'/.vim/skk/dict/SKK-JISYO.L',
    \   'sorted': 1,
    \   'encoding': 'euc-jp',
    \}

" 文字列中のSQLをハイライト
let php_sql_query = 1
" Baselibメソッドのハイライト
let php_baselib = 1
" 文字列中のHTMLをハイライト
let php_htmlInStrings = 1
" <? をハイライト除外にする
let php_noShortTags = 1
" カッコが閉じていない場合にハイライト
let php_parent_error_close = 1

let g:sql_type_default = 'pgsql'

" -----------------------------------------------------------------------------
"  Open junk file
" -----------------------------------------------------------------------------
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.vim_junk'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction

" -------------------------------
" SQLUtilities
" -------------------------------
let g:sqlutil_align_where = 0
let g:sqlutil_align_comma = 1
let g:sqlutil_align_first_word = 1
let g:sqlutil_align_keyword_right = 1
let g:sqlutil_keyword_case = '\U'
let g:sqlutil_col_list_terminators = 'primary,reference,unique,check,foreign'


" -------------------------------
" brightest.vim
" -------------------------------

" ハイライトするグループ名を設定します
" アンダーラインで表示する
let g:brightest#highlight = {
            \   "group" : "BrightestUnderline"
            \}
" ハイライトする単語のパターンを設定します
" デフォルト（空の文字列の場合）は <cword> が使用されます
let g:brightest#pattern = '\k\+'

" すべてのウィンドウでハイライト
let g:brightest#enable_highlight_all_window = 1

" CursorHold 時にハイライトさせる
let g:brightest#enable_on_CursorHold = 1

" -------------------------------
" undo永続化
" -------------------------------
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

let g:loaded_matchparen = 1

" -------------------------------
" jedi-vim
" -------------------------------
autocmd FileType python setlocal omnifunc=jedi#completions

" -------------------------------
" python-syntax
" -------------------------------
let python_highlight_all = 1

" -------------------------------
" php_localvarcheck
" -------------------------------
let g:php_localvarcheck_enable = 0
let g:php_localvarcheck_global = 0

" ---
" denite
" ---
" Denite用プレフィックス
noremap [denite] <Nop>
nmap <C-x> [denite]

" 最近開いたファイル
nnoremap <silent> [denite]<C-f> :<C-u>Denite file_mru -highlight-mode-insert=Search<CR>
" バッファに展開中のファイル検索
nnoremap <silent> [denite]<C-b> :<C-u>Denite buffer -highlight-mode-insert=Search<CR>
" ファイル内の関数/クラス等の検索
nnoremap <silent> [denite]<C-o> :<C-u>Denite outline -highlight-mode-insert=Search<CR>
" dotfiles配下をカレントにしてfile_rec起動
nnoremap <silent> [denite]<C-v> :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/.dotfiles']}]) -highlight-mode-insert=Search=Search<CR>
" プロジェクト検索
nnoremap <silent> [denite]<CR> :<C-u>Denite file_rec -highlight-mode-insert=Search<CR>
" プロジェクトgrep
nnoremap <silent> [denite]<C-g> :<C-u>Denite grep -highlight-mode-insert=Search<CR>

" 上下移動を<C-N>, <C-P>
call denite#custom#map('normal', '<C-N>', '<denite:move_to_next_line>')
call denite#custom#map('normal', '<C-P>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>')
" 入力履歴移動を<C-J>, <C-K>
call denite#custom#map('insert', '<C-J>', '<denite:assign_next_text>')
call denite#custom#map('insert', '<C-K>', '<denite:assign_previous_text>')
" 横割りオープンを`<C-S>`
call denite#custom#map('insert', '<C-S>', '<denite:do_action:split>')
" 縦割りオープンを`<C-I>`
call denite#custom#map('insert', '<C-I>', '<denite:do_action:vsplit>')
" タブオープンを`<C-T>`
call denite#custom#map('insert', '<C-T>', '<denite:do_action:tabopen>')

" file_rec検索時にfuzzymatchを有効にし、検索対象から指定のファイルを除外
call denite#custom#source(
    \ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_project_files', 'matcher_ignore_globs'])

" 検索対象外のファイル指定
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

noremap [fugitive] <Nop>
nmap <Leader>g [fugitive]
nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]d :<C-u>Gdiff<CR>
nnoremap <silent> [fugitive]b :<C-u>Gblame<CR>
nnoremap <silent> [fugitive]l :<C-u>Glog<CR>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1

" vimshell setting
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "
" vimshell map
nnoremap <silent> vss :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vsp :VimShellPop<CR>

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

if filereadable(expand($HOME."/.vimrc.local"))
    source ~/.vimrc.local
endif

filetype plugin on
