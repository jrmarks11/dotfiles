let mapleader=" "
set nocompatible
set expandtab
set tabstop=2
set shiftwidth=2
set hlsearch
set number
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

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf',        { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'

Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'
Plug 'baskerville/bubblegum'
call plug#end()

syntax on
filetype on
filetype indent on
filetype plugin on

colors bubblegum-256-dark
set background=dark
highlight LineNr guifg=#cccccc

autocmd BufWritePre * :%s/\s\+$//e

nnoremap ; :
nnoremap ! :!
nnoremap j gj
nnoremap k gk
nmap B ^
inoremap kj <ESC>
inoremap jk <ESC>
vnoremap jk <ESC>
vnoremap kj <ESC>
noremap gv `[v`]
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
nmap Y y$
nmap q: :q

nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>
nnoremap - :bd<CR>
inoremap <TAB> <C-N>
inoremap <S-TAB> <C-P>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <leader>w :w<CR>
nmap <leader>y "*y
nmap <leader>yy "*yy
vmap <leader>y "*y
nmap <leader>p "*p
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>
nmap <leader>eb :e ~/.bashrc<CR>
nmap <leader>eg :e ~/.gitconfig<CR>

let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l :Autoformat<CR>
nmap <silent> <leader>/ :nohlsearch<CR>
nmap \ <Plug>CommentaryLine
vmap \ <Plug>Commentary
noremap t :FZF<CR>

map <F1> :colors molokai<CR>
map <F2> :colors jellybeans<CR>:set background=dark<CR>
map <F3> :colors onedark<CR>:set background=dark<CR>
map <F4> :colors seoul256<CR>:set background=dark<CR>
map <F5> :colors seoul256<CR>:set background=light<CR>
map <F6> :colors bubblegum-256-dark<CR>:set background=dark<CR>
map <F7> :colors bubblegum-256-light<CR>:set background=light<CR>
