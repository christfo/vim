filetype plugin off " We switch it back on again later, but off for pathogen to get a lookin
filetype off

let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'statuslineHighlight' )
call add(g:pathogen_disabled, 'syntastic')
call add(g:pathogen_disabled, 'taghighlight' )
" call add(g:pathogen_disabled, 'supertab' )
call add(g:pathogen_disabled, 'ultisnips' )
call pathogen#helptags() 
call pathogen#runtime_append_all_bundles() 

runtime macros/machit.vim
syntax on
filetype plugin indent on

"colorscheme harlequin
colorscheme molokai
set nocompatible
set t_Co=256
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set ignorecase
set virtualedit=onemore
set hlsearch
set smartcase
set wildmenu
set hidden
set switchbuf=useopen,usetab,newtab
set backspace=indent,eol,start
set cindent shiftwidth=4  " set auto-indenting num columns
set softtabstop=4       " <tab> inserts 2 spaces (etc...)
set cmdheight=2
set laststatus=2
let mapleader=","
set history=5000
set wildmode=list:longest
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp
set undodir=~/.vim-tmp/undodir
set wildignore=*.o,*~,tags
set ttyfast
set hidden
set smarttab
set expandtab
set numberwidth=4
set undofile
set undolevels=1000
set undoreload=10000
set tags=tags

" may want to reconsider this if doing anything but ruby
" set grepprg=rak\ --follow\ --output=\"fn+':'+i.to_s+':'+line\"

" swap tag following shortcuts to show list by default
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" swap tag following shortcuts to show list by default


" make options

" always magic on search
nnoremap / /\v
nnoremap ? ?\v

"add :w!! to write as sudo
cmap w!! %!sudo tee > /dev/null %

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

highlight StatusLine    term=bold,reverse cterm=bold,reverse ctermfg=46  ctermbg=238 gui=bold,reverse guifg=darkgreen guibg=#444444
highlight StatusLineNC  term=reverse                         ctermfg=59 ctermbg=214                  guifg=#857b6f guibg=#444444
"highlight StatusLine    term=bold,reverse cterm=bold,reverse ctermfg=darkgreen  gui=bold,reverse guifg=darkgreen
"highlight StatusLineNC  ctermfg=green  

set statusline=\ %{HasPaste()}%F%m%r%h%w\ %{g:HgStatusForFile()}\ %{fugitive#statusline()}\ \ \ \ \ \ \ \ \ \ \ \ \ \ CWD:\ %r%{CurDir()}%h\ \ \ %=%(%c%V\ \ Line:\ \ %l/%L\ \ %P%)

" highlight Class           
" highlight DefinedName     
" highlight Enumerator      
" highlight Function        
" highlight EnumerationName 
" highlight Member          
" highlight Structure       
" highlight Type            
" highlight Union           
" highlight GlobalConstant  
" highlight GlobalVariable  
" highlight LocalVariable   

" See :help cinoptions-values
:set cino+=g0             " place C++ scope declarations at start of line
:set cino+=t0             " place function return_type decl at start of line
:set cino+=+4             " indent for a continuation line

:set syntax=c.doxygen
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""

" leader cd already taken, so use h insread
let g:VCSCommandMapPrefix='<leader>h'

" Shortcut to fold at left brace
map F zfa}

" Open and close all three plugins at same time
nmap <F8> : TrinityToggleAll<CR>

" Open and close srcExplr, taglist and NERD_tree individually
nmap <F7> : SrcExplToggle<CR>
nmap <F6> : TlistToggle<CR>

let g:SrcExpl_winHeight = 8 

" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100 

" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>" 

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>" 

" // In order to Avoid conflicts, the Source Explorer should know what plugins 
" // are using buffers. And you need add their bufname into the list below 
" // according to the command ":buffers!" 
let g:SrcExpl_pluginList = [ 
	    \ "__Tag_List__", 
	    \ "_NERD_tree_", 
	    \ "Source_Explorer" 
	    \ ] 

" // Enable/Disable the local definition searching, and note that this is not 
" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
" // It only searches for a match with the keyword according to command 'gd' 
let g:SrcExpl_searchLocalDef = 1 

" // Let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 1 

" // Use program 'ctags' with argument  '--sort=foldcase -R' to create or 
" // update a tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 

" // Set "<F12>" key for updating the tags file artificially 
" let g:SrcExpl_updateTagsKey = "<F12>"

set completeopt+=longest
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" inoremap <silent><CR>  <C-R>=neocomplcache#smart_close_popup()<CR><CR>
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 0
let  g:neocomplcache_snippets_dir='~/.vim/bundle/snippets'
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" :  pumvisible() ? "\<C-n>" : "\<TAB>"
imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
smap  <tab>  <right><plug>(neocomplcache_snippets_jump) 
inoremap <expr><c-e>     neocomplcache#complete_common_string()

