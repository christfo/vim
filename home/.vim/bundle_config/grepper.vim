let g:grepper = { 'tools':  ['rg', 'ag', 'git'] }
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
nnoremap  <leader>*  :Grepper -tool rg -cword -noprompt -noswitch<cr>


