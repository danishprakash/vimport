function! Vimport(path)
	echo a:path
	let saved_position = getpos(".")
	execute "normal! ggOimport " . a:path . "\<esc>"
	call setpos('.', saved_position)
	" move down one line and back in insert mode to continute editing
	" execute "normal! ji"
endfunction

command! -nargs=1 Vimport call Vimport(<f-args>)

function! Vimdrop(path)
	let saved_position = getpos(".")
	call setpos('.', saved_position)
endfunction

command -nargs=1 Vimdrop call Vimdrop(<q-args>)
