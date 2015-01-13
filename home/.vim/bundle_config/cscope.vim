nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>    "   's'   symbol: find all references to the token under cursor         
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>    "   'g'   global: find global definition(s) of the token under cursor    
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>    "   'c'   calls:  find all calls to the function name under cursor       
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>    "   't'   text:   find all instances of the text under cursor            
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>    "   'e'   egrep:  egrep search for the word under cursor                 
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>    "   'f'   file:   open the filename under cursor                         
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>  "   'i'   includes: find files that include the filename under cursor
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>    "   'd'   called: find functions that function under cursor calls        

if filereadable("cscope.out")
  cs add cscope.out
endif
set cscopetag
set cscopeverbose
set csto=0

