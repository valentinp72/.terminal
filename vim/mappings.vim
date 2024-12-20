
" No longer need to shift to escape
nmap ; :

" Disable search results with Enter
nnoremap <CR> :noh<CR><CR>

" Allow :qw to save and quit (:wq)
cnoreabbrev qw wq

" edgemotion up and down mapping using page up and down keys 
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

" Search within files with Ctrl + S
nnoremap <C-s> :Ag<CR>

" Search files with Ctrl + P
nnoremap <C-p> :Files<CR>

" Autocomplete with words from the current buffer using Tab
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<C-x>\<C-n>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-x>\<C-p>"

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

" ubuntu share clipboard (need to install xclip)
set clipboard=unnamedplus
