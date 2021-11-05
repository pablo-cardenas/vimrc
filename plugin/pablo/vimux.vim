" Run the current file with rspec
map <Leader>vo :call VimuxOpenRunner<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>v<C-c> :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

" Clear the terminal screen of the runner pane
map <Leader>v<C-l> :VimuxClearTerminalScreen<CR>

function! VimuxSlimeNormal()
 call VimuxSendText(getline('.'))
 call VimuxSendKeys("Enter")
endfunction

function! VimuxSlimeVisual()
 call VimuxSendText(@v)
 call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <LocalLeader>vs "vy :call VimuxSlimeVisual()<CR>

" Select current paragraph and send it to tmux
nmap <LocalLeader>vs :call VimuxSlimeNormal()<CR>j
