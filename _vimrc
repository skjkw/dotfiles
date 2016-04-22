" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" ファイルエンコード
if has('gui_running') && !has('unix')
  set encoding=utf-8
endif
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/vimfiles/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/vimfiles/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
 echomsg 'Not installed bundles : ' .
       \ string(neobundle#get_not_installed_bundle_names())
 echomsg 'Please execute ":NeoBundleInstall" command.'
 "finish
endif

NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/vim-scripts/Align.git'
NeoBundle 'https://github.com/glidenote/memolist.vim.git'
NeoBundle 'https://github.com/kien/ctrlp.vim.git'
NeoBundle 'https://github.com/mattn/emmet-vim.git'
"NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/kien/ctrlp.vim.git'
NeoBundle 'https://github.com/h1mesuke/unite-outline'
NeoBundle 'taichouchou2/html5.vim' " HTML5シンタックス
NeoBundle 'hail2u/vim-css3-syntax' " CSS3シンタックス
NeoBundle 'kchmck/vim-coffee-script' " CoffeeScriptシンタックス
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-scripts/AutoComplPop' " コードヒント
NeoBundle 'cakebaker/scss-syntax.vim' " Sassシンタックス
NeoBundle 'Townk/vim-autoclose' " 閉じカッコを自動化
NeoBundle 'https://github.com/jelera/vim-javascript-syntax.git'
NeoBundle 'xolox/vim-session' , {'depends' : 'xolox/vim-misc'}
"NeoBundle 'https://github.com/itchyny/lightline.vim'
NeoBundle 'https://github.com/hewes/unite-gtags'
NeoBundle 'https://github.com/tpope/vim-surround'
NeoBundle 'open-browser.vim'
NeoBundle 'https://github.com/ujihisa/unite-colorscheme'
NeoBundle 'https://github.com/thinca/vim-ref'
NeoBundle 'https://github.com/tsukkee/unite-tag'
NeoBundle 't9md/vim-textmanip'
"NeoBundle 'alpaca-tc/alpaca_powertabline'
"NeoBundle 'https://github.com/Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'https://github.com/rking/ag.vim'
NeoBundle 'https://github.com/maksimr/vim-jsbeautify'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'https://github.com/bling/vim-airline'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'LeafCage/yankround.vim'

filetype plugin indent on

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
augroup filetypedetect
    au! BufRead,BufNewFile *.min.js       setfiletype javascript
    " au! BufRead,BufNewFile *.coffee       setfiletype javascript
    " au! BufRead,BufNewFile *.scss         setfiletype css
    au! BufRead,BufNewFile *.sass         setfiletype css
    au! BufRead,BufNewFile *.less         setfiletype css
augroup END

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '  '
let g:airline_left_alt_sep = '  '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline#extensions#tabline#left_sep = '  '
let g:airline#extensions#tabline#left_alt_sep = '  '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
let g:airline_symbols.branch = ' '
let g:airline_symbols.readonly = ' '
let g:airline_symbols.linenr = ' '
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
set number
set nobackup
set autoindent
set smartindent
set showmatch
set nocompatible " Vi互換モードをオフ
set wildmenu wildmode=list:longest,full " コマンドライン補完を便利に
set history=100000
set showcmd " タイプ途中のコマンドを画面最下行に表示
set incsearch " インクリメンタルサーチを有効
set hlsearch " 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が混在しているときは区別する
set ignorecase
set smartcase
" オートインデント、改行、インサートモード開始直後にバックスペースキーで 削除できるようにする
set backspace=indent,eol,start
set ruler " 画面最下行にルーラーを表示する
set laststatus=2 "ステータスラインを常に表示する
set mouse=a " 全モードでマウスを有効化
set cmdheight=2 " コマンドラインの高さを二行に
set noswapfile " スワップファイルを作らない
set scrolloff=10
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set guifont=Ricty\ for\ Powerline:h13
set guifontwide=Ricty\ for\ Powerline:h13
set showtabline=4
set iminsert=0
set imsearch=0
set guioptions-=T " ツールバーを非表示
set guioptions-=m " メニューバーを非表示
set guioptions-=r " 右スクロールバー非表示
set guioptions-=R " 右スクロールバー非表示(画面分割時)
set guioptions-=l " 左スクロールバー非表示
set guioptions-=L " 左スクロールバー非表示(画面分割時)
set list
set listchars=tab:>\ ,trail:_
set clipboard=unnamed,unnamedplus
set shellslash
set visualbell t_vb=
set noerrorbells
colorscheme desert " molokai
syntax on

" カレント行ハイライトON
set cursorline
" アンダーラインを引く(color terminal)
" highlight CursorLine cterm=NONE ctermfg=white ctermbg=black
" アンダーラインを引く(gui)
highlight CursorLine gui=NONE guifg=NONE guibg=#666666

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
"nmap <F9> :NERDTreeToggle<CR>
" カンマ連打でコメントトグル with NERDCommenter
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle


" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
noremap // :<C-u>Migemo<CR>


" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

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

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

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

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
"set grepprg=grep\ -nHI
"autocmd QuickFixCmdPost *grep* cwindow

" 検索結果ハイライトを消去
nnoremap <C-h> :noh<CR>

"----------------------------------------------------
" GNU GLOBAL(gtags)
"----------------------------------------------------
"nmap <C-q> <C-w><C-w><C-w>q
"nmap <C-g> :Gtags -g
"nmap <C-l> :Gtags -f %<CR>
"nmap <C-j> :Gtags <C-r><C-w><CR>
"nmap <C-k> :Gtags -r <C-r><C-w><CR>
"nmap <C-n> :cn<CR>
"nmap <C-p> :cp<CR>

" Shell Settings
" NYAOS
"set shell=C:\kajikawa\nyaos-3.3.8_2-win\nyaos.exe
"set shellcmdflag=-e
"set shellpipe=\|&\ tee
"set shellredir=>%s\ 2>&1
"set shellxquote=\"

" 現在のディレクトリ直下の .vimsessions/ を取得
let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
" 存在すれば
if isdirectory(s:local_session_directory)
  " session保存ディレクトリをそのディレクトリの設定
  let g:session_directory = s:local_session_directory
  " vimを辞める時に自動保存
  let g:session_autosave = 'yes'
  " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
  let g:session_autoload = 'yes'
  " 1分間に1回自動保存
  let g:session_autosave_periodic = 1
else
  let g:session_autosave = 'no'
  let g:session_autoload = 'no'
endif
unlet s:local_session_directory
"" unite.vim {{{
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]

" unite.vim keymap
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]t :<C-u>Unite file<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
nnoremap <silent> ,vr :UniteResume<CR>
nnoremap <silent> ,gc :Unite<Space>gtags/context<CR>
nnoremap <silent> ,gr :Unite<Space>gtags/ref<CR>
nnoremap <silent> ,gd :Unite<Space>gtags/def<CR>
nnoremap <silent> ,gg :Unite<Space>gtags/grep<CR>
nnoremap <silent> ,gp :Unite<Space>gtags/completion<CR>

 
" vinarise
let g:vinarise_enable_auto_detect = 1
 
"" }}}

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
nnoremap <C-e> <Esc>$a
inoremap <C-e> <Esc>$a
nnoremap <C-a> <Esc>^i
inoremap <C-a> <Esc>^i
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
nnoremap <Leader>s :<C-u>OpenBrowserSearch<Space><C-r><C-w><CR>

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
let g:textmanip_enable_mappings = 1
" 行の複製
xmap <M-d> <Plug>(textmanip-duplicate-down)
nmap <M-d> <Plug>(textmanip-duplicate-down)
xmap <M-D> <Plug>(textmanip-duplicate-up)
nmap <M-D> <Plug>(textmanip-duplicate-up)

