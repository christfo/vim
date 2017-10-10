" if (  has('nvim')  )
" if ( has('Neomake')  )
  let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
  let g:neomake_warning_sign = {
        \   'text': '⚠',
        \   'texthl': 'NeomakeWarningSign',
        \ }
  let g:neomake_message_sign = {
        \   'text': '➤',
        \   'texthl': 'NeomakeMessageSign',
        \ }
  let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

  let g:neomake_cpp_enabled_makers = ['clangtidy']
  let g:neomake_cpp_clangtidy_maker = {
     \ 'exe': 'clang-tidy',
     \ 'args': ['-checks=*' ],
     \}

  augroup neomake_lints
    autocmd! BufWritePost,BufEnter * Neomake
  augroup END
" endif
"
