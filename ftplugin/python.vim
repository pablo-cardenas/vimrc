set formatprg=black\ -ql79\ -

map <Leader>vr :call VimuxRunCommand("clear; source venv/bin/activate; python " . bufname("%"))<CR>
map <Leader>vo :call VimuxRunCommand("clear; source venv/bin/activate; python")<CR>
