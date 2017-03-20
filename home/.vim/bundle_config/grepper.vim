nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nnoremap <leader>* :Grepper -tool rg -cword -noprompt -noswitch<cr>
let g:grepper={ 'tools':  ['rg', 'ag', 'git'] }
" commmand! -nargs=+  rg  :Grepper -tool rg -noprompt -noswitch <args>
cnoreabbrev <expr> rg ((getcmdtype() is# ':' && getcmdline() is# 'rg')?('Grepper -tool rg -nojump -query '):('rg'))




