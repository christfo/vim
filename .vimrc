filetype plugin off " We switch it back on again later, but off for pathogen to get a lookin
filetype off
call pathogen#helptags() 
call pathogen#runtime_append_all_bundles() 

runtime macros/machit.vim

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
:set nocompatible

" Folding is interesting, see :help fold-manual
"  e.g. :set foldcolumn=4
"
" allow backspacing over everything in insert mode
:set backspace=indent,eol,start

":set autoindent          " always set autoindenting on
:set t_Co=256
colorscheme harlequin
:set showcmd             " display incomplete commands
:set incsearch           " do incremental searching
:set cindent shiftwidth=4  " set auto-indenting num columns
:set softtabstop=4       " <tab> inserts 2 spaces (etc...)

" Switch on highlighting the last used search pattern.
:set hlsearch
:set switchbuf=useopen,usetab,newtab

"add :w!! to write as sudo
cmap w!! %!sudo tee > /dev/null %

" Switch on syntax highlighting
:syn on
:map zz :set syntax=cpp<CR>
:map zg :set syntax=gnuplot<CR>
":map zm :set makeprg=/usr/bin/make<CR>


" fix meta-keys which generate <Esc>a .. <Esc>z
"let c='a'
"while c <= 'z'
"    exec "set <M-".toupper(c).">=\e".c
"    exec "imap \e".c." <M-".toupper(c).">"
"    let c = nr2char(1+char2nr(c))
"endw
"map <m-a> ggVG

" 'Command line' is 2 lines long
:set ch=2

" Only do this part when compiled with support for autocommands.
syntax on
filetype on

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

endif " has("autocmd")
"
" See :help cinoptions-values
:set cino+=g0             " place C++ scope declarations at start of line
:set cino+=t0             " place function return_type decl at start of line
:set cino+=+4             " indent for a continuation line

runtime macros/mmatchit.vim
set hidden
let mapleader=","
set history=5000
set wildmenu
set wildmode=list:longest
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp

" make options
:set tags=tags
":set makeprg=/usr/local/bin/gmake
":set makeprg=/usr/local/bin/jam 


:set syntax=c.doxygen
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""

" Shortcut to fold at left brace
map F zfa}

if v:version > 700
  ":set ruler               " show the cursor position all the time
  "set cursorline
  au CursorHold,CursorHoldI *  set cul showmatch
  au CursorMoved,CursorMovedI * if &cul | set nocul noshowmatch | endif
  set updatetime=200
  "hi Cursorline ctermbg=Red guibg=#771c1c
  "call ExpertCursorSlowDown(now)
endif

" Open and close all three plugins at same time
nmap <F8> : TrinityToggleAll<CR>

" Open and close srcExplr, taglist and NERD_tree individually
nmap <F7> : SrcExplToggle<CR>
nmap <F6> : TlistToggle<CR>
nmap <F5> : NERDTreeToggle<CR>

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

nmap <C-H>  <C-W>h
nmap <C-J>  <C-W>j
nmap <C-K>  <C-W>k
nmap <C-L>  <C-W>l

noremap <M-b> :TSelectBuffer<cr>
inoremap <M-b> <c-o>:TSelectBuffer<cr>

 " map <End> to move to end of line
 " if at end of line, move to end of window
 " if at end of window, move to end of file
 nnoremap <silent> <End> :call SmartEnd("n")<CR>
 inoremap <silent> <End> <C-O>:call SmartEnd("i")<CR>
 vnoremap <silent> <End> <Esc>:call SmartEnd("v")<CR>
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

" set errorformat=%f:%l:%c:%m,%f:kk%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m,\"%f\"\\\,\ line\ %l.%c:%m\,\ %f:%l:%m,%f:%l:%c:%m
" first, enable status line always
set laststatus=2

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

" gcc
" set errorformat=%f:%l:\ %m
" set errorformat+=%f:%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m
" insert sw spaces when using tab in front of a line
set smarttab

" insert tabs as spaces
set expandtab

" lusty stuff
set wildignore=*.o,*~,tags
set hidden

" toggles the quickfix window.
" let g:jah_Quickfix_Win_Height= 10
" command -bang -nargs=? QFix call QFixToggle(<bang>0)
" function! QFixToggle(forced)
"   if exists("g:qfix_win") && a:forced == 0
"     cclose
"     "call SrcExplToggle()
"   else
"     execute "copen " . g:jah_Quickfix_Win_Height
"   endif
" endfunction
" 
" used to track the quickfix window
" augroup QFixToggle
"  autocmd!
"  autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
"  autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
" augroup END

nmap <silent> <leader>` :QFix<CR>

" Use ruby style regex from
" https://github.com/othree/eregex.vim/tree/master/plugin
"nnoremap / :M/
"nnoremap ? :M?
"nnoremap ,/ :M/
"nnoremap ,? :M?

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
hi User1 term=underline cterm=bold ctermfg=White ctermbg=Blue guifg=#40ffff guibg=#0000aa
set statusline=%1*%F%m%r%h%w%=%(%c%V\ %l/%L\ %P%)

"inoremap jk <esc>
"inoremap kj <esc>
call arpeggio#map('i',  's', 0, 'jk', '<Esc>')
call arpeggio#map('in',  's', 0, '[q', '<Esc>:cp<CR>i')
call arpeggio#map('in',  's', 0, ']q', '<Esc>:cn<CR>i')
call arpeggio#map('n',  's', 0, 'td', '<Esc>:tabclose<CR>')
call arpeggio#map('i',  's', 0, 'w=', '<Esc><c-w>=i')
call arpeggio#map('n',  's', 0, 'w=', '<c-w>=')
call arpeggio#map('i',  's', 0, '[t', '<Esc>:tabp<CR>i')
call arpeggio#map('i',  's', 0, ']t', '<Esc>:tabn<CR>i')
call arpeggio#map('n',  's', 0, '[t', ':tabp<CR>')
call arpeggio#map('n',  's', 0, ']t', ':tabn<CR>')
call arpeggio#map('in', 's', 0, 'mk', '<Esc>:wa<CR>:make<Up><CR>')
call arpeggio#map('in', 's', 0, 'lr', ':LustyFilesystemExplorerFromHere<CR>')
call arpeggio#map('in', 's', 0, 'lf', ':LustyFilesystemExplorer<CR>')
call arpeggio#map('in', 's', 0, 'lb', ':LustyBufferExplorer<CR>')
call arpeggio#map('in', 's', 0, 'lg', ':LustyBufferGrep<CR>')
call arpeggio#map('n',  's', 0, 'wf', '<c-w>F')

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
 
 
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
:set completeopt=longest,menuone
:let g:SuperTabDefaultCompletionType = 'context'
:let g:SuperTabDefaultCompletionType = '<c-x><c-o>'
:let g:SuperTabLongestEnhanced = 1

nnoremap <F5> :GundoToggle<CR>
set undodir=~/.vim-tmp/undodir
set undofile
:set undolevels=1000
:set undoreload=10000

set grepprg=rak\ --follow\ --output=\"fn+':'+i.to_s+':'+line\"

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
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
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

"inoremap <expr> <Esc> pumvisible() ? "<C-e>" : "<Esc>"
"inoremap <expr> <CR>  pumvisible() ? "<C-y>" : "<CR>"
"inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

