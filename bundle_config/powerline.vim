
function! CurDir()
  let curdir = getcwd()
  return curdir
endfunction

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  else
    return ''
  endif
endfunction

let g:Powerline_symbols = 'fancy'
set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.
set statusline+=\    " Space.
set statusline+=%#redbar#                " Highlight the following as a warning.
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*                           " Reset highlighting.
set statusline+=%=   " Right align.
" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ft}                        " Type (python).
set statusline+=)
" Line and column position and counts.
set statusline+=\ (L%l\/%L,\ C%03c)


