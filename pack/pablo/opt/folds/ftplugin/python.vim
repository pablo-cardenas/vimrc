vim9script

def MyFoldFunc(): string
    if !exists('b:lasttick')
        b:lasttick = 0
    endif
    if b:lasttick == b:changedtick
      return b:foldlevels[v:lnum - 1]
    endif
    b:lasttick = b:changedtick
    b:foldlevels = []
    
    var current_foldlevel = 0
    var firstblock = true
    for i_line in range(line('$') - 1)
        const line = getline(i_line + 1)
        const nextline = getline(i_line + 2)
        if line =~ '^# %% \[markdown\]'
            if nextline =~ '^# #'
                current_foldlevel = 1
                firstblock = true
            elseif nextline =~ '^# ##'
                current_foldlevel = 2
                firstblock = true
            endif
            b:foldlevels->add('>' .. current_foldlevel)
        elseif line =~ '^# %%'
            if firstblock
                current_foldlevel = current_foldlevel + 1
                firstblock = false
            endif
            b:foldlevels->add('>' .. current_foldlevel)
        elseif nextline =~ '^# %% \[markdown\]' && !firstblock
            const nextnextline = getline(i_line + 3)
            if nextnextline =~ '^# #'
                b:foldlevels->add('0')
            elseif nextnextline =~ '^# #'
                b:foldlevels->add('1')
            else
                b:foldlevels->add('' .. current_foldlevel)
            endif
        else
            b:foldlevels->add('' .. current_foldlevel)
        endif
    endfor
    b:foldlevels->add('' .. current_foldlevel)

    return b:foldlevels[v:lnum - 1]
enddef

def CustomFoldText(): string
    const line = getline(v:foldstart + 1)->substitute('^# ', '', '')
    const nlines = v:foldend - v:foldstart + 1
    return printf('+--%3d lines: %s', nlines, line)
enddef

setlocal foldexpr=MyFoldFunc()
setlocal foldmethod=expr
setlocal foldtext=CustomFoldText()

# vim: et sts=4 sw=4
