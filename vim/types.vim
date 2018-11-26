
" Prolog language
au BufNewFile,BufRead *.pl set filetype=prolog

" Haskell spaces instead of tabs
autocmd Filetype haskell setlocal ts=4 sts=-1 sw=4 expandtab
