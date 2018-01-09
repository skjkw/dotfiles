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

let g:sql_type_default = 'mysql'

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

"
nnoremap <silent> [denite]<C-a> :<C-u>DeniteBufferDir file_rec -highlight-mode-insert=Search<CR>
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
" レジストリ表示
nnoremap <silent> [denite]<C-r> :<C-u>Denite register -highlight-mode-insert=Search<CR>
" バッファ表示
nnoremap <silent> [denite]<C-b> :<C-u>Denite buffer -highlight-mode-insert=Search<CR>
" ディレクトリ表示
nnoremap <silent> [denite]<C-d> :<C-u>Denite directory_rec -highlight-mode-insert=Search<CR>
" 行
nnoremap <silent> [denite]<C-l> :<C-u>Denite line -highlight-mode-insert=Search<CR>
" ヤンク履歴
nnoremap <silent> [denite]<C-y> :<C-u>Denite neoyank -highlight-mode-insert=Search<CR>

" Gnu global
nnoremap <silent> <C-c>c :DeniteCursorWord gtags_context -buffer-name=gtags_context<CR>
nnoremap <silent> <C-c>r :DeniteCursorWord gtags_ref -buffer-name=gtags_ref<CR>
nnoremap <silent> <C-c>d :DeniteCursorWord gtags_def -buffer-name=gtags_def<CR>
nnoremap <silent> <C-c>g :DeniteCursorWord gtags_grep -buffer-name=gtags_grep<CR>
nnoremap <silent> <C-c>t :Denite -buffer-name=gtags_completion gtags_completion<CR>
nnoremap <silent> <C-c>f :Denite -buffer-name=gtags_file gtags_file<CR>
nnoremap <silent> <C-c>p :Denite -buffer-name=gtags_path gtags_path<CR>

call denite#custom#map('normal', '<C-G>', '<denite:quit>')
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
nnoremap <silent> [fugitive]l :<C-u>Gllog<CR>

" let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_enable_auto_cd = 1

" vimshell setting
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "
" vimshell map
nnoremap <silent> vss :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vsp :VimShellPop<CR>

let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

" エラー行に表示するマーク
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" エラー表示の列を常時表示
let g:ale_sign_column_always = 1

" ファイルを開いたときにlint実行
let g:ale_lint_on_enter = 1
" ファイルを保存したときにlint実行
let g:ale_lint_on_save = 1
" 編集中のlintはしない
let g:ale_lint_on_text_changed = 'never'

" lint結果をロケーションリストとQuickFixには表示しない
" 出てると結構うざいしQuickFixを書き換えられるのは困る
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" 有効にするlinter
let g:ale_linters = {
\   'php': ['php -l'],
\}

" ALE用プレフィックス
nmap [ale] <Nop>
map <C-k> [ale]
" エラー行にジャンプ
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
inoremap <expr><tab> pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['phpcd', 'omni']

let g:phpcd_autoload_path = '/Users/kajikawa/clipho/mocom/www/init/init.php'
let g:phpcd_php_cli_executable = 'php7.0'

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-g> deoplete#undo_comcletion()
inoremap <expr><C-y>  deoplete#close_popup()

" <C-l>: redraw candidates
inoremap <expr><C-l> deoplete#refresh()

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#cancel_popup() . "\<CR>"
endfunction

inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"

inoremap <expr> '  pumvisible() ? deoplete#close_popup() : "'"

" call deoplete#custom#set('ghc', 'sorters', ['sorter_word'])

" " Use auto delimiter
" call deoplete#custom#set('_', 'converters', [
"       \ 'converter_remove_paren',
"       \ 'converter_remove_overlap',
"       \ 'converter_truncate_abbr',
"       \ 'converter_truncate_menu',
"       \ 'converter_auto_delimiter',
"       \ ])

" " Prams of deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 0
" let g:deoplete#keyword_patterns = {}
" let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
" let g:deoplete#keyword_patterns.tex = '[^\w|\s][a-zA-Z_]\w*'
" let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.python = ''
" let g:deoplete#omni#functions = {}
" let g:deoplete#enable_camel_case = 1
" let g:deoplete#skip_chars = ['(', ')']

" " Hidden autocomplete preview
" set completeopt-=preview
"
let g:neoyank#limit = 1000
let g:neoyank#file = $HOME.'/.vim/yankring.txt'

nnoremap <silent> <Leader><Leader> :NERDTreeTabsToggle<CR>
let g:NERDTreeIgnore=['\.DS_Store$', '\.swp$', '\~$', '\.so']
let g:NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1
autocmd vimenter * NERDTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('inc',    'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('tpl',    'Magenta', 'none', '#ff00ff', '#151515')

" yankround.vim {{{
" キーマップ
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" 履歴取得数
xmap ,d <Plug>(textmanip-duplicate-down)
let g:yankround_max_history = 100
"履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
" }}}

let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray   ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgray ctermbg=247

let g:EasyMotion_do_mapping = 0
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
vmap s <Plug>(easymotion-bd-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

nnoremap <silent> <C-a><C-t> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_updateonsave_maxlines = 10000
let g:tagbar_sort = 0

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

nnoremap <Leader>zp :<C-u>CtrlPMenu<CR>
nnoremap <Leader>zb :<C-u>CtrlPBuffer<CR>
nnoremap <Leader>zd :<C-u>CtrlPDir<CR>
nnoremap <Leader>zf :<C-u>CtrlP<CR>
nnoremap <Leader>zl :<C-u>CtrlPLine<CR>
nnoremap <Leader>zm :<C-u>CtrlPMRUFiles<CR>
nnoremap <Leader>zq :<C-u>CtrlPQuickfix<CR>
nnoremap <Leader>zs :<C-u>CtrlPMixed<CR>
nnoremap <Leader>zt :<C-u>CtrlPTag<CR>
nnoremap <Leader>zw :<C-u>CtrlPFunky<CR>
nnoremap <Leader>zu :<C-u>CtrlPFiler<CR>

let g:ctrlp_map = '<Nop>'
" let g:ctrlp_cmd = 'CtrlPMenu'
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
" Guess vcs root dir
let g:ctrlp_working_path_mode = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed', 'filer', 'funky']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'

" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

nnoremap <silent> <Leader>vf :VimFiler<CR>

let g:loaded_gentags#ctags = 1
let g:loaded_gentags#gtags = 1
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1

nnoremap <silent> <Leader>gv :Agit<CR>
autocmd FileType git :setlocal foldlevel=99

map /  <Plug>(incsearch-forward)\v
map ?  <Plug>(incsearch-backward)\v
map g/ <Plug>(incsearch-stay)\v

map m/ <Plug>(incsearch-migemo-/)
map m? <Plug>(incsearch-migemo-?)
map mg/ <Plug>(incsearch-migemo-stay)

nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *  <Plug>(incsearch-nohl-*)zz
map #  <Plug>(incsearch-nohl-#)zz
map g* <Plug>(incsearch-nohl-g*)zz
map g# <Plug>(incsearch-nohl-g#)zz

function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

nnoremap tig :<C-u>w<CR>:te tig<CR>
tnoremap <silent> <ESC> <C-\><C-n>

let g:neoterm_repl_php = 'php'

if filereadable(expand($HOME."/.vimrc.local"))
    source ~/.vimrc.local
endif

filetype plugin on
