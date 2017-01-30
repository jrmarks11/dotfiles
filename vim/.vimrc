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

call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
call plug#end()

syntax on
filetype on
filetype indent on
filetype plugin on

colors molokai
autocmd BufWritePre * :%s/\s\+$//e
highlight LineNr guifg=#cccccc

nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>
inoremap kj <ESC>
inoremap jk <ESC>
map <Leader>l :Autoformat<CR>
nnoremap t :FZF<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> ,/ :nohlsearch<CR>
