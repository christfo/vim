filetype plugin off " We switch it back on again later, but off for pathogen to get a lookin
filetype off
autocmd ColorScheme * highlight MatchParen cterm=bold ctermbg=none ctermfg=green

python from powerline.bindings.vim import source_plugin; source_plugin()

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
Bundle 'tpope/vim-sensible'
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
Bundle 'tpope/vim-sleuth'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
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
Bundle 'nanliu/vim-puppet'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'nviennot/irb-config'
Bundle 'phleet/vim-mercenary'
Bundle 'pydave/powerline-sanity'
Bundle 'scrooloose/nerdtree'
Bundle 'sjbach/lusty'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/splice.vim'
Bundle 'sunaku/QFixToggle'
Bundle 'timcharper/textile.vim'
Bundle 'tomasr/molokai'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'gorkunov/smartpairs.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'diffchanges.vim'
Bundle 'Colortest'
Bundle 'EasyGrep'
Bundle 'Mark--Karkat'
Bundle 'QuickBuf'
Bundle 'SearchCompl.vim'
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'TailMinusF'
Bundle 'YankRing.vim'
Bundle 'a.vim'
Bundle 'foldsearch'
Bundle 'grep.vim'
Bundle 'matchit.zip'
Bundle 'mru.vim'
Bundle 'tlib'
Bundle 'vim-cmake-project'
Bundle 'vim-json-bundle'
Bundle 'vim-javascript'
Bundle 'ag.vim'
Bundle 'zoomwintab.vim'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'yazug/vim-taglist-plus'
Bundle 'hwrod/interactive-replace.git'
" Bundle 'vim-scripts/pry.vim'
"Bundle 'vim-scripts/neosnippet'
"Bundle 'vim-scripts/QuickFixCurrentNumber'

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end
runtime ftplugin/man.vim
source $VIMRUNTIME/ftplugin/man.vim

nmap <C-H>  <C-W>h
nmap <C-J>  <C-W>j
nmap <C-K>  <C-W>k
nmap <C-L>  <C-W>l
"cmap ack  Ack
cnoreabbrev <expr> ack ((getcmdtype() is# ':' && getcmdline() is# 'ack')?('Ack'):('ack'))
cnoreabbrev <expr> ag ((getcmdtype() is# ':' && getcmdline() is# 'ag')?('Ag'):('ag'))

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
set ignorecase
set virtualedit=onemore
set hlsearch
set switchbuf=useopen,usetab
"set cindent shiftwidth=4  " set auto-indenting num columns
set cmdheight=2
let mapleader=","
set history=55000
set wildmode=list:longest
set scrolloff=3
set wildignore=*.o,*~,tags
set ttyfast
set hidden
set expandtab
set numberwidth=4
set undofile
set undolevels=1000
set undoreload=10000
set spell
set fillchars+=vert:\|


" swap tag following shortcuts to show list by default
set tags=tags
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

" paste most recent. using 0 allows you to replace previous when using cw cmap <c-r><c-r>  <c-r>"
imap <c-r><c-r>  <c-r>0
cmap <c-r><c-r>  <c-r>"

" preserve selection in visual shifting
vnoremap  <  <gv
vnoremap  >  >gv

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

" always magic on search
nnoremap / /\v
nnoremap ? ?\v

"add :w!! to write as sudo
cmap w!! w !sudo tee % > /dev/null 

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
nnoremap <F5> :GundoToggle<CR>
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F7> :NERDTreeToggle<CR>

:let ruby_operators = 1
:let ruby_minlines = 100

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_gobal = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

nmap <silent> <leader>` :QFix<CR>

let g:LustyJugglerAltTabMode=1
map 0 ^
nnoremap <Leader>do :DiffChangesDiffToggle<cr>
nnoremap <leader>tp  :set invpaste<cr>
nnoremap <leader><Leader>  :noh<cr>
nnoremap <leader>cd :cd %:p:h<cr>
let g:cuteErrorMarkerBrutalSignRemoval=1
nnoremap <leader>co :copen 35 <cr>:cfile<up><cr>:CleanupMarkErrors<cr>:MarkErrors<CR> 
nnoremap <leader>bo :copen 35 <cr>:cfile build.out <cr>:CleanupMarkErrors<cr>:MarkErrors<CR> 
nnoremap <leader>fd :compiler rspec<cr>:cfile ./autotest.spec<cr>:copen<cr>:CleanupMarkErrors<cr>:MarkErrors<CR>


let MRU_Max_Entries = 400
map <Leader>f :MRU<CR>


nnoremap dg do
call arpeggio#map('iv',  's', 0, 'jk', '<Esc>')
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
call arpeggio#map('n',  's', 0, 'dc', ':DiffChangesDiffToggle<CR>')
call arpeggio#map('n',  's', 0, 'du', ':diffupdate<CR>')
call arpeggio#map('n',  's', 0, 'ru', ':execute    <up><cr>')
" run the following to dow tmux repeat command, then 'ru' chord to repeat that
" :execute    'silent !tmux send-keys -t target.2 "dow "\' | redraw! 
" execute    'silent !tmux send-keys -t target.2 "stopecho '''' > serial.raw dow ./apps/bin/box_img.elf run"' | redraw!


autocmd BufRead,BufNewFile *.log set syntax=log 

