let g:netrw_list_hide = netrw_gitignore#Hide() . ',.git/'
let g:netrw_dirhistmax = 10000
let g:netrw_home = '$XDG_CACHE_HOME/vim/netrw_home'

if ! isdirectory(expand(g:netrw_home))
  silent! call mkdir(expand(g:netrw_home), 'p', 0700)
endif
