map <Leader>vr :call VimuxRunCommand("clear; Rscript " . bufname("%"))<CR>
map <Leader>vo :call VimuxRunCommand("clear; R")<CR>
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
let rmd_dynamic_comments = 0

function! rmd#Format()
  if search("^[ \t]*```[ ]*{r", "bncW") > search("^[ \t]*```$", "bncW")
    execute "silent '<,'>!Rscript\ --vanilla\ -e\ \"suppressPackageStartupMessages(library(styler));options(styler.colored_print.vertical=FALSE);con=file(\\\"stdin\\\");style_text(readLines(con),transformers=tidyverse_style());close(con)\""
    return 0
else
    return 1
  endif
endfunction

setlocal formatexpr=rmd#Format()
