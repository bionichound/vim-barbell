function! s:GetUrl()
	let curline = getline('.')
	call inputsave()
	let url = input('Enter url: ')
	call inputrestore()
	redraw
	echo system("echo 'Sending request to " . url . "'")
	return url
endfunction

function! barbell#PostJson(...) range
	let n = @n
	silent! normal gv"ny
	let url = s:GetUrl()
	echo system("curl -X POST '" . url . "' -H 'Content-Type: application/json' -d '" . @n . "'")
	let @n = n
endfunction
