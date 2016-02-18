" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" ファイルエンコード
language mes en_US.utf8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Installation check.
if neobundle#exists_not_installed_bundles()
 echomsg 'Not installed bundles : ' .
       \ string(neobundle#get_not_installed_bundle_names())
 echomsg 'Please execute ":NeoBundleInstall" command.'
 "finish
endif

NeoBundle 'Shougo/unite.vim.git'
NeoBundleLazy 'Shougo/vimfiler', {
   \   'depends' : ["Shougo/unite.vim"],
   \   'autoload' : {
   \       'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir" ],
   \       'mappings' : ['<Plug>(vimfiler_switch)'],
   \       'explorer' : 1,
   \   }
   \}
NeoBundle 'Shougo/vimproc.git', {
   \ 'build' : {
   \    'cygwin' : 'make -f make_cygwin.mak',
   \    'mac' : 'make -f make_mac.mak',
   \    'linux' : 'make',
   \    'unix' : 'gmake',
   \    },
   \}
NeoBundleLazy 'Shougo/vimshell', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : {
    \   'commands' : [{ 'name' : 'VimShell',
    \                   'complete' : 'customlist,vimshell#complete'},
    \                 'VimShellExecute', 'VimShellInteractive',
    \                 'VimShellTerminal', 'VimShellPop'],
    \   'mappings' : ['<Plug>(vimshell_switch)']
    \ }}
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundleLazy   'Shougo/neosnippet.vim', {
      \ 'autoload' : {
      \   'insert'    : 1,
      \   'filetypes' : ['neosnippet'],
      \   },
      \ }
NeoBundle 'Shougo/vinarise'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'


" unite
NeoBundle 'Shougo/unite-outline'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'hewes/unite-gtags'
NeoBundle 'honza/vim-snippets'
NeoBundle 'tsukkee/unite-help'

" emmet
NeoBundle 'mattn/emmet-vim.git'

" colorschemes
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'

" visual
NeoBundle 'Yggdroot/indentLine'
" NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vim-scripts/AnsiEsc.vim'

" syntax
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'jQuery'
NeoBundle 'tpope/vim-haml'
NeoBundle 'claco/jasmine.vim'
NeoBundle 'pbrisbin/html-template-syntax'
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'exu/pgsql.vim'
NeoBundle 'othree/yajs.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'

" utility
NeoBundle 'vim-scripts/Align.git'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'rhysd/migemo-search.vim'
NeoBundleLazy   'sjl/gundo.vim', {
      \ 'autoload' : {'commands': 'GundoToggle'}
      \ }
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'kana/vim-submode'
" NeoBundle 'vim-scripts/PDV--phpDocumentor-for-Vim'

" linter
NeoBundle 'scrooloose/Syntastic'

" version
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'

" search
NeoBundle 'rking/ag.vim'

" database
NeoBundle 'mattn/webapi-vim'

" textobject
NeoBundle 'tpope/vim-surround'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'thinca/vim-textobj-comment'
NeoBundle 'akiyan/vim-textobj-php'
NeoBundle 'nelstrom/vim-textobj-rubyblock'

" skk
NeoBundle 'tyru/eskk.vim'

NeoBundle 'tyru/skkdict.vim'

" tag
NeoBundle 'majutsushi/tagbar'

" refence
NeoBundle 'thinca/vim-ref'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'mojako/ref-sources.vim'
NeoBundle 'mustardamus/jqapi'
NeoBundle 'tokuhirom/jsref'
NeoBundle 'yuku-t/vim-ref-ri'

NeoBundle 'AndrewRadev/switch.vim'

" browser
NeoBundleLazy 'yuratomo/w3m.vim', {
      \ 'autoload' : {'commands': 'W3mTab'}
      \ }

" gmail
NeoBundleLazy 'yuratomo/gmail.vim', {
      \ 'autoload' : {'commands': 'Gmail'}
      \ }

" redmine
NeoBundle 'basyura/rmine.vim'

" debug
NeoBundleLazy 'joonty/vdebug.git', {
            \    'autoload':{'filetypes':["php"]}
            \ }

" library
NeoBundle 'vim-scripts/L9'

" replace
" NeoBundle 'thinca/vim-qfreplace'

NeoBundle 'mattn/ctrlp-filer'
NeoBundle 'vim-scripts/ctrlp-funky'
NeoBundle 'sgur/ctrlp-extensions.vim'

