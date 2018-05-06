function! Vimport(path)
	echo a:path
	let saved_position = getpos('.')
	let import_path = eval('a:path')
	normal! ggO
	normal! <cr>
	normal! I<a:path>
	" call append(import_path)
	call setpos('.', saved_position)
endfunction

command! -nargs=1 Vimport call Vimport(<f-args>)

function! Vimdrop(path)
	let saved_position = getpos('.')
	call setpos('.', saved_position)
endfunction

command -nargs=1 Vimdrop call Vimdrop(<q-args>)

