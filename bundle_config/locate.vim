let g:locate_very_magic=1
let g:locate_mappings=0
let g:locate_smartcase=1
let g:locate_smart_case=1
nnoremap <silent> gw :call locate#cword(0)<cr>
xnoremap <silent> gw :call locate#selection(0)<cr>
nnoremap <silent> gW :call locate#cword(1)<cr>
xnoremap <silent> gW :call locate#selection(1)<cr>

