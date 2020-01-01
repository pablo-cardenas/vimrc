set nocompatible
set history=1000
set noswapfile
set nobackup

set encoding=utf-8
set backspace=indent,eol,start
set hidden

set noshowmode
set laststatus=1
set wildmenu

set nowrap
set showmatch

set undofile
set undodir=~/.vim/undodir

filetype indent plugin on
set autoindent

if &t_Co > 2
    syntax on
    set colorcolumn=80

    highlight ExtraWhitespace ctermbg=1
    match ExtraWhitespace /\s\+$/
else
    set listchars+=trail:~
    set list
endif

" Avoid some keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>
noremap! <BS>    <NOP>