nmap <C-H>  <C-W>h
nmap <C-J>  <C-W>j
nmap <C-K>  <C-W>k
nmap <C-L>  <C-W>l

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

 " map <End> to move to end of line
 " if at end of line, move to end of window
 " if at end of window, move to end of file
 nnoremap <silent> <End> :call SmartEnd("n")<CR>
 inoremap <silent> <End> <C-O>:call SmartEnd("i")<CR>
 vnoremap <silent> <end> <esc>:call smartend("v")<cr>
 function!  SmartEnd(mode)
   if col('.') < col('$')-1
     normal! $
   elseif  winline() < winheight(0) - &scrolloff 
     normal! m`L$
   else
     normal! m`G$
   endif
   if a:mode == "v"
     normal! msgv`s
   endif
 endfun


" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>
 
:let ruby_operators = 1
:let ruby_minlines = 100

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_gobal = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

nmap <silent> <leader>` :QFix<CR>

" Diff with saved version of the file
function! s:DiffWithSaved()
    let g:diffline = line('.') 
    let filetype=&ft
    diffthis
    vnew | r # | :exe "normal! ".g:diffline."G"
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
    let g:diffbuf = bufname('%') 
endfunction
com! DiffSaved call s:DiffWithSaved()

function! s:DiffWithSavedOff()
    if exists("g:diffbuf")
        " exe "norm! ".g:diffbuf."G"
        echom g:diffbuf
        unlet g:diffbuf
    end
    exe "q"
    diffoff
    if exists("g:diffline")
        exe "norm! ".g:diffline."G"
        unlet g:diffline
    end
endfunction
com! DiffSavedOff call s:DiffWithSavedOff()
" command DiffOrig let g:diffline = line('.') | vert new | set bt=nofile | r # | 0d_ | diffthis | :exe "norm! ".g:diffline."G" | wincmd p | diffthis | wincmd p

let g:LustyJugglerAltTabMode=1
map 0 ^
nnoremap <Leader>do :DiffSaved<cr>
nnoremap <leader>dc :DiffSavedOff<cr>
nnoremap <leader>tp  :set invpaste<cr>
nnoremap <leader><Leader>  :noh<cr>
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>fd :cfile ./autotest.txt<cr> :compiler rubyunit<cr>
nnoremap <leader>co :cclose<cr>:cfile<up><cr>:copen<cr> 


let MRU_Max_Entries = 400
map <Leader>f :MRU<CR>


nnoremap dg do
call arpeggio#map('i',  's', 0, 'jk', '<Esc>')
"call arpeggio#map('n',  's', 0, 'tp', ':set invpaste<CR>')
call arpeggio#map('in',  's', 0, '[q', '<Esc>:cp<CR>i')
call arpeggio#map('in',  's', 0, ']q', '<Esc>:cn<CR>i')
call arpeggio#map('n',  's', 0, 'tw', '<Esc>:tabclose<CR>')
call arpeggio#map('i',  's', 0, 'w=', '<Esc><c-w>=i')
call arpeggio#map('n',  's', 0, 'w=', '<c-w>=')
call arpeggio#map('i',  's', 0, '[t', '<Esc>:tabp<CR>i')
call arpeggio#map('i',  's', 0, ']t', '<Esc>:tabn<CR>i')
call arpeggio#map('n',  's', 0, '[t', ':tabp<CR>')
call arpeggio#map('n',  's', 0, ']t', ':tabn<CR>')
call arpeggio#map('in', 's', 0, 'ma', '<Esc>:wa<CR>:make<Up><CR>')
call arpeggio#map('n', 's', 0, 'yr', ':YRShow<CR>')
call arpeggio#map('n', 's', 0, 'lp', ':LustyJugglePrevious<CR>')
call arpeggio#map('n', 's', 0, 'l;', ':LustyJuggler<CR>')
call arpeggio#map('n', 's', 0, 'lr', ':LustyFilesystemExplorerFromHere<CR>')
call arpeggio#map('n', 's', 0, 'lf', ':LustyFilesystemExplorer<CR>')
call arpeggio#map('n', 's', 0, 'lb', ':LustyBufferExplorer<CR>')
call arpeggio#map('n', 's', 0, 'lg', ':LustyBufferGrep<CR>')
call arpeggio#map('n',  's', 0, 'wf', '<c-w>F')
call arpeggio#map('n',  's', 0, 'co', ':copen<CR>:cfile<Up><CR>')
call arpeggio#map('n',  '', 0, 'ta', ':Tabularize /')
call arpeggio#map('n',  's', 0, 'du', ':diffupdate<CR>')
call arpeggio#map('n',  's', 0, 'do', ':DiffSaved<CR>')
call arpeggio#map('n',  's', 0, 'dc', ':DiffSavedOff<CR>')

 
 
" :set completeopt+=longest,menuone
" " :let g:SuperTabDefaultCompletionType = 'context'
" " :let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
:let g:SuperTabLongestEnhanced = 1
:let g:SuperTabCrMapping = 0

" " SuperTab {
"     " let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"     let g:SuperTabCompletionContexts = ['s:ContextDiscover', 's:ContextText']
"     let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
"     let g:SuperTabContextDiscoverDiscovery =
"         \ ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-u>"]
"     let g:SuperTabMappingForward = '<tab>'
"     let g:SuperTabMappingBackward = '<s-tab>'
"     " let g:SuperTabMappingForward = '<c-j>'
"     " let g:SuperTabMappingBackward = '<c-k>'
" " }

nnoremap <F5> :GundoToggle<CR>
" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})

" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end

  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0

  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end

  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"

  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')

  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec

      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end

  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end

  echo msg
  let @"=reg_saved
endfunction

" call WatchForChanges('*')


