
" CTRL-Z to undo
map <C-z> u

" Disable search results with Enter
nnoremap <CR> :noh<CR><CR>

" -----------
" - BUFFERS -
" -----------

" Next buffer with Tab
nnoremap <Tab> :bnext<CR><CR>

" Previous buffer with Shift Tab
nnoremap <S-Tab> :bprevious<CR><CR>

" Close buffer with ctrl + w
nnoremap <C-w> :bdelete<CR><CR>

" Close buffer without saving with ctrl + d
nnoremap <C-d> :bdelete!<CR><CR>

" New buffer with ctrl + t
nnoremap <C-t> :enew<CR><CR>

" -----------
" - WINDOWS -
" -----------

" Navigation between windows with CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
