
" Prolog language
" au BufNewFile,BufRead *.pl set filetype=prolog

" Haskell spaces instead of tabs
autocmd Filetype haskell setlocal ts=4 sts=-1 sw=4 expandtab

let g:ale_sign_error = '⛔'
let g:ale_sign_warning = '⚠️'

let g:ale_echo_msg_format = '[%linter% - %severity% %code%] %s'

" Python
let g:ale_linters = {'python': ['pylsp']}

let g:ale_completion_lsp = 0
let g:ale_completion_lsp_servers = ['pylsp']
set omnifunc=ale#completion#OmniFunc

" https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
let g:ale_python_pylsp_config = {
\   'pylsp': {
\     'plugins': {
\       'pycodestyle': {
\           'ignore': ['E501', 'E502', 'E302', 'E305', 'E261', 'E402']
\       }
\     }
\   },
\ }

let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_hover_to_floating_preview = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_floating_preview = 1
set completeopt=menu,menuone,popup,noselect,noinsert

" On JS files, enables JSDoc
let g:javascript_plugin_jsdoc = 1

" Java, disable auto syntastic
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['java'] }

" Python linter
" let g:syntastic_python_checkers = ['flake8'] " or pylint
