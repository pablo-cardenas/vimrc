set nocompatible
set history=10000
set noshowmode
set backspace=start,eol
set incsearch
set t_Co=16

set swapfile
set undofile
set backup
if has('win32')
    set pythonthreedll=$LOCALAPPDATA\Programs\Python\Python312\python312.dll
    set directory=$TEMP\vim\swap\
    set undodir=$TEMP\vim\undo\
    set backupdir=$TEMP\vim\backup\
else
    set directory=$XDG_CACHE_HOME/vim/swap/
    set undodir=$XDG_CACHE_HOME/vim/undo/
    set backupdir=$XDG_CACHE_HOME/vim/backup/
endif


filetype plugin indent on

set path=**
set wildignore+=*/node_modules/*
set wildignore+=*/venv/*,*/*.egg-info/*,*.pyc,*/__pycache__/

autocmd BufWinLeave *.* mkview

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

" Jumps
nnoremap <C-O> <NOP>
nnoremap <C-I> <NOP>

" Commands
cabbrev wq echo 'Use ZZ'
cabbrev q! echo 'Use ZQ'
cabbrev q echo 'Use ZQ'
cabbrev w echo 'Use up'

" Registers
for s:i in ['_','"','*','+','~','-','.',':','%','#','/','=','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    for s:j in ["p","P","y","Y","c","C","d","D"]
        execute 'nnoremap ' . s:j . ' :echo "Use registers instead of ' . s:j . '"<CR>'
        execute 'nnoremap "' . s:i . s:j . ' "' . s:i . s:j
        execute 'vnoremap ' . s:j . ' :<C-U>echo "Use registers instead of ' . s:j . '"<CR>'
        execute 'vnoremap "' . s:i . s:j . ' "' . s:i . s:j
    endfor
    for s:j in ["yy","cc","dd"]
        execute 'nnoremap ' . s:j . ' :echo "Use registers instead of ' . s:j . '"<CR>'
        execute 'nnoremap "' . s:i . s:j . ' "' . s:i . s:j
    endfor
endfor
