function! Vimport(path)
	let saved_position = getpos('.')
	let import_path = eval('a:path')
	normal! ggO<C-[>
	" call append(import_path)
	call setpos('.', saved_position)
endfunction

command! -nargs=1 Vimport call Vimport(<q-args>)

