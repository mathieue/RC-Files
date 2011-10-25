augroup filetypedetect
	au! BufRead,BufNewFile *.rl  set filetype=ragel
	au! BufRead,BufNewFile *.cg  set filetype=cg
	au! BufRead,BufNewFile *.frag,*.vert,*.fp,*.vp,*.glsl set filetype=glsl
augroup END 

if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.module               setfiletype php
augroup END
