vim9script

def g:TmuxSendKeysToMarkedVisual()
    var a_save = @a
    try
        silent execute 'normal! "ay'
        call system('tmux send-keys -t {marked} -- ' .. "\e[200~" .. shellescape(@a) .. "\e[201~" )
    finally
        @a = a_save
    endtry
enddef

def TmuxSendKeysToMarkedNormal(type: string)
    var a_save = @a
    try
        if type == 'line'
            silent execute "normal! '[V']\"ay"
        elseif type == "char"
            silent execute "normal! `[v`]\"ay"
        elseif type == "block"
            silent execute "normal! `[\<C-v>`]\"ay"
        endif
        call system('tmux send-keys -t {marked} -- ' .. "\e[200~" .. shellescape(@a) .. "\e[201~" )
    finally
        @a = a_save
        set operatorfunc=
    endtry
enddef

def TmuxSetBuffer()
    var a_save = @a
    try
        silent execute 'normal! "ay'
        call system('tmux set-buffer ' .. shellescape(@a))
    finally
        @a = a_save
    endtry
enddef

vmap <silent> <localleader>tb <ScriptCmd>TmuxSetBuffer()<CR>
vmap <silent> <localleader>ts <ScriptCmd>TmuxSendKeysToMarkedVisual()<CR>
nmap <silent> <localleader>ts <Cmd>set operatorfunc=TmuxSendKeysToMarkedNormal<CR>g@
nmap <silent> <localleader>te <ScriptCmd>system('tmux send-keys -t {marked} Enter')<CR>
nmap <silent> <localleader>tc <ScriptCmd>system('tmux send-keys -t {marked} <C-c>')<CR>
nmap <silent> <localleader>td <ScriptCmd>system('tmux send-keys -t {marked} <C-d>')<CR>
nmap <silent> <localleader>tp <ScriptCmd>system('tmux send-keys -t {marked} python Enter')<CR>

# vim: et sts=4 sw=4
