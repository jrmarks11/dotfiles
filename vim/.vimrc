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

if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif
set directory=~/.vim-swap//

if isdirectory($HOME . '/.vim-backup') == 0
  :silent !mkdir -p ~/.vim-backup >/dev/null 2>&1
endif
set backupdir=~/.vim-backup//

if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo >/dev/null 2>&1
endif
set undofile
set undodir=$HOME/.vim-undo
set undolevels=1000
set undoreload=10000

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-elixir'
Plug 'tomasr/molokai'
Plug 'takac/vim-hardtime'
call plug#end()

let g:hardtime_default_on = 1

syntax on
filetype on
filetype indent on
filetype plugin on

colors molokai
highlight LineNr guifg=#cccccc

autocmd BufWritePre * :%s/\s\+$//e

nmap Y y$
nmap Q @q
nmap K i<CR><ESC>

nnoremap \ :bn<CR>
nnoremap - :bd<CR>
inoremap <TAB> <C-N>
inoremap <S-TAB> <C-P>

nmap <LEADER>\ :bp<CR>
nmap <LEADER>w :w<CR>
nmap <LEADER>y "*y
xmap <LEADER>y "*y
nmap <LEADER>p "*p
nmap <LEADER>o o<ESC>
nmap <LEADER>O O<ESC>
nmap <LEADER>d dd<ESC>
nmap <LEADER>r :!wholine % <C-r>=line('.')<CR><CR>
nmap <LEADER>t :FZF<CR>
nmap <LEADER>f :Find<SPACE>
nmap <LEADER>/ :nohlsearch<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

