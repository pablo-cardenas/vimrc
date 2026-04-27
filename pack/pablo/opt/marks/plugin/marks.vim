vim9script 

var marks_highlight = false


def g:GetListMarks(): string
    final list_marks = []
    for mark in getmarklist('%')
        list_marks->add(mark.mark[1 : ])
    endfor
    return '(' .. list_marks->join(' ') .. ')'
enddef


def ToggleHighlightMarks()
    marks_highlight = !marks_highlight

    if marks_highlight
        prop_type_add('MarksPropType', {highlight: 'Pmenu'})
        HighlightMarks()
        setlocal statusline=%<%f\ %h%w%m%r%=%{GetListMarks()}\ \ %-14.(%l,%c%V%)\ %P
        setlocal laststatus=2
    else
        prop_type_delete('MarksPropType')
        setlocal statusline=
        setlocal laststatus=1
    endif
enddef


def HighlightMarks()
    if !marks_highlight
        return
    endif

    prop_clear(1, line('$'), {type: 'MarksPropType'})

    for mark in getmarklist('%')
        mark.pos[2] = min([mark.pos[2], strcharlen(getline(mark.mark)) + 1])
        prop_add(mark.pos[1], mark.pos[2], {type: 'MarksPropType', text: mark.mark[1 : ]})
    endfor
enddef


nnoremap <localleader>` <Cmd>call <SID>ToggleHighlightMarks()<CR>
autocmd CursorMoved,CursorMovedI * HighlightMarks()

# vim: et sts=4 sw=4
