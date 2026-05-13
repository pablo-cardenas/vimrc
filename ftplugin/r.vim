setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal cindent
setlocal textwidth=80

setlocal formatprg=R\ -s\ --vanilla\ -e\ \"options(styler.colored_print.vertical=FALSE);styler::style_text(readLines(\\\"stdin\\\"))\"
setlocal keywordprg=sh\ -c\ 'Rscript\ -e\ \"help($1)\"'\ --

let g:r_syntax_folding = 1
