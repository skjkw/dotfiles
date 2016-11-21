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
" let g:textmanip_enable_mappings = 1
" nmap ,d <Plug>(textmanip-duplicate-down)
" nmap ,d <Plug>(textmanip-duplicate-down)
" xmap ,D <Plug>(textmanip-duplicate-up)
" nmap ,D <Plug>(textmanip-duplicate-up)
"
" nmap <F10> <Plug>(textmanip-toggle-mode)
" xmap <F10> <Plug>(textmanip-toggle-mode)


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
" for javascript
" autocmd FileType javascript noremap <buffer>  <Leader>jsb :call JsBeautify()<cr>
" for html
" autocmd FileType html noremap <buffer> <Leader>jsb :call HtmlBeautify()<cr>
" for css or scss
" autocmd FileType css noremap <buffer> <Leader>jsb :call CSSBeautify()<cr>

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

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" vim-gitgutter
"  let g:gitgutter_sign_added = '✚ '
"  let g:gitgutter_sign_modified = '➜ '
"  let g:gitgutter_sign_removed = '✘ '

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" let g:indentLine_color_term = 111
" let g:indentLine_color_gui = '#708090'
" let g:indentLine_char = '¦'

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="'"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
" hi EasyMotionShade  ctermbg=none ctermfg=darkgray
" hi EasyMotionTarget ctermbg=red ctermfg=yellow
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
" surround.vimと被らないように
omap z <Plug>(easymotion-s2)

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
" nnoremap <silent> <Leader>gg :Git<Space>
" nnoremap <silent> <Leader>gs :Gstatus<CR>
" nnoremap <silent> <Leader>gw :Gwrite<CR>
" nnoremap <silent> <Leader>gc :Gcommit<CR>
" nnoremap <silent> <Leader>gb :Gblame<CR>
" nnoremap <silent> <Leader>gd :Gdiff<CR>
" nnoremap <silent> <Leader>gl :Glog<CR>
" nnoremap <silent> <Leader>gf :Git fetch --all<CR>
"
" nnoremap <silent> <Leader>gm :MerginalToggle<CR>

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
if executable('cmigemo')
    cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>"
endif

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" submode.vim
" http://d.hatena.ne.jp/thinca/20130131/1359567419
" ウィンドウサイズの変更キーを簡易化する
" [C-w],[+]または、[C-w],[-]
" call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
" call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
" call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
" call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
" call submode#map('winsize', 'n', '', '>', '<C-w>>')
" call submode#map('winsize', 'n', '', '<', '<C-w><')
" call submode#map('winsize', 'n', '', '+', '<C-w>-')
" call submode#map('winsize', 'n', '', '-', '<C-w>+')

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" TagBar
nnoremap <silent> <C-a><C-t> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_updateonsave_maxlines = 10000
let g:tagbar_sort = 0

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" gundo
" nnoremap U :<C-U>GundoToggle<CR>

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" nnoremap <silent><C-q> :Switch<CR>

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

" exec 'inoremap <silent> '.g:ftplugin_sql_omni_key_right.' <C-R>=sqlcomplete#DrillIntoTable()<CR>'
" exec 'inoremap <silent> '.g:ftplugin_sql_omni_key_left.'  <C-R>=sqlcomplete#DrillOutOfColumns()<CR>'
" exec 'inoremap <buffer> '.g:ftplugin_sql_omni_key.'t <C-\><C-O>:call sqlcomplete#Map("table")<CR><C-X><C-O>'
" exec 'inoremap <buffer> '.g:ftplugin_sql_omni_key.'c <C-\><C-O>:call sqlcomplete#Map("column")<CR><C-X><C-O>'
" exec 'inoremap <buffer> '.g:ftplugin_sql_omni_key.'l <C-\><C-O>:call sqlcomplete#Map("column-csv")<CR><C-X><C-O>'
" exec 'inoremap <buffer> '.g:ftplugin_sql_omni_key.'R <C-\><C-O>:call sqlcomplete#Map("resetCache")<CR><C-X><C-O>'

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

nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *  <Plug>(incsearch-nohl-*)zz
map #  <Plug>(incsearch-nohl-#)zz
map g* <Plug>(incsearch-nohl-g*)zz
map g# <Plug>(incsearch-nohl-g#)zz

" let g:rsenseHome = expand("~/opt/rsense-0.3")
" let g:rsenseUseOmniFunc = 1

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
let MyGrep_ExcludeReg = '[~#]$\|\.bak$\|\.o$\|\.obj$\|\.exe$\|[/\\]tags$\|^tags$|[/\\]svn[/\\]|[/\\].git[/\\]|[/\\]logs[/\\]'

" -------------------------------
" QfixHowm
" -------------------------------
"Howmコマンドキーマップ
let QFixHowm_Key = 'g'
"Howmコマンドの2ストローク目キーマップ
let QFixHowm_KeyB = ','

let QFixHowm_FileType = 'qfix_memo'


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
" markdown
" -------------------------------
" au BufRead,BufNewFile *.md set filetype=markdown


" -------------------------------
" vimagit
" -------------------------------
" let g:magit_show_help = 1
" let g:magit_default_show_all_files = 2
" let g:magit_default_fold_level = 2
" let g:magit_default_sections = ['global_help', 'info', 'unstaged', 'staged', 'commit']


" -------------------------------
" undo永続化
" -------------------------------
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

let g:loaded_matchparen = 1

" -------------------------------
" golang
" -------------------------------
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_interfaces = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1

" -------------------------------
" jedi-vim
" -------------------------------
" autocmd FileType python setlocal omnifunc=jedi#completions

" -------------------------------
" python-syntax
" -------------------------------
" let python_highlight_all = 1

