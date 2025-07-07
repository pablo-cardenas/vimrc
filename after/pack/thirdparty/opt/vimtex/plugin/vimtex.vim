let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_mappings_override_existing = 1
"let g:vimtex_indent_enabled = 0
"let g:vimtex_imaps_enabled = 0


let g:vimtex_compiler_enabled = 0
"let g:vimtex_complete_enabled = 0
"let g:vimtex_doc_enabled = 0
"let g:vimtex_fold_bib_enabled = 0
"let g:vimtex_format_enabled = 0
"let g:vimtex_include_search_enabled = 0
"let g:vimtex_indent_bib_enabled = 0
"let g:vimtex_mappings_enabled = 0
"let g:vimtex_matchparen_enabled = 0
"let g:vimtex_motion_enabled = 0
"let g:vimtex_quickfix_enabled = 0
"let g:vimtex_syntax_enabled = 0
"let g:vimtex_text_obj_enabled = 0
"let g:vimtex_toc_enabled = 0
"let g:vimtex_view_enabled = 0


let g:vimtex_view_method='zathura_simple'
let g:vimtex_quickfix_mode=0

let g:vimtex_syntax_conceal = {
\ 'accents': 1,
\ 'ligatures': 1,
\ 'cites': 1,
\ 'fancy': 1,
\ 'spacing': 1,
\ 'greek': 1,
\ 'math_bounds': 0,
\ 'math_delimiters': 1,
\ 'math_fracs': 1,
\ 'math_super_sub': 1,
\ 'math_symbols': 1,
\ 'sections': 0,
\ 'styles': 1,
\}

let g:vimtex_delim_toggle_mod_list = [
\ ['\left', '\right'],
\ ['\bigl', '\bigr'],
\ ['\Bigl', '\Bigr'],
\ ['\biggl', '\biggr'],
\ ['\Biggl', '\Biggr'],
\]

let g:vimtex_env_toggle_math_map = {
\ '$': '$$',
\ '$$': '$',
\ '\(': '\[',
\ '\[': '\(',
\}

if empty(v:servername) && exists('*remote_startserver')
	call remote_startserver('VIM')
endif
