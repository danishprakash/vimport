" Import at top level 
function! Vimport(path)
	echo a:path
	let saved_position = getpos(".")
	let saved_position[1] = saved_position[1] + 1
	let saved_position[2] = saved_position[2] + 1
	execute "normal! ggOimport " . a:path . "\<esc>"
	call setpos('.', saved_position)
	execute "startinsert"
endfunction

command! -nargs=1 Vimport call Vimport(<f-args>)


" Drop an import using pattern matching
function! Vimdrop(path)
	let saved_position = getpos(".")
	execute "normal! gg/import " . a:path . "\<CR>\<S-V>\<S-D>k"
	call setpos('.', saved_position)
endfunction

command! -nargs=1 Vimdrop call Vimdrop(<f-args>)
