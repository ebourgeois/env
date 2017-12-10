if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
	autocmd! BufNewFile,BufRead *.pl       setfiletype perl
	autocmd! BufNewFile,BufRead *.pm       setfiletype perl
	autocmd! BufNewFile,BufRead *.cgi      setfiletype perl
	autocmd! BufNewFile,BufRead *.conf     setfiletype html
	autocmd! BufNewFile,BufRead *.tmpl     setfiletype html
	autocmd! BufNewFile,BufRead *.html?    setfiletype html
	autocmd! BufNewFile,BufRead *.tex      setfiletype latex
	autocmd! BufNewFile,BufRead *.twiki    setfiletype twiki
	autocmd! BufNewFile,BufRead *.json     setfiletype javascript
	autocmd! BufNewFile,BufRead *.js       setfiletype javascript
	autocmd! BufNewFile,BufRead tmux.conf  setfiletype tmux
	autocmd! BufNewFile,BufRead .tmux.conf setfiletype tmux 
augroup END
runtime! ftdetect/*.vim
