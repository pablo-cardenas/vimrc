set nocompatible
set history=1000

set encoding=utf-8
set backspace=eol,start
set hidden

set noshowmode
set laststatus=1
set wildmenu
set nowrap
set showmatch
set number
set mouse=

set directory=~/.cache/vim/swap/

set undofile
set undodir=~/.cache/vim/undo/

filetype indent plugin on
set autoindent

set path=**
set wildignore+=*/node_modules/*
set wildignore+=*/venv/*,*/*.egg-info/*,*.pyc,*/__pycache__/

if &t_Co > 2
    syntax on
    set colorcolumn=80
    set background=dark

    highlight ExtraWhitespace ctermbg=1
    match ExtraWhitespace /\s\+$/
else
    set listchars+=trail:~
    set list
endif

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" To avoid some keys
nnoremap <Left>  :echo "Use h"<CR>
nnoremap <Right> :echo "Use l"<CR>
nnoremap <Up>    :echo "Use k"<CR>
nnoremap <Down>  :echo "Use j"<CR>
nnoremap <BS>    :echo "Use C-h"<CR>
vnoremap <Left>  :<C-u>echo "Use h"<CR>
vnoremap <Right> :<C-u>echo "Use l"<CR>
vnoremap <Up>    :<C-u>echo "Use k"<CR>
vnoremap <Down>  :<C-u>echo "Use j"<CR>
vnoremap <BS>    :<C-u>echo "use C-h"<CR>
inoremap <Left>  <C-o>:echo "No left for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>
inoremap <Up>    <C-o>:echo "No up for you!"<CR>
inoremap <Down>  <C-o>:echo "No down for you!"<CR>
inoremap <BS>    <C-o>:echo "Use C-h"<CR>
cnoremap <BS>    <NOP>
inoremap <C-@>   <NOP>

cabbrev wq echo 'Use ZZ'
cabbrev q! echo 'Use ZQ'
cabbrev q echo 'Use ZQ'
