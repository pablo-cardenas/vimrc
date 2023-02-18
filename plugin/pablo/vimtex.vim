let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_indent_enabled = 0
let g:vimtex_imaps_enabled = 0

"let g:vimtex_compiler_enabled = 0
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


let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

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
