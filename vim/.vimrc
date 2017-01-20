let mapleader=","
set nocompatible
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set number
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.class,*/resolution-cache/*,*/$global/*,*/target/scala*
set ruler
set showtabline=2
set shell=bash
set colorcolumn=80
set cursorline
set hidden
set shiftround
set showmatch
set ignorecase
set smartcase
set visualbell
set noerrorbells

execute pathogen#infect()
syntax on
filetype on
filetype indent on
filetype plugin on

map <Leader>l :Autoformat<CR>

let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
let g:ctrlp_map = '<C-p>'

colors molokai
autocmd BufWritePre * :%s/\s\+$//e
highlight LineNr guifg=#cccccc

nnoremap ; :
nnoremap j gj
nnoremap k gk
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> ,/ :nohlsearch<CR>
