let g:ale_linters = {
\   'c': ['clangd'],
\   'cpp': ['clangd'],
\   'css': ['stylelint'],
\   'html': ['stylelint', 'tidy'],
\   'javascript': ['eslint'],
\   'markdown': ['proselint', 'writegood'],
\   'plaintex': ['lacheck', 'chktex'],
\   'python': ['flake8', 'mypy'],
\   'r': ['lintr'],
\   'sass': ['stylelint'],
\   'tex': ['lacheck', 'chktex'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint'],
\   }
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'css': ['stylelint'],
\   'html': ['stylelint'],
\   'javascript': ['prettier', 'eslint'],
\   'mail': [],
\   'plaintex': ['latexindent'],
\   'python': ['yapf'],
\   'r': ['styler'],
\   'sass': ['stylelint'],
\   'tex': ['latexindent'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1

nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)
