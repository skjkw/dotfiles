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

" ステータスラインにeskkのモードを表示する
function! g:SkkInputMode()
    return g:eskk#statusline()
endfunction

" ステータスラインにモードを表示する
" ステータスラインの色も変更する
function! g:GetNowMode()
    let nowMode = mode()
    if nowMode == 'n' || nowMode == 'no'
        highlight StatusLine guifg=#2E4340 guibg=#ccdc90 ctermfg=white
        return 'Normal'
    elseif nowMode == 'i'
        highlight StatusLine guifg=#ccdc90 guibg=#2E4340 ctermfg=gray
        return 'Insert'
    elseif nowMode == '' || nowMode ==? 'v'
        highlight StatusLine guifg=#8f9bdc guibg=#ffc50d ctermfg=blue
        return 'Visual'
    elseif nowMode == '' || nowMode ==? 's'
        return 'Select'
    elseif nowMode == 'R'
        return 'Replace'
    elseif nowMode == 'Rv'
        return 'VisualReplace'
    elseif nowMode == 'c'
        highlight StatusLine guifg=#dc6464 guibg=#0dff51 ctermfg=red
        return 'Command'
    elseif nowMode == 'cv'
        return 'VimEx'
    elseif nowMode == 'r'
        return 'HitEnter'
    elseif nowMode == 'rm'
        return 'More'
    elseif nowMode == 'r?'
        return 'Confirm'
    elseif nowMode == '!'
        return 'Shell'
    endif
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
