let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap   <silent><CR>  <c-r>=neocomplcache#smart_close_popup()<cr><cr>
inoremap   <expr><C-g>   pumvisible() ? neocomplcache#undo_completion() : "\<c-g>"
inoremap   <expr><C-l>   neocomplcache#complete_common_string()
inoremap   <expr><C-h>   neocomplcache#smart_close_popup()."\<C-h>"
inoremap   <expr><BS>    neocomplcache#smart_close_popup()."\<C-h>"
inoremap   <expr><C-y>   neocomplcache#close_popup()
inoremap   <expr><C-e>   pumvisible() ? neocomplcache#smart_close_popup() : "\<c-o>h\<c-o>e\<c-o>l"

" imap       <expr><TAB>   neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? neocomplcache#complete_common_string()."\<C-n>" : "\<TAB>"
" imap       <expr><s-TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? neocomplcache#complete_common_string()."\<C-p>" : "\<s-TAB>"
imap       <expr><TAB>    pumvisible() ? neocomplcache#complete_common_string()."\<C-n>" : "\<TAB>"
imap       <expr><s-TAB>  pumvisible() ? neocomplcache#complete_common_string()."\<C-p>" : "\<s-TAB>"
imap       <C-k>          <Plug>(neocomplcache_snippets_expand) 
smap       <C-k>          <Plug>(neocomplcache_snippets_expand) 

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

