" Arrows
nnoremap h       :echo "Use \<C-h\>"<CR>
nnoremap l       :echo "Use \<Space\>"<CR>
nnoremap j       :echo "Use +"<CR>
nnoremap k       :echo "Use -"<CR>
nnoremap e       :echo "Use ge"<CR>
nnoremap b       :echo "Use ge"<CR>
nnoremap $       :echo "Use g$ or g_"<CR>
nnoremap ^       :echo "Use g^ or g0"<CR>
nnoremap 0       :echo "Use g0 or g^"<CR>
nnoremap _       :echo "Use g0 or g^"<CR>
nnoremap r       :echo "Use gr"<CR>
nnoremap R       :echo "Use gR"<CR>
nnoremap ~       :echo "Use g~"<CR>
nnoremap *       :echo "Use g*"<CR>
nnoremap #       :echo "Use g#"<CR>
nnoremap zb      :echo "Use z-"<CR>
nnoremap zt      :echo "Use z\<CR\>"<CR>
nnoremap zz      :echo "Use z."<CR>
nnoremap <C-b>   :echo "Use z^"<CR>
nnoremap <C-f>   :echo "Use z+"<CR>
nnoremap <C-u>   :echo "Use z^z. or Hz."<CR>
nnoremap <C-d>   :echo "Use z+z. or Lz."<CR>
nnoremap <Left>  :echo "Use \<C-h\>"<CR>
nnoremap <Right> :echo "Use \<Space\>"<CR>
nnoremap <Up>    :echo "Use -"<CR>
nnoremap <Down>  :echo "Use +"<CR>
nnoremap <BS>    :echo "Use \<C-h\>"<CR>
vnoremap <Left>  :<C-u>echo "Use \<C-h\>"<CR>gv
vnoremap <Right> :<C-u>echo "Use \<Space\>"<CR>gv
vnoremap <Up>    :<C-u>echo "Use -"<CR>gv
vnoremap <Down>  :<C-u>echo "Use +"<CR>gv
vnoremap h       :<C-u>echo "Use \<C-h\>"<CR>gv
vnoremap l       :<C-u>echo "Use \<Space\>"<CR>gv
vnoremap j       :<C-u>echo "Use +"<CR>gv
vnoremap k       :<C-u>echo "Use -"<CR>gv
vnoremap <BS>    :<C-u>echo "Use \<C-h\>"<CR>gv
inoremap <Left>  <C-o>:echo "Use \<C-h\>"<CR>
inoremap <Right> <C-o>:echo "Use \<Space\>"<CR>
inoremap <Up>    <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-o>:echo \"Use -\"\<lt>CR>"<CR>
inoremap <Down>  <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-o>:echo \"Use +\"\<lt>CR>"<CR>
inoremap <BS>    <C-o>:echo "Use \<C-h\>"<CR>
cnoremap <BS>    <NOP>
cnoremap <C-p>   <C-U>:echo "Use \<C-f\>"<CR>
cnoremap <C-n>   <C-U>:echo "Use \<C-f\>"<CR>
cnoremap <Up>    <C-U>:echo "Use \<C-f\>"<CR>
cnoremap <Down>  <C-U>:echo "Use \<C-f\>"<CR>

" Windows
nnoremap <C-W><C-W> <NOP>

" Jumps
nnoremap <C-O> <NOP>
nnoremap <C-I> <NOP>

" Commands
cabbrev wq echo 'Use ZZ'
cabbrev q! echo 'Use ZQ'
cabbrev q echo 'Use ZQ'
cabbrev w echo 'Use up'

" Visual
map v :echo 'Use marks'<CR>
map V :echo 'Use marks'<CR>
" map <C-V> <NOP>

" Registers
for s:i in ['_','"','*','+','~','-','.',':','%','#','/','=','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    for s:j in ["p","P","y","Y","c","C","d","D"]
        execute 'nnoremap ' . s:j . ' :echo "Use registers instead of ' . s:j . '"<CR>'
        execute 'nnoremap "' . s:i . s:j . ' "' . s:i . s:j
        execute 'vnoremap ' . s:j . ' :<C-U>echo "Use registers instead of ' . s:j . '"<CR>'
        execute 'vnoremap "' . s:i . s:j . ' "' . s:i . s:j
    endfor
    for s:j in ["yy","cc","dd"]
        execute 'nnoremap ' . s:j . ' :echo "Use registers instead of ' . s:j . '"<CR>'
        execute 'nnoremap "' . s:i . s:j . ' "' . s:i . s:j
    endfor
endfor


function! SwitchReadOnly() abort
	if &modifiable
		setlocal nomodifiable
		nnoremap <buffer> - :echo "Use \<C-y\>"<CR>
		nnoremap <buffer> + :echo "Use \<C-e\>"<CR>
		nnoremap <buffer> <CR> :echo "Use \<C-e\>"<CR>
		nnoremap <buffer> { :echo "Use z^z. or Hz."<CR>
		nnoremap <buffer> } :echo "Use z+z. or Lz."<CR>
		nnoremap <buffer> <C-p> :echo "Use \<C-y\>"<CR>
		nnoremap <buffer> <C-n> :echo "Use \<C-e\>"<CR>
		nnoremap <buffer> <Space> :echo "Use zl"<CR>
		nnoremap <buffer> <C-h> :echo "Use zh"<CR>
		nnoremap <buffer> w :echo "Use zL"<CR>
		nnoremap <buffer> ge :echo "Use zH"<CR>
		nnoremap <buffer> g0 :echo "Use zL"<CR>
		nnoremap <buffer> g$ :echo "Use zH"<CR>
	else
		setlocal modifiable
		nunmap <buffer> -
		nunmap <buffer> +
		nunmap <buffer> <CR>
		nunmap <buffer> {
		nunmap <buffer> }
		nunmap <buffer> <C-p>
		nunmap <buffer> <C-n>
		nunmap <buffer> <Space>
		nunmap <buffer> <C-h>
		nunmap <buffer> w
		nunmap <buffer> ge
		nunmap <buffer> g0
		nunmap <buffer> g$
	endif
endfunction

command M call SwitchReadOnly()

autocmd BufReadPost *
    \  setlocal nomodifiable
    \|  if !&modifiable
    \|   nnoremap <buffer> - :echo "Use \<C-y\>"<CR>
    \|   nnoremap <buffer> + :echo "Use \<C-e\>"<CR>
    \|   nnoremap <buffer> <CR> :echo "Use \<C-e\>"<CR>
    \|   nnoremap <buffer> <C-p> :echo "Use \<C-y\>"<CR>
    \|   nnoremap <buffer> <C-n> :echo "Use \<C-e\>"<CR>
    \|   nnoremap <buffer> <C-n> :echo "Use \<C-e\>"<CR>
    \|   nnoremap <buffer> { :echo "Use z^z. or Hz."<CR>
    \|   nnoremap <buffer> } :echo "Use z+z. or Lz."<CR>
    \|   nnoremap <buffer> <Space> :echo "Use zl"<CR>
    \|   nnoremap <buffer> <C-h> :echo "Use zh"<CR>
    \|   nnoremap <buffer> w :echo "Use zL"<CR>
    \|   nnoremap <buffer> ge :echo "Use zH"<CR>
    \|   nnoremap <buffer> g0 :echo "Use zH"<CR>
    \|   nnoremap <buffer> g$ :echo "Use zL"<CR>
    \| endif
