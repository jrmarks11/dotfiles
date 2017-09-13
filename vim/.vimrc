let mapleader=' '

call plug#begin('~/.vim/plugged')
  Plug 'andrewradev/splitjoin.vim'
  Plug 'b4winckler/vim-angry'
  Plug 'crusoexia/vim-dracula'
  Plug 'elixir-lang/vim-elixir'
  Plug 'jceb/vim-orgmode'
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'julian/vim-textobj-variable-segment'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  Plug 'kana/vim-textobj-user'
  Plug 'ludovicchabant/vim-gutentags.git'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'

  Plug 'jmarks/vim-colors'
  Plug 'jmarks/vim-commands'
  Plug 'jmarks/vim-settings'
call plug#end()

" Remove extra newlines and trailng whitspace when saving
autocmd BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Store ctrl u and w store in the undo register
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Ctrl-K deletes to end of line
inoremap <C-K> <C-O>d$

" Y works like D and C
nmap Y y$

" K splits lines
nmap K i<CR><ESC>

" shift tab and tab like c-o and c-i
nmap <S-TAB> <C-o>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" good leader keys that are open
nmap <LEADER>, :!echo ,<CR>
nmap <LEADER>d "_d
nmap <LEADER>h <<
nmap <LEADER>j ]e
nmap <LEADER>k [e
nmap <LEADER>l :Limelight!!<CR>
nmap <LEADER>n }jzt
nmap <LEADER>N 2{jzt
nmap <LEADER>m }jzz
nmap <LEADER>M 2{jzz
nmap <LEADER>o :Goyo<CR>
nmap <LEADER>p "0p
nmap <LEADER>q :!echo q<CR>
nmap <LEADER>r :Colors<CR>
nmap <LEADER>u :!echo u<CR>
nmap <LEADER>y :!echo y<CR>

" command shortcuts
nmap <LEADER>a :Lines<CR>
nmap <LEADER>c :ToggleColor<CR>
nmap <LEADER>i :BLines<CR>
nmap <LEADER>z ZZ<CR>
nmap <LEADER>; :History:<CR>
nmap <LEADER>/ :History/<CR>
nmap <LEADER>. @@

" git
nmap <LEADER>gb :Gblame<CR>
nmap <LEADER>gs :GFiles?<CR>
nmap <LEADER>gt :GFiles<CR>
nmap <LEADER>gg :Ggrep<SPACE>

" specs
nmap <LEADER>ss :Runspecfile<CR>
nmap <LEADER>sc :Rspeccb<CR>
nmap <LEADER>sl :Runspecline<CR>
nmap <LEADER>sv :Rspeclinecb<CR>

" buffers
nmap <LEADER><TAB> :b#<CR>
nmap <LEADER>b     :Buffer<CR>
nmap <LEADER>x     :bd<CR>

" files
nmap <LEADER>t  :Files<CR>
nmap <LEADER>e  :Lex<CR>
nmap <LEADER>v  :Vex<CR>
nmap <LEADER>ff :FzfVimGrep<SPACE>
nmap <LEADER>fw :FzfVimGrep<SPACE><C-R>=expand("<cword>")<CR><CR>
nmap <LEADER>gw :grep<SPACE><C-R>=expand("<cword>")<CR><CR>
nmap <LEADER>fg :grep<SPACE>
nmap <LEADER>fr :History<CR>

" window nav
nmap <LEADER>w  <C-w>
nmap <LEADER>w- <C-w>s
nmap <LEADER>w/ <C-w>v
nmap <LEADER>wd <C-w>q

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
