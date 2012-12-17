filetype plugin off " We switch it back on again later, but off for pathogen to get a lookin
filetype off
autocmd ColorScheme * highlight MatchParen cterm=bold ctermbg=none ctermfg=green

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundle 'scrooloose/syntastic'
Bundle 'git@github.com:christfo/thermometer'
Bundle 'Lokaltog/vim-powerline'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/neocomplcache'
Bundle 'Twinside/vim-cuteErrorMarker'
Bundle 'brookhong/cscope.vim'
Bundle 'erikw/tmux-powerline'
Bundle 'godlygeek/tabular'
Bundle 'jnwhiteh/vim-golang'
Bundle 'jpalardy/vim-slime'
Bundle 'kana/vim-arpeggio'
Bundle 'kana/vim-textobj-user'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'nanliu/vim-puppet'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'nviennot/irb-config'
Bundle 'phleet/vim-mercenary'
Bundle 'pydave/powerline-sanity'
Bundle 'scrooloose/nerdtree'
Bundle 'sjbach/lusty'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/threesome.vim'
Bundle 'sunaku/QFixToggle'
Bundle 'timcharper/textile.vim'
Bundle 'tomasr/molokai'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/Colortest'
Bundle 'vim-scripts/EasyGrep'
Bundle 'vim-scripts/Mark--Karkat'
Bundle 'vim-scripts/QuickBuf'
Bundle 'vim-scripts/SearchCompl.vim'
Bundle 'vim-scripts/Source-Explorer-srcexpl.vim'
Bundle 'vim-scripts/TailMinusF'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/foldsearch'
Bundle 'vim-scripts/grep.vim'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/tlib'
Bundle 'vim-scripts/vim-cmake-project'
Bundle 'vim-scripts/vim-json-bundle'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end
syntax on
filetype plugin indent on
runtime ftplugin/man.vim
source $VIMRUNTIME/ftplugin/man.vim

nmap <C-H>  <C-W>h
nmap <C-J>  <C-W>j
nmap <C-K>  <C-W>k
nmap <C-L>  <C-W>l
cmap ack  Ack

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" set completeopt+=longest
" set completeopt+=longest,menuone
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


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1


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
set switchbuf=useopen,usetab
set backspace=indent,eol,start
set cindent shiftwidth=4  " set auto-indenting num columns
set softtabstop=4       " <tab> inserts 2 spaces (etc...)
set cmdheight=2
set laststatus=2
let mapleader=","
set history=55000
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
set spell


" swap tag following shortcuts to show list by default
set tags=tags
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" add the missing commands
nnoremap Y yf$

" paste most recent
cmap <c-r><c-r>  <c-r>"
imap <c-r><c-r>  <c-r>"

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" " recall newer command-line
:cnoremap <C-N>             <Down>
" " recall previous (older) command-line
:cnoremap <C-P>             <Up>

:nnoremap [t :tabp<cr>
:nnoremap ]t :tabn<cr>

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>    "   's'   symbol: find all references to the token under cursor         
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>    "   'g'   global: find global definition(s) of the token under cursor    
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>    "   'c'   calls:  find all calls to the function name under cursor       
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>    "   't'   text:   find all instances of the text under cursor            
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>    "   'e'   egrep:  egrep search for the word under cursor                 
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>    "   'f'   file:   open the filename under cursor                         
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>  "   'i'   includes: find files that include the filename under cursor
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>    "   'd'   called: find functions that function under cursor calls        

if filereadable("cscope.out")
    cs add cscope.out
endif
set cscopetag
set cscopeverbose
set csto=0

" let g:ackprg="rak -H --nocolor --nogroup "

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

:set cino+=g0             " place C++ scope declarations at start of line
:set cino+=t0             " place function return_type decl at start of line
:set cino+=+4             " indent for a continuation line

" leader cd already taken, so use h insread
let g:VCSCommandMapPrefix='<leader>h'

" Shortcut to fold at left brace
map F zfa}

let g:slime_target="tmux"
function! To_Tmux()
  let b:text = input("tmux:", "", "custom,")
  call <SID>SlimeSend(b:text . "\\r")
endfunction

" cmap tt :call To_Tmux()<CR>
" cmap rr :call To_Tmux()<CR><c-p><cr>

" Open and close srcExplr, taglist and NERD_tree individually
nnoremap <F7> :SrcExplToggle<CR>
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F5> :GundoToggle<CR>

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


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
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
let g:cuteErrorMarkerBrutalSignRemoval=1
nnoremap <leader>co :copen 35 <cr>:cfile<up><cr>:CleanupMarkErrors<cr>:MarkErrors<CR> 
nnoremap <leader>fd :compiler rspec<cr>:cfile ./autotest.spec<cr>:copen<cr>:CleanupMarkErrors<cr>:MarkErrors<CR>


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
call arpeggio#map('n',  's', 0, 'co', ':cfile<Up><CR>:copen<CR>:CleanupMarkErrors<cr>:MarkErrors<CR>')
call arpeggio#map('n',  '', 0, 'ta', ':Tabularize /')
call arpeggio#map('n',  's', 0, 'du', ':diffupdate<CR>')
call arpeggio#map('n',  's', 0, 'do', ':DiffSaved<CR>')
call arpeggio#map('n',  's', 0, 'dc', ':DiffSavedOff<CR>')


autocmd BufRead,BufNewFile *.log set syntax=log 
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

command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    else
      let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No decimal number found'
    endtry
  else
    echo printf('%x', a:arg + 0)
  endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
  if empty(a:arg)
    if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
      let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
    else
      let cmd = 's/0x\x\+/\=submatch(0)+0/g'
    endif
    try
      execute a:line1 . ',' . a:line2 . cmd
    catch
      echo 'Error: No hex number starting "0x" found'
    endtry
  else
    echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
  endif
endfunction

