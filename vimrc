set nocompatible
set history=10000
set noshowmode
set backspace=start,eol
set incsearch

set directory=~/.cache/vim/swap/
set undofile
set undodir=~/.cache/vim/undo/

filetype plugin indent on

set path=**
set wildignore+=*/node_modules/*
set wildignore+=*/venv/*,*/*.egg-info/*,*.pyc,*/__pycache__/

autocmd BufWinLeave *.* mkview

" Annoying when accidentally press Ctrl-Space
inoremap <C-@>   <NOP>

" Arrows
nnoremap h       $
nnoremap l       0
nnoremap j       gg
nnoremap k       G
nnoremap <Left>  $
nnoremap <Right> 0
nnoremap <Up>    G
nnoremap <Down>  gg
nnoremap <BS>    :echo "Use C-h"<CR>
vnoremap <Left>  $
vnoremap <Right> 0
vnoremap <Up>    G
vnoremap <Down>  gg
vnoremap <BS>    :<C-u>echo "use C-h"<CR>
inoremap <Left>  <C-o>$
inoremap <Right> <C-o>0
inoremap <Up>    <C-o>G
inoremap <Down>  <C-o>gg
inoremap <BS>    <C-o>:echo "Use C-h"<CR>
cnoremap <BS>    <NOP>

" Windows
nnoremap <C-W><C-W> <NOP>

" Commands
cabbrev wq echo 'Use ZZ'
cabbrev q! echo 'Use ZQ'
cabbrev q echo 'Use ZQ'
cabbrev w echo 'Use up'
