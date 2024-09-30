setlocal complete-=i

setlocal formatprg=black\ -ql79\ -\ \|\ reorder-python-imports\ -
setlocal makeprg=flake8\ %

setlocal foldmethod=indent
setlocal nofoldenable

nnoremap <silent> <LocalLeader>vs :set opfunc=TmuxSendNormal<cr>g@
vnoremap <silent> <LocalLeader>vs :call TmuxSendVisual(visualmode())<cr>
