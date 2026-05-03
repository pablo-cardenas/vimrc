setlocal complete-=i

setlocal formatprg=black\ -ql79\ -\ \|\ reorder-python-imports\ -
setlocal makeprg=flake8\ %

setlocal path+=src
if !empty($VIRTUAL_ENV)
	setlocal path+=$VIRTUAL_ENV/lib/*/site-packages/
endif
setlocal wildignore+=*/*.egg-info/*,*.pyc,*/__pycache__/
