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
nnoremap ! :!
nnoremap j gj
nnoremap k gk
nnoremap <TAB> :bn<CR>
inoremap <TAB> <C-N>
nnoremap <S-TAB> :bp<CR>
inoremap <S-TAB> <C-P>
nnoremap - :bd<CR>
inoremap kj <ESC>
inoremap jk <ESC>
nnoremap B ^
nnoremap E $
map <Leader>l :Autoformat<CR>
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
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" fast edit config files
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>eb :e ~/.bashrc<CR>
nnoremap <leader>eg :e ~/.gitconfig<CR>

nmap \ <Plug>CommentaryLine
nnoremap $ "*
