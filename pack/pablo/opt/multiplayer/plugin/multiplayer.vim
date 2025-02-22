vim9script

# # Create a channel log so we can see what happens.
# ch_logfile('logfile', 'w')

# var shell_job: job

# # Function handling a line of text that has been typed.
# def TextEntered(text: string)
  # # Send the text to a shell with Enter appended.
  # ch_sendraw(shell_job, text .. "\n")
# enddef

# # Function handling output from the shell: Add it above the prompt.
# def GotOutput(channel: channel, msg: string)
  # append(line("$") - 1, "- " .. msg)
# enddef

# # Function handling the shell exits: close the window.
# def JobExit(job: job, status: number)
  # quit!
# enddef

# # Start a shell in the background.
# shell_job = job_start(["/bin/sh"], {
			 # out_cb: GotOutput,
			 # err_cb: GotOutput,
			 # exit_cb: JobExit,
			 # })

# new
# set buftype=prompt
# var buf = bufnr('')
# prompt_setcallback(buf, TextEntered)
# prompt_setprompt(buf, "shell command: ")

# # start accepting shell commands
# startinsert

# function! multiplayer#Connect()
# 	let s:buf_file = expand('%:p')
# 	call system('mkfifo /tmp/vim_shared_pipe_' . getpid())
# 	let s:shared_job = job_start('tail -f /tmp/vim_shared_pipe_' . getpid(), {"out_cb": function("s:HandlerOut"), "out_mode": "json"})
# 	autocmd! TextChanged,TextChangedI * call <SID>TextChanged()
# 	autocmd VimLeave * call <SID>Disconnect()
# endfunction

# function! s:TextChanged()
# 	let content = getline(1, '$')
# 	echomsg "TextChanged: " content
# 	sleep 1
# 	echomsg ""
# 	call writefile(content, expand('%:p'))
# 	call <SID>Broadcast(join(content, "\n"))
# endfunction

# function! s:Broadcast(data)
# 	let all_pipes = split(globpath('/tmp', 'vim_shared_pipe_*'), '\n')
# 	for pipe in all_pipes
# 		let mtch = matchlist(pipe, '.*vim_shared_pipe_\(.*\)')
# 		if len(mtch) >= 2 && mtch[1] != getpid()
# 			echomsg "mandando: " shellescape(a:data)
# 			sleep 1
# 			echomsg ""
# 			call system('echo ' . shellescape(a:data) . ' >' . pipe)
# 		endif
# 	endfor
# endfunction

# function! s:HandlerOut(channel, msg)
# 	echomsg "HandlerOut: " a:msg
# 	sleep 1
# 	echomsg ""
# 	call setline(1, split(a:msg, "\n"))
# endfunction

# function! s:Disconnect()
# 	call job_stop(s:shared_job)
# 	call delete('/tmp/vim_shared_pipe_' . getpid())
# endfunction

# command! -nargs=0 MultiplayerConnect call multiplayer#Connect()
