set softtabstop=2
set shiftwidth=2
set expandtab
set cindent

set formatprg=Rscript\ --vanilla\ -e\ \"suppressPackageStartupMessages(library(styler));options(styler.colored_print.vertical=FALSE);con=file(\\\"stdin\\\");style_text(readLines(con),transformers=tidyverse_style());close(con)\"

nnoremap <silent> <LocalLeader>vs :set opfunc=TmuxSendNormal<cr>g@
vnoremap <silent> <LocalLeader>vs :<C-u>call TmuxSendVisual(visualmode())<cr>
