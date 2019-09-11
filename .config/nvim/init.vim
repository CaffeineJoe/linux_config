"Display line number"
set number

"Set tab to 4 spaces"
set tabstop=4
set shiftwidth=4
set expandtab

syntax on

let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
colorscheme jellybeans
