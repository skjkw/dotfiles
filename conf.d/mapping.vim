" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
nnoremap <silent> <Leader><Leader> :NERDTreeToggle<CR>

noremap // :<C-u>Migemo<CR>

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
nnoremap Q gq
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
