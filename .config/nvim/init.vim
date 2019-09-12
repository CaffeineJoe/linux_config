"Display line number"
set number

"Set tab to 4 spaces"
set tabstop=4
set shiftwidth=4
set expandtab

"Hide mode as it's already displayed by lightline
set noshowmode

syntax on

let g:jellybeans_overrides = {
\    'background': { 'ctermbg': '235', '256ctermbg': '235' },
\}
colorscheme jellybeans

let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ }

"vim-plug"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'

call plug#end()
