function! s:GetUrl()
	let curline = getline('.')
	call inputsave()
	let url = input('Enter url: ')
	call inputrestore()
	redraw
	echo system("echo 'Sending request to " . url . "'")
	return url
endfunction

" MakeRequest executes a cURL command
function! barbell#MakeRequest(method, url, headers=[], body='') abort
	let l:args = []
	if a:method == 'POST'
		let l:args = [
			\"curl -X",
			\a:method,
			\"'" . a:url . "'",
			\join(a:headers, " "),
			\"-d '" . a:body . "'",
		\]
	else
		let l:args = [
			\"curl -X",
			\a:method,
			\"'" . a:url . "'",
			\join(a:headers, " "),
		\]
	endif
	echo system(join(l:args, " "))
endfunction

function! barbell#GetJson(...)
	let l:headers = [
		\"-H 'Accept: application/json'",
	\]
	let l:url = s:GetUrl()
	call barbell#MakeRequest('GET', l:url, l:headers)
endfunction

function! barbell#PostJson(...) range
	let l:headers = [
		\"-H 'Accept: application/json'",
		\"-H 'Content-Type: application/json'",
	\]
	let n = @n

	" Extract visual selection as payload
	silent! normal gv"ny

	let l:url = s:GetUrl()
	call barbell#MakeRequest('POST', l:url, l:headers, @n)

	" Reset register
	let @n = n
endfunction
