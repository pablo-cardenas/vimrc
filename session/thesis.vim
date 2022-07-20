edit document.tex
syntax on 
set nolist
autocmd TextChanged *.tex :write
norm Gzb{{+

function! Synctex()
        execute "silent !zathura -x \"vim --servername thesis --remote-expr \\\"execute('edit \\\%{input} | \\\%{line} | call Synctex()')\\\"\" --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " /tmp/document.pdf >/dev/null 2>&1 &"
        redraw!
endfunction

map <C-j> :call Synctex()<cr>

