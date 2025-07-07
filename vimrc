set nocompatible
set history=10000
set noshowmode
set backspace=start,eol
set incsearch
set t_Co=16

set swapfile
set undofile
set backup
autocmd BufWinLeave *.* mkview
au BufWritePre * let &backupext = '-' .. strftime("%Y%b%d%X") .. '~'


if has('win32')
  set pythonthreedll=$LOCALAPPDATA\Programs\Python\Python312\python312.dll
  set directory=$TEMP\vim\swap\
  set undodir=$TEMP\vim\undo\
  set backupdir=$TEMP\vim\backup\
  set viewdir=$TEMP\vim\view\
  set shell=powershell
else
  set directory=$XDG_CACHE_HOME/vim/swap/
  set undodir=$XDG_CACHE_HOME/vim/undo/
  set backupdir=$XDG_CACHE_HOME/vim/backup//
  set viewdir=$XDG_CACHE_HOME/vim/view/
  set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
endif

for folder in [&g:directory, &g:backupdir, &g:undodir, &viewdir]
  if ! isdirectory(expand(folder))
    silent! call mkdir(expand(folder), 'p', 0700)
  endif
endfor

set path=,

source config.vim
