let s:start		= '//'

function! s:line(n)
	if a:n == 1
		return s:start . " This file is a part of Akel"
	elseif a:n == 2
		return s:start . " Authors : @" . s:user()
    elseif a:n == 3
		return s:start . " Created : " . s:date()
    elseif a:n == 4
		return s:start . " Updated : " . s:date()
	endif
endfunction

function! s:user()
	if exists('g:userDev')
		return g:userDev
	endif
	let l:user = $USER
	if strlen(l:user) == 0
		let l:user = "unknown"
	endif
	return l:user
endfunction

function! s:date()
	return strftime("%d/%m/%Y")
endfunction

function! s:insert()
	let l:line = 4

	" empty line after header
	call append(0, "")

	" loop over lines
	while l:line > 0
		call append(0, s:line(l:line))
		let l:line = l:line - 1
	endwhile
endfunction

function! s:akupdate()
	if getline(4) =~ s:start . " Updated : "
		if &mod
			call setline(4, s:line(4))
		endif
		return 0
	endif
	return 1
endfunction

function! s:akelheader()
	if s:akupdate()
		call s:insert()
	endif
endfunction

" Bind command and shortcut
command! Akelheader call s:akelheader ()
map <F3> :Akelheader<CR>
autocmd BufWritePre * call s:akupdate ()
