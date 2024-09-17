let s:start		= '//'

function! s:line(n)
	if a:n == 1
		return s:start . " Copyright (C) 2024 kbz_8 ( contact@kbz8.me )"
    elseif a:n == 2
		return s:start . " This file is a part of Akel"
	elseif a:n == 3
		return s:start . " For conditions of distribution and use, see copyright notice in LICENSE"
	endif
endfunction

function! s:insert()
	let l:line = 3

	" empty line after header
	call append(0, "")

	" loop over lines
	while l:line > 0
		call append(0, s:line(l:line))
		let l:line = l:line - 1
	endwhile
endfunction

function! s:akelheader()
	call s:insert()
endfunction

" Bind command and shortcut
command! Akelheader call s:akelheader ()
map <F3> :Akelheader<CR>
