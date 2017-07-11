let mapleader=' '

call plug#begin('~/.vim/plugged')
  Plug 'jmarks/vim-settings'

  Plug 'andrewradev/splitjoin.vim'
  Plug 'b4winckler/vim-angry'
  Plug 'crusoexia/vim-dracula'
  Plug 'junegunn/fzf', { 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'julian/vim-textobj-variable-segment'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'nelstrom/vim-visual-star-search'
  Plug 'tomasr/molokai'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'elixir-lang/vim-elixir'
call plug#end()

colorscheme dracula
highlight LineNr guifg=#cccccc

" Remove extra newlines and trailng whitspace when saving
autocmd BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Store ctrl u deletes in the undo register
inoremap <C-U> <C-G>u<C-U>

nmap Y y$
nmap K i<CR><ESC>
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" experimental leader keys
nmap <LEADER>a :args<CR>
nmap <LEADER>c :Color<CR>
nmap <LEADER>d "_d
nmap <LEADER>i :!echo i<CR>
nmap <LEADER>m  `m
nmap <LEADER>n :!echo n<CR>
nmap <LEADER>o :!echo o<CR>
nmap <LEADER>p "0p
nmap <LEADER>q :q<CR>
nmap <LEADER>t :!echo t<CR>
nmap <LEADER>u :!echo u<CR>
nmap <LEADER>w :w<CR>
nmap <LEADER>x :!echo x<CR>
nmap <LEADER>y :!echo y<CR>
nmap <LEADER>z ZZ<CR>
nmap <LEADER>, :!echo ,<CR>
nmap <LEADER>; :History:<CR>
nmap <LEADER>/ :History/<CR>
nmap <LEADER>. @@

" git
nmap <LEADER>gb :Gblame<CR>
nmap <LEADER>gs :GFiles?<CR>

" specs
nmap <LEADER>s :Runspecfile<CR>
nmap <LEADER>sc :Rspeccb<CR>
nmap <LEADER>sl :Runspecline<CR>
nmap <LEADER>slc :Rspeclinecb<CR>

" buffers
nmap <LEADER><TAB> :b#<CR>
nmap <LEADER>b :Buffer<CR>
nmap <LEADER>bd :bd<CR>
nmap <LEADER>bn :bn<CR>
nmap <LEADER>bp :bp<CR>

" files
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
nmap <LEADER>e :Lex<CR>
nmap <LEADER>ef :Sex<CR>
nmap <LEADER>ew :e %%
nmap <LEADER>es :sp %%
nmap <LEADER>ev :vsp %%
nmap <LEADER>f :FZF<CR>
nmap <LEADER>fg :grep<SPACE>
nmap <LEADER>fr :History<CR>
nmap <LEADER>fs :w<CR>
nmap <LEADER>fS :wa<CR>
nmap <LEADER>g  :Find<SPACE>
nmap <LEADER>pf :GFiles<CR>
nnoremap <LEADER>r :%s/
nnoremap <Leader>rw :%s/\<<C-R><C-W>\>//gc<Left><Left><Left>
xnoremap <LEADER>r :s/

" window navigation
nmap <LEADER>w- <C-w>s
nmap <LEADER>w/ <C-w>v
nmap <LEADER>wd <C-w>q
nmap <LEADER>wD <C-w>Q
nmap <LEADER>wh <C-w>h
nmap <LEADER>wH <C-w>H
nmap <LEADER>wj <C-w>j
nmap <LEADER>wJ <C-w>J
nmap <LEADER>wk <C-w>k
nmap <LEADER>wK <C-w>K
nmap <LEADER>wl <C-w>l
nmap <LEADER>wL <C-w>L
nmap <LEADER>ww <C-w>w
nmap <LEADER>wo <C-w>o

" text navigation
nmap <LEADER>h <<
vmap <LEADER>h <gv
nmap <LEADER>j ]e
vmap <LEADER>j ]egv
nmap <LEADER>k [e
vmap <LEADER>k [egv
nmap <LEADER>l >>
vmap <LEADER>l >gv
nmap <LEADER>v `[v`]

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
	xmap ab  <Plug>(textobj-rubyblock-a)
	omap ab  <Plug>(textobj-rubyblock-a)
	xmap ib  <Plug>(textobj-rubyblock-i)
	omap ib  <Plug>(textobj-rubyblock-i)

" Find in project
command! -bang -nargs=* Find call
      \ fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings
      \ --ignore-case --hidden --follow --glob "!.git/*" --color "always" '
      \ .shellescape(<q-args>), 1, <bang>0)

" Insert mode completion
imap <C-X><C-K> <Plug>(fzf-complete-word)
imap <C-X><C-F> <Plug>(fzf-complete-path)
imap <C-X><C-J> <Plug>(fzf-complete-file-ag)
imap <C-X><C-L> <Plug>(fzf-complete-line)

let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
