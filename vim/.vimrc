let mapleader=' '
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
set noerrorbells
set visualbell
set wildignore+=*/.git/*,*/tmp/*,*.swp

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf',        { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'vim-elixir'

Plug 'tomasr/molokai'
call plug#end()

syntax on
filetype on
filetype indent on
filetype plugin on

colors molokai
highlight LineNr guifg=#cccccc

autocmd BufWritePre * :%s/\s\+$//e

nnoremap ! :!
nnoremap j gj
nnoremap k gk
nnoremap <ENTER> <C-d>
nnoremap <LEADER><ENTER> <C-u>
nmap B ^
inoremap kj <ESC>
inoremap jk <ESC>
xnoremap v <ESC>
cnoremap kj <C-c>
cnoremap jk <C-c>
nnoremap gv `[v`]
xnoremap y y`]
xnoremap p p`]
nnoremap p p`]
nmap Y y$
nmap K i<CR><ESC>
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

nmap <LEADER>w :w<CR>
nmap <LEADER>y "*y
nmap <LEADER>yy "*yy
xmap <LEADER>y "*y
nmap <LEADER>p "*p
nmap <LEADER>o o<ESC>
nmap <LEADER>O O<ESC>
nmap <LEADER>d dd<ESC>
nmap <LEADER>ev :e $MYVIMRC<CR>
nmap <LEADER>sv :so $MYVIMRC<CR>
nmap <LEADER>eb :e ~/.bashrc<CR>
nmap <LEADER>eg :e ~/.gitconfig<CR>
nmap <LEADER>r :!wholine % <C-r>=line('.')<CR><CR>
nmap <LEADER>t :Find<SPACE>

let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
nmap <LEADER>j <Plug>(easymotion-j)
nmap <LEADER>k <Plug>(easymotion-k)
nmap <LEADER>l :Autoformat<CR>
nmap t :FZF<CR>
nmap <LEADER>/ :nohlsearch<CR>
nmap \ <Plug>CommentaryLine
vmap \ <Plug>Commentary

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
