"vim-plug"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()

"Display current line number & relative line numbers"
set number relativenumber

"Set tab to 4 spaces"
set tabstop=4
set shiftwidth=4
set expandtab

"set termguicolors

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
