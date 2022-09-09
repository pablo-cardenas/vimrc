setlocal formatprg=black\ -ql79\ -\ \|\ reorder-python-imports\ -
setlocal makeprg=flake8\ %

map <Leader>vr :call VimuxRunCommand("clear; source venv/bin/activate; python " . bufname("%"))<CR>
map <Leader>vo :call VimuxRunCommand("clear; source venv/bin/activate; python")<CR>
