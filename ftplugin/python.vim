setlocal complete-=i

if executable('black') && executable('reorder-python-imports')
	setlocal formatprg=black\ -ql79\ -\ \|\ reorder-python-imports\ -
endif

if executable('flake8')
	setlocal makeprg=flake8\ %
endif

setlocal path+=src
if !empty($VIRTUAL_ENV)
	setlocal path+=$VIRTUAL_ENV/lib/*/site-packages/
endif
setlocal wildignore+=*/*.egg-info/*,*.pyc,*/__pycache__/
