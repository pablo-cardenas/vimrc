function TmuxSendText(text) abort
	call TmuxSendKeys(shellescape(substitute(a:text, '\n$', ' ', '')))
endfunction

function TmuxSendKeys(keys) abort
	call system('tmux send-keys -t {marked} '.a:keys)
endfunction

function TmuxSendNormal(type)
	try
		let a_save = @a
		if a:type == 'line'
			silent exe "normal! '[V']".'"ay'
			call TmuxSendText(@a)
			call TmuxSendKeys("Enter")
		elseif a:type == "char"
			silent exe "normal! `[v`]".'"ay'
			call TmuxSendText(@a)
		endif
	finally
		let @a = a_save
		set operatorfunc=
	endtry
endfunction

function TmuxSendVisual(visualmode)
	try
		let a_save = @a
		silent exe "normal! `<".a:visualmode."`>".'"ay'
		call TmuxSendText(@a)
		if a:visualmode =~ '^V$'
			call TmuxSendKeys("Enter")
		endif
	finally
		let @a = a_save
	endtry
endfunction
