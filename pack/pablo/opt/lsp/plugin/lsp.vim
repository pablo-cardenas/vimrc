"function! LspOutCallback(ch, msg) abort
"	" echomsg a:msg
"endfunction
"
"let opts = #{
"\ in_mode: 'lsp', 
"\ out_mode: 'lsp', 
"\ out_cb: function('LspOutCallback'),
"\}
"let s:job = job_start(['clangd'], opts)
"
"let s:req = #{
"\  method: 'initialize',
"\  params: #{
"\    rootUri: 'file://' .. getcwd() ,
"\    rootPath: getcwd(),
"\    trace: "off",
"\  },
"\}
"let s:defs = ch_evalexpr(s:job, s:req, #{timeout: 100})
"if s:defs->empty()
"	echomsg "keeee"
"endif
"
"call ch_sendexpr(s:job, #{method: 'initialized'})
"
"
"let s:version = 1
"function! s:LspTagFunction(pattern, flags, info) abort
"	let [s:bufnum, s:lnum, s:col, s:off] = getpos('.')
"
"	" Send notification 'textDocument/didOpen'
"	let s:req = #{
"	\ method: 'textDocument/didOpen',
"	\ params: #{
"	\   textDocument: #{
"	\     uri: 'file://' .. expand("%:p"),
"	\     version: s:version,
"	\     languageId: 'cpp',
"	\     text: join(getline(1, '$'), "\n"),
"	\   },
"	\ },
"	\}
"	call ch_sendexpr(s:job, s:req)
"
"	" Send request 'textDocument/definition'
"	let s:req = #{
"	\ method: 'textDocument/definition',
"	\ params: #{
"	\   textDocument: #{
"	\     uri: 'file://' .. expand("%:p"),
"	\   },
"	\   position: #{
"	\     line: s:lnum - 1,
"	\     character: s:col - 1
"	\   }
"	\ },
"	\}
"
"	function! ResponseToTaglist(key, val) abort
"		return #{
"		\ name: 'lsp',
"		\ filename: a:val.uri,
"		\ cmd: 'norm! ' .. (a:val.range.start.line + 1) .. 'G0' .. (a:val.range.start.character) .. 'l',
"		\}
"	endfunction
"
"	let s:defs =  ch_evalexpr(s:job, s:req)
"	let s:res = copy(s:defs.result)
"	call map(s:res, function("ResponseToTaglist"))
"	let s:version += 1
"	return s:res
"endfunction
"
""nnoremap <leader>gd :call <SID>LspGoToDefinition()<CR>
"set tagfunc=<SID>LspTagFunction
