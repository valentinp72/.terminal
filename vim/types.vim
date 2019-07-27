
" Prolog language
au BufNewFile,BufRead *.pl set filetype=prolog

" Haskell spaces instead of tabs
autocmd Filetype haskell setlocal ts=4 sts=-1 sw=4 expandtab

" On JS files, enables JSDoc
let g:javascript_plugin_jsdoc = 1

" Java, disable auto syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['java'] }

" Python linter
let g:syntastic_python_checkers = ['flake8'] " or pylint
