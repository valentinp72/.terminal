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

" Swap files not in the same folder
set directory=$HOME/.vim/swapfiles/ 

" On Linux/MacOS use system clipboard (Vim 7.4+)
set clipboard=unnamed

" Allow backspace to work on indents and get on previous line
set backspace=2

" Arrows key can be used to move between lines
set whichwrap+=<,>,[,]
