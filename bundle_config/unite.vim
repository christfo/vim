" let g:unite_enable_start_insert = 0
" let g:unite_split_rule = "botright"
" let g:unite_force_overwrite_statusline = 0
" let g:unite_winheight = 10

" let g:unite_source_file_mru_long_limit = 5000
" let g:unite_source_directory_mru_long_limit = 5000
" let g:unite_source_history_yank_enable = 1

" call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
"       \ 'ignore_pattern', join([
"       \ '\.git/',
"       \ ], '\|'))

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])

" " nnoremap <C-Q> :<C-u>Unite  -buffer-name=files   -start-insert buffer file_rec/async:!<cr>
" nnoremap <leader>ff :<C-u>Unite  file_mru bookmark <cr>
" nnoremap <leader>la :<C-u>UniteWithCurrentDir  file_rec/async<cr>
" nnoremap <leader>lr :<C-u>UniteWithCurrentDir  file<cr>
" nnoremap <leader>lf :<C-u>UniteWithBufferDir  file<cr>
" nnoremap <leader>lg :<C-u>Unite  grep:$buffers:<cr>
" nnoremap <leader>lj :<C-u>Unite  -buffer-name=buffers buffer -quick-match<cr>
" nnoremap <leader>lp :<C-u>Unite  history/yank <cr>

" autocmd FileType unite call s:unite_settings()


" if executable('ag')
"   " Use ag in unite grep source.
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts =
"         \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
"         \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
"   let g:unite_source_grep_recursive_opt = ''
" elseif executable('ack-grep')
"   " Use ack in unite grep source.
"   let g:unite_source_grep_command = 'ack-grep'
"   let g:unite_source_grep_default_opts =
"         \ '--no-heading --no-color -a -H'
"   let g:unite_source_grep_recursive_opt = ''
" endif

" function! s:unite_settings()
"   let b:SuperTabDisabled=1
"   nmap <buffer> <C-n>   <Plug>(unite_select_next_line)
"   nmap <buffer> <C-p>   <Plug>(unite_select_previous_line)
"   " imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"   " imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"   imap <silent><buffer><expr> <C-_> unite#do_action('split')
"   imap <silent><buffer><expr> <C-\|> unite#do_action('vsplit')
"   imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

"   nmap <buffer> <ESC>   <Plug>(unite_exit)
" endfunction

