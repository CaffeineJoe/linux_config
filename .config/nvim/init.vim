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

set termguicolors
set list
set listchars=tab:<->,trail:~,eol:$,nbsp:%

"Hide mode as it's already displayed by lightline
set noshowmode

syntax on

let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ }

let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none', 'guibg': 'none'},
\}
colorscheme jellybeans
highlight CursorLineNr guifg=#d8ad4c
