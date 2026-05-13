vim9script

def TmuxSendKeysToMarkedVisual()
    var a_save = @a
    try
        silent execute 'normal! "ay'
        call system("tmux load-buffer -", @a)
        call system("tmux paste-buffer -p -t {marked}")
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
        call system("tmux load-buffer -", @a)
        call system("tmux paste-buffer -p -t {marked}")
    finally
        @a = a_save
        set operatorfunc=
    endtry
enddef

def TmuxSetBufferVisual()
    var a_save = @a
    try
        silent execute 'normal! "ay'
        call system("tmux load-buffer -", "\e[200~" .. @a .. "\e[201~")
        call system("tmux paste-buffer -t {marked}")
    finally
        @a = a_save
    endtry
enddef

def TmuxSetBufferNormal(type: string)
    var a_save = @a
    try
        if type == 'line'
            silent execute "normal! '[V']\"ay"
        elseif type == "char"
            silent execute "normal! `[v`]\"ay"
        elseif type == "block"
            silent execute "normal! `[\<C-v>`]\"ay"
        endif
        call system("tmux load-buffer -", @a)
    finally
        @a = a_save
        set operatorfunc=
    endtry
enddef

nmap <silent> <localleader>tb <Cmd>set operatorfunc=<SID>TmuxSetBufferNormal<CR>g@
vmap <silent> <localleader>tb <ScriptCmd>TmuxSetBufferVisual()<CR>
nmap <silent> <localleader>ts <Cmd>set operatorfunc=<SID>TmuxSendKeysToMarkedNormal<CR>g@
vmap <silent> <localleader>ts <ScriptCmd>TmuxSendKeysToMarkedVisual()<CR>

nmap <silent> <localleader>te <ScriptCmd>system('tmux send-keys -t {marked} Enter')<CR>
nmap <silent> <localleader>tc <ScriptCmd>system('tmux send-keys -t {marked} <C-c>')<CR>
nmap <silent> <localleader>td <ScriptCmd>system('tmux send-keys -t {marked} <C-d>')<CR>

# Python
nmap <silent> <localleader>tpi <ScriptCmd>system('tmux send-keys -t {marked} python Enter')<CR>
nmap <silent> <localleader>tpa <ScriptCmd>system('tmux send-keys -t {marked} ". venv/bin/activate"')<CR>

# R
nmap <silent> <localleader>tri <ScriptCmd>system('tmux send-keys -t {marked} R Enter')<CR>

# vim: et sts=4 sw=4
