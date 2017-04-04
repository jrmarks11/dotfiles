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
set clipboard=unnamed
set list listchars=tab:▸\ ,trail:·

if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif
set directory=~/.vim-swap//

if isdirectory($HOME . '/.vim-undo') == 0
  :silent !mkdir -p ~/.vim-undo >/dev/null 2>&1
endif

if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep\ --smart-case
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
set grepformat=%f:%l:%c:%m

set undofile
set undodir=$HOME/.vim-undo
set undolevels=1000
set undoreload=10000

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-elixir'
Plug 'tomasr/molokai'
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()

let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"

syntax on
filetype on
filetype indent on
filetype plugin on

colors molokai
highlight LineNr guifg=#cccccc

autocmd BufWritePre * :%s/\s\+$//e

nmap Y y$
nmap K i<CR><ESC>
nnoremap - :bd<CR>
nmap [d dd<ESC>
nmap ]d [d
nmap <LEADER>w :w<CR>
nmap <LEADER>r :Gblame<CR>
nmap <LEADER>t :FZF<CR>
nmap <LEADER>f :Find<SPACE>
nmap <LEADER>/ :nohlsearch<CR>

function Rspec_line()
  execute "!" ."bundle exec rspec " . bufname("%") . ':' . line(".")
endfunction

function Rspec_file()
  execute "!" ."bundle exec rspec " . bufname("%")
endfunction

command Runrspecline call Rspec_line()
command Runrspecfile call Rspec_file()

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

