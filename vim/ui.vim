" ----------------------------------- "
" - File: ui.vim                    - "
" ----------------------------------- "
" - Author:      PELLOIN Valentin   - "
" - Last update: 13/10/2018         - "
" - Creation:    13/10/2018         - "
" ----------------------------------- "
" - User Interface configuration    - "
" ----------------------------------- "

" Enable 256 colors
set t_Co=256

" Set colorscheme and background
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   },
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }
let g:airline_theme='papercolor'
colorscheme PaperColor
set background=dark

set mouse=a " mouse for everything
" Allow mouse draggin in vim
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end

set showcmd    " show the current command
set number     " show lines number
set cursorline " show the line where the cursor is
set hlsearch   " highlight search results

" columns after 80 are highlighted
let &colorcolumn=join(range(81,999),",")

" highlight color for cursor line and 80+ columns 
highlight ColorColumn ctermbg=235 
highlight CursorLine ctermbg=235 

" -------------------------
" - AIRLINE CONFIGURATION -
" -------------------------

let g:airline_theme='cool'                      " theme for airline
let g:airline#extensions#whitespace#enabled = 0 " disables whistespace warning
let g:airline#extensions#tabline#enabled = 1    " always show the tabline
let g:airline#extensions#tabline#show_tab_type = 0 " disable 'buffer' info
let g:airline#extensions#tabline#buffer_nr_show = 1 " show numering in tabs
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " format

" Remove airline file %, and number of lines symbol
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', '%3v'])
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

" Remove fileencoding information
let g:airline_section_y = ''

" ---------------------------
" - SYNTASTIC CONFIGURATION -
" ---------------------------

" The option below seems to be buggy on macOS and my vim,
" this tries to hide the bug
"set shortmess=a
"set cmdheight=2

" enable syntastic in airline
let g:airline#extensions#syntastic#enabled = 1

" Check when opening
let g:syntastic_check_on_open = 1

" Symbols for errors and warnings
"let g:syntastic_error_symbol = 'x'
"let g:syntastic_style_error_symbol = '╳'
"let g:syntastic_warning_symbol = '⚠︎'
"let g:syntastic_style_warning_symbol = '⚠︎'

" Airline text
let g:airline#extensions#syntastic#stl_format_err = '%e error(s)'
let g:airline#extensions#syntastic#stl_format_warn = '%w warning(s)'
let g:airline#extensions#syntastic#error_symbol = ''
let g:airline#extensions#syntastic#warning_symbol = ''

" Show the symbols on a classic column, with normal background
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Search in current file directory
let g:ctrlp_working_path_mode = 'a'

" Enable python-syntax highlighting
let g:python_print_as_function = 1
let g:python_highlight_all = 1

let g:gitgutter_terminal_reports_focus=0

" --------------------------
" - MARKDOWN CONFIGURATION -
" --------------------------

" disable autofolding
let g:vim_markdown_folding_disabled = 1
