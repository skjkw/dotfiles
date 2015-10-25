" OSの判定
if has('win32')
    autocmd GUIEnter * simalt ~x
    autocmd GUIEnter * set transparency=240

    set guioptions-=e
    set guifont=Ricty:h13.5
    set guifontwide=Ricty:h13.5
elseif has('mac')
    set guioptions-=e
    set guifont=Ricty\ 10.5
    set guifontwide=Ricty\ 10.5
else
    set guioptions-=e
    set guifont=Ricty\ 10.5
    set guifontwide=Ricty\ 10.5
endif
