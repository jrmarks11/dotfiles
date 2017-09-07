let mapleader=' '

call plug#begin('~/.vim/plugged')
  Plug 'jmarks/vim-settings'

  Plug 'andrewradev/splitjoin.vim'
  Plug 'b4winckler/vim-angry'
  Plug 'crusoexia/vim-dracula'
  Plug 'elixir-lang/vim-elixir'
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
call plug#end()

colorscheme dracula
highlight LineNr guifg=#cccccc

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

" good leader keys that are open
nmap <LEADER>n }jzt
nmap <LEADER>N 2{jzt
nmap <LEADER>m }jzz
nmap <LEADER>M 2{jzz
nmap <LEADER>o :Goyo<CR>
nmap <LEADER>q :!echo q<CR>
nmap <LEADER>r :Colors<CR>
nmap <LEADER>u :!echo u<CR>
nmap <LEADER>y :!echo y<CR>
nmap <LEADER>, :!echo ,<CR>

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

" text
nmap <LEADER>d "_d
nmap <LEADER>h <<
vmap <LEADER>h <gv
nmap <LEADER>j ]e
vmap <LEADER>j ]egv
nmap <LEADER>k [e
vmap <LEADER>k [egv
nmap <LEADER>l >>
vmap <LEADER>l >gv
nmap <LEADER>p "0p

function Toggle_Color()
  if (&background == 'dark')
    colorscheme PaperColor
    set background=light
  else
    colorscheme dracula
    set background=dark
  endif
endfunction
command ToggleColor call Toggle_Color()

function Rspec_line_cb()
  execute ":wa"
  execute ":let @* = \"" . "bundle exec rspec " . bufname("%") . ':'
        \ . line(".") . " --format d\""
endfunction
command Rspeclinecb call Rspec_line_cb()

function Rspec_line()
  execute ":wa"
  execute "!" . "bundle exec rspec " . bufname("%") . ':' . line(".")
        \ . " --format d"
endfunction
command Runspecline call Rspec_line()

function Rspec_file()
  execute ":wa"
  execute "!" . "bundle exec rspec " . bufname("%") . " --format d"
endfunction
command Runspecfile call Rspec_file()

function Rspec_cb()
  execute ":wa"
  execute ":let @* = \"" . "bundle exec rspec " . bufname("%")
        \ . " --format d\""
endfunction
command Rspeccb call Rspec_cb()

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" b is a ruby block instead of (
let g:textobj_rubyblock_no_default_key_mappings = 1
xmap ab <Plug>(textobj-rubyblock-a)
omap ab <Plug>(textobj-rubyblock-a)
xmap ib <Plug>(textobj-rubyblock-i)
omap ib <Plug>(textobj-rubyblock-i)

" find in project with fzf
command! -bang -nargs=* FzfVimGrep call
      \ fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings
      \ --ignore-case --hidden --follow --glob "!.git/*" --color "always" '
      \ .shellescape(<q-args>), 1, <bang>0)

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
