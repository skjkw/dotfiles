" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
augroup filetypedetect
    au! BufRead,BufNewFile *.min.js       setfiletype javascript
    au! BufRead,BufNewFile *.coffee       setfiletype javascript
    au! BufRead,BufNewFile *.scss         setfiletype css
    au! BufRead,BufNewFile *.sass         setfiletype css
    au! BufRead,BufNewFile *.less         setfiletype css
augroup END

" YAMLファイル用タブストップ設定
au FileType yaml setlocal expandtab ts=2 sw=2 fenc=utf-8
