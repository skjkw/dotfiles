" OSの判定
if has('win32')
    autocmd GUIEnter * simalt ~x
    autocmd GUIEnter * set transparency=240

    set guioptions-=e
    set guifont=Ricty:h13.5
    set guifontwide=Ricty:h13.5
elseif has('mac')
    set guioptions-=e
    set guifont=Ricty:h13.5
    set guifontwide=Ricty:h13.5
else
    set guioptions-=e
    set guifont=Ricty:h13.5
    set guifontwide=Ricty:h13.5
endif
