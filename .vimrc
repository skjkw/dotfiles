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

  let s:toml_dir = expand('~/.config/')
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

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" ファイルエンコード
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin

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
    " set guifontwide=Ricty:h13.5
elseif has('mac')
    set guifont=Ricty\ Diminished\ Discord\ Regular:h15
    " set guifontwide=Ricty\ Diminished\ Discord\ Regular:h15
else
    set guifont=Ricty:h15
    " set guifontwide=Ricty:h15
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
" set synmaxcol=300

let g:did_install_default_menus = 1

let g:did_menu_trans = 1
" 相対行で表示する
set relativenumber
" 画面をスクロールする行数の最大値
set ttyscroll=3
" 高速ターミナル接続を行う
set ttyfast

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

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
nnoremap <silent> <Leader><Leader> :NERDTreeToggle<CR>

" noremap // :<C-u>Migemo<CR>

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

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
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

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
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

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
let mapleader = "\<Space>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory=[]
let g:neosnippet#snippets_directory+=['~/.vim/bundle/vim-snippets/snippets']

"==========================================
"neocomplete.vim
"==========================================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplete#enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#min_syntax_length = 3

let g:neocomplete#lock_buffer_name_pattern = '¥*ku¥*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'php' : $HOME.'/.vim/dict/php.dict',
    \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
    \ 'java' : $HOME.'/.vim/dict/java.dict',
    \ 'scala' : $HOME.'/.vim/dict/scala.dict'
    \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '¥h¥w*'
" Plugin key-mappings.
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><C-l>  neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" buffer開いたらneoconでcache
autocmd BufReadPost,BufEnter,BufWritePost :neocompleteCachingBuffer <buffer>

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
"prefix keyの設定
" vinarise
let g:vinarise_enable_auto_detect = 1

let g:unite_source_file_rec_max_cache_files=5000

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

function! DispatchUniteFileRecAsyncOrGit()
  if isdirectory(getcwd()."/.git")
    Unite file_rec/git
  else
    Unite file_rec/async
  endif
endfunction

nmap <C-x> [unite]

"スペースキーとaキーでカレントディレクトリを表示
nnoremap <silent> [unite]<C-a> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"スペースキーとfキーでバッファと最近開いたファイル一覧を表示
nnoremap <silent> [unite]<C-f> :<C-u>Unite<Space>buffer file_mru<CR>
"スペースキーとdキーで最近開いたディレクトリを表示
nnoremap <silent> [unite]<C-d> :<C-u>Unite<Space>directory_mru<CR>
"スペースキーとbキーでバッファを表示
nnoremap <silent> [unite]<C-b> :<C-u>Unite<Space>buffer<CR>
"スペースキーとrキーでレジストリを表示
nnoremap <silent> [unite]<C-r> :<C-u>Unite<Space>register<CR>
"スペースキーとtキーでタブを表示
nnoremap <silent> [unite]<C-t> :<C-u>Unite<Space>tab<CR>
"スペースキーとhキーでヒストリ/ヤンクを表示
nnoremap <silent> [unite]<C-h> :<C-u>Unite<Space>history/yank<CR>
"スペースキーとoキーでoutline
nnoremap <silent> [unite]<C-o> :<C-u>Unite<Space>outline<CR>
"スペースキーとENTERキーでfile_rec:!
nnoremap <silent> [unite]<CR> :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>
" grep検索
nnoremap <silent> [unite]g  :<C-u>Unite grep -buffer-name=search-buffer<CR>
"hキーでヒストリ/commandを表示
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
"rキーphpmanual表示
nnoremap <silent> [unite]r :<C-u>Unite<Space>ref/phpmanual -horizontal<CR>
"qキーphpmanual表示
nnoremap <silent> [unite]q :<C-u>UniteResume<CR>
"mキーmark表示
nnoremap <silent> [unite]m :<C-u>Unite<Space>mark<CR>
"unite.vimを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " ESCでuniteを終了
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction"}}}

autocmd BufEnter *
\   if empty(&buftype)
\|     nnoremap <buffer> <C-t> :<C-u>Unite jump<CR>
\|  endif

nnoremap <silent> <C-c>c :Unite<Space>gtags/context<CR>
nnoremap <silent> <C-c>r :Unite<Space>gtags/ref<CR>
nnoremap <silent> <C-c>d :Unite<Space>gtags/def<CR>
nnoremap <silent> <C-c>g :Unite<Space>gtags/grep<CR>
nnoremap <silent> <C-c>p :Unite<Space>gtags/completion<CR>

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
            \ '-i --vimgrep --hidden --ignore ' .
            \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

let g:neoyank#limit = 1000
let g:neoyank#file = $HOME.'/.vim/yankring.txt'

let g:unite_source_mark_marks = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"[]^.<>'

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
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

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
vnoremap <silent> <C-p> "0p<CR>

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" vimshell setting
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "
" vimshell map
nnoremap <silent> vss :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vsp :VimShellPop<CR>

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" over.vim {{{
" over.vimの起動
nnoremap <silent> <C-a>m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap <silent> <C-c>m :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap <silent> <C-c>b y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
" }}}


" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
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

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
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
" 「'」 + 何かにマッピング
" let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
" let g:EasyMotion_grouping=1
" nmap s <Plug>(easymotion-s2)
" xmap s <Plug>(easymotion-s2)
" surround.vimと被らないように
" omap z <Plug>(easymotion-s2)

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_javascript_jshint_conf='~/.jshintrc'

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
nnoremap <silent> <Leader>gv :Agit<CR>
" nnoremap <silent> <Leader>gva :Gitv --all<CR>
" nnoremap <silent> <Leader>gf :Gitv!<CR>
autocmd FileType git :setlocal foldlevel=99

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
let g:ref_phpmanual_path = $HOME.'/.vim/ref/php-chunked-xhtml'
let g:ref_jquery_doc_path = $HOME . '/.vim/bundle/jqapi'
let g:ref_javascript_doc_path = $HOME . '/.vim/bundle/jsref/htdocs'
let g:ref_auto_resize = 1
let g:ref_wikipedia_lang = ['ja', 'en']
let g:ref_use_cache = 1

nnoremap <silent> <C-a><C-p> :<C-u>Ref phpmanual<Space>

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
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

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
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
" let g:eskk#marker_henkan='->'
" let g:eskk#marker_henkan_select='=>'


" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" if executable('cmigemo')
    " cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>"
" endif

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" TagBar
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

let dbext_default_profile="PG_local"
let dbext_default_buffer_lines=20

let g:ftplugin_sql_omni_key = '<c-k>'
let g:ftplugin_sql_omni_key_right = '<c-n>'
let g:ftplugin_sql_omni_key_left  = '<c-s>'
let g:omni_sql_include_owner = 0

exec 'inoremap <silent> '.g:ftplugin_sql_omni_key_right.' <C-R>=sqlcomplete#DrillIntoTable()<CR>'
exec 'inoremap <silent> '.g:ftplugin_sql_omni_key_left.'  <C-R>=sqlcomplete#DrillOutOfColumns()<CR>'
exec 'inoremap <buffer> '.g:ftplugin_sql_omni_key.'t <C-\><C-O>:call sqlcomplete#Map("table")<CR><C-X><C-O>'
exec 'inoremap <buffer> '.g:ftplugin_sql_omni_key.'c <C-\><C-O>:call sqlcomplete#Map("column")<CR><C-X><C-O>'
exec 'inoremap <buffer> '.g:ftplugin_sql_omni_key.'l <C-\><C-O>:call sqlcomplete#Map("column-csv")<CR><C-X><C-O>'
exec 'inoremap <buffer> '.g:ftplugin_sql_omni_key.'R <C-\><C-O>:call sqlcomplete#Map("resetCache")<CR><C-X><C-O>'

" -----------------------------------------------------------------------------
"  MultipleSearch
" -----------------------------------------------------------------------------
nnoremap * :Search <C-R><C-W><CR>
nnoremap + :SearchReset<CR>
let g:MultipleSearchMaxColors = 4

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
" -----------------------------------------------------------------------------
"  vdebug
" -----------------------------------------------------------------------------
" let s:bundle = neobundle#get("vdebug")
" function! s:bundle.hooks.on_source(bundle)
"     let g:vdebug_force_ascii = 1
"     let g:vdebug_options = {
"     \    "port" : 9000,
"     \    "server" : 'localhost',
"     \    "timeout" : 20,
"     \    "on_close" : 'detach',
"     \    "break_on_open" : 1,
"     \    "ide_key" : 'xdebug',
"     \    "remote_path" : "",
"     \    "local_path" : "",
"     \    "debug_window_level" : 0,
"     \    "debug_file_level" : 0,
"     \    "debug_file" : "",
"     \ }
" endfunction
" unlet s:bundle

nnoremap <silent> <Leader>vf :VimFiler<CR>

if !exists('g:neocomplete#text_mode_filetypes')
    let g:neocomplete#text_mode_filetypes = {}
endif
let g:neocomplete#text_mode_filetypes = {
            \ 'rst': 1,
            \ 'markdown': 1,
            \ 'gitrebase': 1,
            \ 'gitcommit': 1,
            \ 'vcs-commit': 1,
            \ 'hybrid': 1,
            \ 'text': 1,
            \ 'help': 1,
            \ 'tex': 1,
            \ }

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

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby =
         \ '[^. *\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['php', 'ruby', 'javascript', 'json'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_php_checkers=['php']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_quite_warnings=0
let g:syntastic_php_phpmd_post_args='design,unusedcode'


" -------------------------------
" QfixGrep
" -------------------------------
" let MyGrep_ExcludeReg = '[~#]$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$\|^tags$|[/\\]svn[/\\]|[/\\].git[/\\]|[/\\]logs[/\\]'

" -------------------------------
" QfixHowm
" -------------------------------
" "Howmコマンドキーマップ
" let QFixHowm_Key = 'g'
" "Howmコマンドの2ストローク目キーマップ
" let QFixHowm_KeyB = ','
"
" let QFixHowm_FileType = 'qfix_memo'


" -------------------------------
" TaskList.vim
" -------------------------------
nmap <Leader>T <Plug>TaskList

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


if filereadable(expand($HOME."/.vimrc.local"))
    source ~/.vimrc.local
endif

filetype plugin on
