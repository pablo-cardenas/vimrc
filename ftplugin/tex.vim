setlocal formatprg=latexindent\ -g\ /dev/null
setlocal tabstop=2
setlocal shiftwidth=2
setlocal conceallevel=2
highlight! link Conceal texCmd

highlight ExtraWhitespace ctermbg=1
match ExtraWhitespace /\(\(\\(\)\@<=\s\+\|\s\+\(\\)\)\@=\|\(\S.*\)\@<=\s\s\+\([^ &\\]\)\@=\)/

set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()

compiler tex
