vim9script

def LspOutCallback(ch: channel, msg: dict<any>)
	echomsg msg
enddef

const job = job_start(['clangd'], {
	in_mode: 'lsp',
	out_mode: 'lsp',
	out_cb: LspOutCallback,
	# err_mode: "raw",
	# err_io: "file",
	# err_name: "khe.log",
})

const response_init = ch_evalexpr(
	job,
	{
		method: 'initialize',
		params: {
			rootUri: 'file://' .. getcwd(),
			rootPath: getcwd(),
		},
	},
	{
		timeout: 10000,
	}
)

if response_init->empty()
	echomsg "keeee"
endif

ch_sendexpr(job, {method: 'initialized'})

var req_version = 1
def LspTagFunction(
		pattern: string,
		flags: string,
		info: dict<string>
		): list<dict<string>>

	const [bufnum, lnum, col, off, curswant] = getcurpos()

	# Send notification 'textDocument/didOpen'
	ch_sendexpr(
		job,
		{
			method: 'textDocument/didOpen',
			params: {
				textDocument: {
					uri: 'file://' .. expand("%:p"),
					version: req_version,
					languageId: 'cpp',
					text: join(getline(1, '$'), "\n"),
				},
			},
		},
		{
			timeout: 10000,
		}
	)
	req_version += 1

	# Send request 'textDocument/definition'
	const response_defs = ch_evalexpr(
		job,
		{
			method: 'textDocument/definition',
			params: {
				textDocument: {
					uri: 'file://' .. expand("%:p"),
				},
				position: {
					line: lnum - 1,
					character: col - 1
				}
			},
		},
		{
			timeout: 10000,
		}
	)

	const res: list<dict<any>> = copy(response_defs.result)
	return mapnew(res,  (_, val): dict<string> => ({
		name: 'lsp',
		filename: val.uri[7 :],
		cmd: 'call cursor('
			.. (val.range.start.line + 1)
			.. ','
			.. (val.range.start.character + 1)
			.. ')',
	}))
enddef

#nnoremap <leader>gd :call <SID>LspGoToDefinition()<CR>
set tagfunc=<SID>LspTagFunction
