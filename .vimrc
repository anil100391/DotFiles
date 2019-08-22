set number relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set list
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→

" ENABLE JUSTIFY MACRO
" run _j to justify the doc
run macros/justify.vim

" SNIPPETS
" Read a template cpp file in and move cursor to main
nnoremap ,cpp :read $HOME/.skeleton.cpp<CR>4j4la

" PLUGINS
" specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'

call plug#end()