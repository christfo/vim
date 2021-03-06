function! PasteWindow(direction) "{{{
  if exists("g:yanked_buffer")
    if a:direction == 'edit'
      let temp_buffer = bufnr('%')
    endif
    exec a:direction . " +buffer" . g:yanked_buffer
    if a:direction == 'edit'
      let g:yanked_buffer = temp_buffer
    endif
  endif
endf "}}}
 
 "yank/paste buffers
:nmap <silent> <leader>wy  :let g:yanked_buffer=bufnr('%')<cr>
:nmap <silent> <leader>wd  :let g:yanked_buffer=bufnr('%')<cr>:q<cr>
:nmap <silent> <leader>wp  :call PasteWindow('edit')<cr>
:nmap <silent> <leader>wh  :call PasteWindow('split')<cr>
:nmap <silent> <leader>w_  :call PasteWindow('split')<cr>
:nmap <silent> <leader>wv  :call PasteWindow('vsplit')<cr>
:nmap <silent> <leader>w<pipe>  :call PasteWindow('vsplit')<cr>
:nmap <silent> <leader>wt  :call PasteWindow('tabnew')<cr>




