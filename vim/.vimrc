let mapleader=" "
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

call plug#begin('~/.vim/plugged')
" Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf',        { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
call plug#end()

syntax on
filetype on
filetype indent on
filetype plugin on

colors molokai
autocmd BufWritePre * :%s/\s\+$//e
highlight LineNr guifg=#cccccc

nnoremap ; :
nnoremap ! :!
nnoremap j gj
nnoremap k gk
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>
inoremap <TAB> <C-N>
inoremap <S-TAB> <C-P>
nnoremap - :bd<CR>
inoremap kj <ESC>
inoremap jk <ESC>
vnoremap jk <ESC>
vnoremap kj <ESC>
nmap B ^
map <leader>l :Autoformat<CR>
nnoremap t :FZF<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <silent> <leader>/ :nohlsearch<CR>

" Easymotion.
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" fast edit config files
nmap <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>
nmap <leader>eb :e ~/.bashrc<CR>
nmap <leader>eg :e ~/.gitconfig<CR>

" Commentary
nmap \ <Plug>CommentaryLine
vmap \ <Plug>Commentary

" cut and pasting keybindings
noremap gV `[v`]
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
nmap Y y$

nmap <leader>w :w<CR>
nmap <leader>c "*
vmap <leader>c "*y
nmap <leader>p "*p
nmap q: :q
