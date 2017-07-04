let mapleader=' '

call plug#begin('~/.vim/plugged')
Plug 'jmarks/vim-settings'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'elixir-lang/vim-elixir'
call plug#end()

let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"

colors molokai
highlight LineNr guifg=#cccccc

" Remove extra newlines and trailng whitspace when saving
autocmd BufWritePre * : %s/\n\n\n\+//e | %s/\s\+$//e

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

inoremap <C-U> <C-G>u<C-U>
nmap Y y$
nmap K i<CR><ESC>
nnoremap - :bd<CR>
nmap <LEADER>w :w<CR>
nmap <LEADER>r :Gblame<CR>
nmap <LEADER>fr :History<CR>
nmap <LEADER>; :History:<CR>
nmap <LEADER>/ :History/<CR>
nmap <LEADER>t :FZF<CR>
nmap <LEADER>pf :GFiles<CR>
nmap <LEADER>gs :GFiles?<CR>
nmap <LEADER>f :Find<SPACE>
nmap <LEADER>s :Runspecfile<CR>
nmap <LEADER>l :Runspecline<CR>
nmap <LEADER>. @@
nmap <LEADER>b :Buffer<CR>
map <LEADER>wj <C-w>j
map <LEADER>wk <C-w>k
map <LEADER>wh <C-w>h
map <LEADER>wl <C-w>l
map <LEADER>w/ :vsplit<CR>
map <LEADER>w- :split<CR>
map <LEADER>wd <C-w>q

function Rspec_line()
  execute ":wa"
  execute "!" . "bundle exec rspec " . bufname("%") . ':' . line(".") . " --format d"
endfunction

function Rspec_file()
  execute ":wa"
  execute "!" . "bundle exec rspec " . bufname("%") . " --format d"
endfunction

command Runspecline call Rspec_line()
command Runspecfile call Rspec_file()

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