NeoBundle 'haya14busa/vim-migemo'
NeoBundle 'thinca/vim-unite-history'

NeoBundle 'vim-scripts/dbext.vim'

NeoBundle 'thinca/vim-unite-history'

NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'vim-scripts/MultipleSearch'

NeoBundle 'kana/vim-smartchr'

NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'idanarye/vim-merginal'

NeoBundle 'cohama/agit.vim'

NeoBundleLazy   'ujihisa/neco-look', {
      \ 'depends'  : 'Shougo/neocomplete',
      \ 'type' : 'nosync',
      \}

NeoBundle 'vim-jp/vital.vim'

NeoBundleLazy   'jceb/vim-hier', {
      \ 'autoload' : {
      \   'commands' : ['HierUpdate', 'HierClear', 'HierStart', 'HierStop'],
      \ }}

NeoBundle 'captbaritone/better-indent-support-for-php-with-html'
NeoBundle '2072/PHP-Indenting-for-VIm'

NeoBundleLazy 'tyru/operator-camelize.vim', {
      \ 'autoload' : {
          \ 'mappings' : [
              \ ['nx', '<Plug>(operator-camelize', '<Plug>(operator-decamelize)']]
      \ }}

NeoBundle 'akiyan/vim-textobj-xml-attribute'

NeoBundle 'h1mesuke/textobj-wiw'
NeoBundle 'thinca/vim-textobj-between.git'
NeoBundle 'tpope/vim-repeat'

NeoBundle 'tobyS/vmustache'
NeoBundle 'tobyS/pdv', {
    \   'depends' : ["tobyS/vmustache"],
    \ }
NeoBundle 'SirVer/ultisnips'

NeoBundle 'tmhedberg/matchit'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'haya14busa/incsearch.vim'

NeoBundleLazy 'marcus/rsense', {
      \ 'autoload': {
      \   'filetypes': 'ruby',
      \ },
      \ }

NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
  \ 'insert' : 1,
  \ 'filetypes': 'ruby',
  \ }}

NeoBundle 'tpope/vim-endwise', { 'autoloard' : {
            \ 'insert' : 1,
            \ 'filetypes' : 'ruby',
            \ }}

NeoBundle 'fuenor/qfixgrep'
NeoBundle 'fuenor/qfixhowm'

NeoBundleLazy 'vim-scripts/TaskList.vim', {
            \ 'autoload': {
            \    'mappings': ['<Plug>TaskList'],
            \ }}

NeoBundleLazy 'vim-scripts/SQLUtilities', {
            \ 'autoload':{
            \    'filetypes': ['sql'],
            \ }}

NeoBundle 'kana/vim-smartinput'
NeoBundleLazy 'davidhalter/jedi-vim', {
            \ 'autoload': {
            \    'filetypes': ['py'],
            \ }}
NeoBundleLazy 'andviro/flake8-vim', {
            \ 'autoload': {
            \    'filetypes': ['py'],
            \ }}
NeoBundleLazy 'hynek/vim-python-pep8-indent', {
            \ 'autoload': {
            \    'filetypes': ['py'],
            \ }}
NeoBundleLazy 'jmcantrell/vim-virtualenv', {
            \ 'autoload': {
            \    'filetypes': ['py'],
            \ }}
NeoBundleLazy 'bps/vim-textobj-python', {
            \ 'autoload': {
            \    'filetypes': ['py'],
            \ }}
NeoBundleLazy 'aquach/vim-http-client', {
            \ 'autoload': {
            \    'commands': ['HTTPClientDoRequest'],
            \ }}

NeoBundle 'mtth/scratch.vim'
NeoBundle 'osyo-manga/vim-brightest'

NeoBundle 'dahu/vimple'
NeoBundle 'dahu/Asif'
NeoBundle 'Raimondi/VimRegStyle'
NeoBundle 'vim-scripts/SyntaxRange'
NeoBundle 'dahu/vim-asciidoc'

NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'jreybert/vimagit'

NeoBundle 'tacroe/unite-mark'

call neobundle#end()

filetype plugin indent on     " Required!

NeoBundleCheck

set runtimepath+=~/.vim/
runtime! conf.d/*.vim

let $PATH = "c:/cygwin/bin;" . $PATH
