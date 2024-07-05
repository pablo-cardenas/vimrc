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

set path=
set wildignore+=*/node_modules/*
set wildignore+=*/venv/*,*/*.egg-info/*,*.pyc,*/__pycache__/

autocmd BufWinLeave *.* mkview

set noloadplugins

" runtime! plugin/getscriptPlugin.vim
" runtime! plugin/gzip.vim
" runtime! plugin/logiPat.vim
" runtime! plugin/manpager.vim
" runtime! plugin/matchparen.vim
" runtime! plugin/netrwPlugin.vim
" runtime! plugin/rrhelper.vim
" runtime! plugin/spellfile.vim
" runtime! plugin/tarPlugin.vim
" runtime! plugin/tohtml.vim
" runtime! plugin/vimballPlugin.vim
" runtime! plugin/zipPlugin.vim

" runtime! plugin/fzf.vim
runtime! plugin/redact_pass.vim

" packadd comment
" "packadd termdebug
" packadd! cfilter
" packadd! editorconfig
" packadd! matchit

" packadd emmet-vim
" packadd ultisnips
" packadd vim-gitgutter
" packadd vim-indent-object
" packadd vim-ledger
" packadd vim-showmarks
" packadd vim-snippets
" packadd vim-surround
" packadd vimtex

" packadd hardmode
packadd tmux
packadd lsp

"filetype plugin indent on
