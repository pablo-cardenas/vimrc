edit document.tex
syntax on
set nolist
autocmd TextChanged *.tex :write
norm Gzb{{+

function! Synctex()
        execute "silent !zathura -x \"vim --servername thesis --remote-expr \\\"execute('edit \\\%{input} | \\\%{line} | call Synctex()')\\\"\" --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " output/document.pdf >/dev/null 2>&1 &"
        redraw!
endfunction

function! ViewRef()
	let match_list = matchlist(getline('.'), "^%% \\(\\a\\+\\d\\+\\) \\(\\d\\+\\)+\\(\\d\\+\\) \\(.*\\)$")
	let ref = $BIB_DATA . "/" . match_list[1] . ".pdf"
	let page = match_list[2] + match_list[3]
	let search = match_list[4]
	execute "silent !zathura " . ref . " -P " . page . " -f '" . search . "' >/dev/null 2>/dev/null&"

	redraw!
endfunction

function! Action()
	if match(getline('.'), "^\s*%%") == -1
		call Synctex()
	else
		call ViewRef()
	endif
endfunction

map <C-j> :call Action()<cr>

