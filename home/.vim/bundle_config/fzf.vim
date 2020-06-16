
" call fzf#vim#ag(expand('<cword>'))
" call fzf#vim#tags(expand('<cword>'))

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" nnoremap <leader>t :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<CR>
nnoremap <c-8> :call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(expand('<cword>')), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
nnoremap <leader>t :call fzf#vim#tags(expand('<cword>'), {'options': '--preview ''' . cf_pr . ''''})<cr>


" command! -bang -nargs=* FindEmpty call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" ', 1, <bang>0).'| tr -d "\017"', 1, <bang>0)


" command! -bang -nargs=* Rrr
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(expand('<cword>')), 1,
"   \   'options': ['--preview', 'bat {}']
"   \   <bang>0)

command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always \\b'.shellescape(expand('<cword>')).'\\b', 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 1,4..'}, 'right:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 1,4..'}, 'right:50%', '?'),
  \   <bang>0)

command! -bang -nargs=* FindWord
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 1,4..'}, 'right:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 1,4..'}, 'right:50%', '?'),
  \   <bang>0)

command! -bang -nargs=+ -complete=dir FindWordNew
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 1,4..'}, 'right:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 1,4..'}, 'right:50%', '?'),
  \   <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" nnoremap <c-8> :call fzf#vim#grep('rg --column --line-number --no-heading --color=always '.shellescape(expand('<cword>')), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(expand('<cword>')), 1, <bang>0).'| tr -d "\017"', 1, <bang>0)
let g:fzf_layout = { 'up': '~50%' }
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all,ctrl-d:page-down,ctrl-u:page-up'

let g:fzf_filemru_colors = {}

nnoremap <leader>* :Find<cr>
cnoreabbrev <expr> rg ((getcmdtype() is# ':' && getcmdline() is# 'rg')?('FindWord '):('rg'))

function! s:edit_at(line)
  let l:file = substitute(a:line, '^\([^:]*\):.*', '\1', "")
  let l:num = substitute(a:line, '[^:]*:\([^:]*\):.*', '\1', "")
  execute "edit +".l:num." ".fnameescape(l:file)
endfunction
command! -bang -nargs=? -complete=dir Errors
      \ call fzf#run(fzf#vim#with_preview(fzf#wrap({
           \'source': 'sed -e "s/^.*file=\(.\+\) line=\([^ ]\+\) /\1:\2:Message - /; s/^logging.js:.*full_session_id=[^ ]* *\([^ ]*\) .*\/\([^:]*\):\([^:]*\):/safeview\/monitor\/\2:\3:\1/" build.out', 
           \'options': '--reverse --no-sort',
           \'sink': function('s:edit_at')})))
nnoremap <leader>vo  :Errors<cr>

           "\'source': "sed -e 's/^.*file=\\(.\\+\\) line=\\([^ ]\\+\\) /\\1:\\2:Message - /' build.out", 

" command! FZFMru call fzf#run({
" \  'source':  v:oldfiles,
" \  'sink':    'e',
" \  'options': '-m -x +s',
" \  'down':    '40%'})

" command! FZFMru call fzf#run({
" \ 'source':  reverse(s:all_files()),
" \ 'sink':    'edit',
" \ 'options': '-m -x +s',
" \ 'down':    '40%' })

" function! s:all_files()
"   return extend(
"   \ filter(copy(v:oldfiles),
"   \        "v:val !~ 'fugitive\\|NERD_tree\\|^/tmp/\\|.git/'"),
"   \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
" endfunction

" Add your path here.
let plugins_dir='~/.vim/bundle/' 

" Send file address and line number to fzf.vim's preview script
let preview_file = plugins_dir . "/fzf.vim/bin/preview.sh"
let show_preview = 'FILE=;LINE=;F={};for word in $F;do if [ -n "$word" ] & [ "$word" -eq "$word" ] 2>/dev/null;then LINE=$word;break;fi;FILE=$word;done;echo $FILE:$LINE | xargs -I {} ' . preview_file . '  {}'
let cf_pr = 'FILE={2};LINE={};LINE=${LINE//	/ };LN1=${LINE#*line:};LN=${LN1%% *}; ~/.vim/bundle/fzf.vim/bin/preview.sh  $FILE:$LN'
let cf_pr2 = 'FILE={2};LINE={3};LINE=${LINE//	/ };LN1=${LINE#*line:};LN=${LN1%% *}; ~/.vim/bundle/fzf.vim/bin/preview.sh  $FILE:$LN'

command! -bang -nargs=? Tags call fzf#vim#tags(<q-args>, {'options': '--preview ''' . cf_pr . ''''}, <bang>0)
command! -bang -nargs=? Lines call fzf#vim#lines(<q-args>, {'options': '--nth 1.. --layout=reverse --preview ''' . cf_pr2 . ''''}, <bang>0)


call arpeggio#map('n', 's', 0, 'kt', ":call fzf#vim#tags(expand('<cword>'), {'options': '--preview ''' . cf_pr . ''''})<cr> ")

