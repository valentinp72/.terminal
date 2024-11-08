" ----------------------------------- "
" - File: general.vim               - "
" ----------------------------------- "
" - Author:      PELLOIN Valentin   - "
" - Last update: 13/10/2018         - "
" - Creation:    13/10/2018         - "
" ----------------------------------- "
" - General configuration file     - "
" ----------------------------------- "

set encoding=utf8  " vim output in utf8

set nocompatible   " not compatible with vi
syntax enable      " enable syntax hightlighting
filetype plugin on " commands according to filetype

set autoindent   " enable autoindent
set smartindent  " smart indent
set breakindent  " break lines while keeping the indent
set cindent      " better indent for C
set tabstop=4    " indents width
set shiftwidth=4 " an indent per tab

" Allow history to be saved even when changing active buffer
set hidden

" Swap files not in the same folder
set directory=$HOME/.vim/swapfiles/ 

" On Linux/MacOS use system clipboard (Vim 7.4+)
set clipboard=unnamed

" Allow backspace to work on indents and get on previous line
set backspace=2

" Arrows key can be used to move between lines
set whichwrap+=<,>,[,]

" Change default update time for Git-Gutter (default 4000ms)
set updatetime=2000

" Less delay when pressing esc to switch from insert to normal
set timeoutlen=1000
set ttimeoutlen=50

" Enable incremental search
set incsearch

" Enable minimap
let g:minimap_width = 10
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 1
let g:minimap_highlight_range = 1

set number

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