" 選択したテキストの移動
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
"phpmanualのパス
let g:ref_phpmanual_path = 'C:\Users\kajikawa\vimfiles\refs\php_manual_ja\php-chunked-xhtml'
let g:ref_phpmanual_cmd = 'lynx -dump -nonumbers %s'

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" vimshell setting
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "
" vimshell map
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vsp :VimShellPop<CR>

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" grep検索
"nnoremap <silent> ,ag  :<C-u>Unite grep: -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
"nnoremap <silent> ,acg :<C-u>Unite grep: -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
"nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
"if executable('ag')
"  let g:unite_source_grep_command = 'ag'
"  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
"  let g:unite_source_grep_recursive_opt = ''
"endif

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
"nnoremap <silent> ,ag :<C-u>Ag: <CR>


" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" for javascript
autocmd FileType javascript noremap <buffer>  <Leader>jsb :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <Leader>jsb :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <Leader>jsb :call CSSBeautify()<cr>

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
"ファイルを選択したときに左ペインを閉じる
:let g:proj_flags = "imstc"
"\Pで左ペイン（プロジェクト一覧）を復活させる
:nmap <silent> <Leader>P <Plug>ToggleProject
"プロジェクトを開いた時にプロジェクト一覧が展開された状態にする
autocmd BufAdd .vimprojects silent! %foldopen!

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
"" over.vim {{{
" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
" }}}

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" yankround.vim {{{
"" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 50
""履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
" }}}

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
