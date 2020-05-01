let g:ale_linters = {
\   'c': ['clang'],
\   'cpp': ['clang'],
\   'markdown': ['proselint', 'writegood'],
\   'plaintex': ['lacheck', 'chktex'],
\   'python': ['pylint', 'flake8'],
\   'r': ['lintr'],
\   'tex': ['lacheck', 'chktex'],
\   }
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'plaintex': ['latexindent'],
\   'python': ['autopep8', 'yapf'],
\   'r': ['styler'],
\   'tex': ['latexindent'],
\}
let g:ale_fix_on_save = 1

call ale#Set('languagetool_options', '--language en-US --enable TOO_LONG_PARAGRAPH,READABILITY_RULE_SIMPLE,TOO_LONG_SENTENCE,READABILITY_RULE_DIFFICULT,HOPEFULLY,EN_PLAIN_ENGLISH_REPLACE,And,WHITESPACE_PARAGRAPH,PASSIVE_VOICE,THREE_NN,EMPTY_LINE,PARAGRAPH_REPEAT_BEGINNING_RULE --disable WHITESPACE_RULE --enablecategories Wikipedia')
