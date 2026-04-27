vim9script

autocmd InsertCharPre *.tex call Snippet_InsertCharPre()
autocmd TextChangedI *.tex call Snippet_TextChangedI()

var command: string = ''

def g:Snippet_InsertCharPre()
    if v:char == '_' && vimtex#syntax#in_mathzone()
       var pos = getcharpos('.')
       var lnum = pos[1]
       var coln = pos[2]
       var line = getline('.')
       if line[coln - 2] == '_'
           command = '__'
       endif
    elseif v:char == '^' && vimtex#syntax#in_mathzone()
       var pos = getcharpos('.')
       var lnum = pos[1]
       var coln = pos[2]
       var line = getline('.')
       if line[coln - 2] == '^'
           command = '^^'
       endif
    elseif v:char == '~' && vimtex#syntax#in_mathzone()
       var pos = getcharpos('.')
       var lnum = pos[1]
       var coln = pos[2]
       var line = getline('.')
       if line[coln - 4 : coln - 2] == 'iid'
           command = 'iid~'
       endif
    elseif v:char == 't' && vimtex#syntax#in_mathzone()
       var pos = getcharpos('.')
       var lnum = pos[1]
       var coln = pos[2]
       var line = getline('.')
       if line[coln - 2] == 't'
           command = 'tt'
       endif
    elseif v:char == 'k' && !vimtex#syntax#in_mathzone()
       var pos = getcharpos('.')
       var lnum = pos[1]
       var coln = pos[2]
       var line = getline('.')
       if line[ : coln - 2] =~# '\<m$'
           command = '\(...\)'
       endif
    elseif v:char == 'm' && !vimtex#syntax#in_mathzone()
       var pos = getcharpos('.')
       var lnum = pos[1]
       var coln = pos[2]
       var line = getline('.')
       if line[ : coln - 2] =~# '^\s*d$'
           command = '\[...\]'
       endif
    elseif v:char == '=' && vimtex#syntax#in_mathzone()
       var pos = getcharpos('.')
       var lnum = pos[1]
       var coln = pos[2]
       var line = getline('.')
       if line[coln - 2] == '<'
           command = '<='
       endif
    elseif v:char == '=' && vimtex#syntax#in_mathzone()
       var pos = getcharpos('.')
       var lnum = pos[1]
       var coln = pos[2]
       var line = getline('.')
       if line[coln - 2] == '>'
           command = '>='
       endif
    elseif v:char == 'v' && vimtex#syntax#in_mathzone()
       var pos = getcharpos('.')
       var lnum = pos[1]
       var coln = pos[2]
       var line = getline('.')
       if line[coln - 2] == 'v'
           command = 'vv'
       endif
    elseif v:char == 'V' && vimtex#syntax#in_mathzone()
       var pos = getcharpos('.')
       var lnum = pos[1]
       var coln = pos[2]
       var line = getline('.')
       if line[coln - 2] == 'V'
           command = 'VV'
       endif
    endif

    if command != ""
         feedkeys("\<C-g>u")
    endif
enddef

def g:Snippet_TextChangedI()
    if command != ''
        var pos = getcharpos('.')
        var lnum = pos[1]
        var coln = pos[2]
        var line = getline('.')

        if command == '^^'
            setline(
                ".",
                strcharpart(line, 0, coln - 2) ..
                '{}<++>' ..
                line[coln - 1 : ]
            )
            setcharpos('.', [0, lnum, coln, 0])
        elseif command == '__'
            setline(
                ".",
                strcharpart(line, 0, coln - 2) ..
                '{}<++>' ..
                line[coln - 1 : ]
            )
            setcharpos('.', [0, lnum, coln, 0])
        elseif command == 'iid~'
            setline(
                ".",
                strcharpart(line, 0, coln - 5) ..
                '\overset{\text{iid}}{\sim}' ..
                line[coln - 1 : ]
            )
            setcharpos('.', [0, lnum, coln + 26 - 4, 0])
        elseif command == '<='
            setline(
                ".",
                strcharpart(line, 0, coln - 3) ..
                '\le' ..
                line[coln - 1 : ]
            )
            setcharpos('.', [0, lnum, coln + 3 - 2, 0])
        elseif command == '>='
            setline(
                ".",
                strcharpart(line, 0, coln - 3) ..
                '\ge' ..
                line[coln - 1 : ]
            )
            setcharpos('.', [0, lnum, coln + 3 - 2, 0])
        elseif command == '\(...\)'
            setline(
                ".",
                strcharpart(line, 0, coln - 3) ..
                '\(\)<++>' ..
                line[coln - 1 : ]
            )
            setcharpos('.', [0, lnum, coln + 2 - 2, 0])
        elseif command == '\[...\]'
            setline(
                ".",
                strcharpart(line, 0, coln - 3) ..
                '\['
            )
            append(lnum, ["\t", '.\]', '<++>' .. line[coln - 1 : ]])
            setcharpos('.', [0, lnum + 1, 2, 0])
        elseif command == 'tt'
            setline(
                ".",
                strcharpart(line, 0, coln - 3) ..
                '\text{}<++>' ..
                line[coln - 1 : ]
            )
            setcharpos('.', [0, lnum, coln + 6 - 2, 0])
        elseif command == 'vv'
            setline(
                ".",
                strcharpart(line, 0, coln - 3) ..
                '\lvert  \rvert<++>' ..
                line[coln - 1 : ]
            )
            setcharpos('.', [0, lnum, coln + 7 - 2, 0])
        elseif command == 'VV'
            setline(
                ".",
                strcharpart(line, 0, coln - 3) ..
                '\lVert  \rVert<++>' ..
                line[coln - 1 : ]
            )
            setcharpos('.', [0, lnum, coln + 7 - 2, 0])
        endif

        command = ''
    endif
enddef

def g:JumpPlaceholder()
    if  search('<++>') > 0
        feedkeys("\<Esc> \"_ca>")
    endif
enddef

g:surround_insert_tail = "<++>"

inoremap <silent> <C-J> <Cmd>:call JumpPlaceholder()<CR>
nnoremap <silent> <C-J> <Cmd>:call JumpPlaceholder()<CR>

# vim: et sts=4 sw=4
