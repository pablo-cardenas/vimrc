" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd', '-clang-tidy'],
    \ 'cpp': ['clangd', '-clang-tidy'],
    \ 'python': ['pyls'],
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ 'tex': ['texlab'],
    \ }


nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
