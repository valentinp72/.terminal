" ----------------------------------- "
" - File: .vimrc                    - "
" ----------------------------------- "
" - Author:      PELLOIN Valentin   - "
" - Last update: 13/10/2018         - "
" - Creation:    13/10/2018         - "
" ----------------------------------- "
" - Main configuration file for Vim - "
" ----------------------------------- "

call plug#begin('~/.vim/plugged')
	source ~/.vim/themes.vim
	source ~/.vim/plugins.vim
call plug#end()

source ~/.vim/general.vim
source ~/.vim/ui.vim
source ~/.vim/mappings.vim
