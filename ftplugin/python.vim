setlocal complete-=i

setlocal formatprg=black\ -ql79\ -\ \|\ reorder-python-imports\ -
setlocal makeprg=flake8\ %

setlocal foldmethod=indent
setlocal nofoldenable

nnoremap <silent> <LocalLeader>vs :set opfunc=TmuxSendNormal<cr>g@
vnoremap <silent> <LocalLeader>vs :call TmuxSendVisual(visualmode())<cr>

setlocal path+=venv/lib/python3.12/site-packages/
setlocal wildignore+=*/*.egg-info/*,*.pyc,*/__pycache__/
