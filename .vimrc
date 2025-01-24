" use relative line numbers
set number relativenumber

" always use spaces tab = 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" ignore case when searching unless used with \c or pattern contains any
" capitalized letters
set ignorecase
set smartcase

" visualize whitespaces
set list
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→

" Search down into subfolders
" Provides tab-completions for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER
" - :b lets you autocomplete any open buffer

" leader key mapped to space
let mapleader=" "

" move visual selection up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" CLANG FORMAT
map <C-F> :pyf /usr/share/vim/addons/syntax/clang-format.py<cr>
imap <C-F> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format.py<cr>

"fzf
map <Leader>sf :FZF<cr>

" ENABLE JUSTIFY MACRO
" run _j to justify the doc
run macros/justify.vim

" SNIPPETS
" Read a template cpp file in and move cursor to main
nnoremap ,cpp :read $HOME/.skeleton.cpp<CR>4j4la

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" PLUGINS
" specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set background=dark
colorscheme PaperColor
