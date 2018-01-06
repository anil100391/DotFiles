set relativenumber
set tabstop=4
set expandtab
set list
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→

" SNIPPETS
" Read a template cpp file in and move cursor to main
nnoremap ,cpp :read $HOME/.skeleton.cpp<CR>4j4la
