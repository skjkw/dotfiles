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

" ステータスラインにモードを表示する
function! g:SkkInputMode()
    return eskk#statusline()
endfunction

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
" let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
"
" if has('syntax')
"   augroup InsertHook
"     autocmd!
"     autocmd InsertEnter * call s:StatusLine('Enter')
"     autocmd InsertLeave * call s:StatusLine('Leave')
"   augroup END
" endif
"
" let s:slhlcmd = ''
" function! s:StatusLine(mode)
"   if a:mode == 'Enter'
"     silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
"     silent exec g:hi_insert
"   else
"     highlight clear StatusLine
"     silent exec s:slhlcmd
"   endif
" endfunction
"
" function! s:GetHighlight(hi)
"   redir => hl
"   exec 'highlight '.a:hi
"   redir END
"   let hl = substitute(hl, '[\r\n]', '', 'g')
"   let hl = substitute(hl, 'xxx', '', '')
"   return hl
" endfunction
""""""""""""""""""""""""""""""

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