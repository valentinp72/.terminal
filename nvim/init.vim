call plug#begin('~/.config/nvim/plugged')
  Plug 'bwot/init.neovim'
  Plug 'flazz/vim-colorschemes'             " Hundreds of colorschemes o_O
call plug#end()

let mapleader=","                           " Use , instead of \ as leader
set background=dark                         " Use dark background
colorscheme Monokai                         " From flazz/vim-colorschemes

" Escape is very very far from the homerow
inoremap jj <esc>
" Stop the highlighting with ,space
nmap <Leader><Space> :noh<CR>
