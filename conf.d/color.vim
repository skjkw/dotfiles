" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
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

" カレント行ハイライトON
" set cursorline
" アンダーラインを引く(color terminal)
" highlight CursorLine cterm=NONE ctermfg=White ctermbg=DarkGray

" set cursorcolumn
