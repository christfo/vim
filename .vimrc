filetype plugin off " We switch it back on again later, but off for pathogen to get a lookin
filetype off

autocmd ColorScheme * call ColourOverride()
function ColourOverride()
  highlight Pmenu       ctermbg=159        gui=bold ctermfg=darkblue 
  highlight PmenuSel    ctermbg=darkblue   gui=bold ctermfg=blue 
  highlight Matchmaker  ctermbg=darkyellow gui=bold ctermfg=white 
  highlight MatchParen  cterm=bold         ctermbg=none ctermfg=green
endfunction


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

Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-jdaddy'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-sexp-mappings-for-regular-people'
Bundle 'rhysd/clever-f.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-clojure-highlight'
Bundle 'guns/vim-sexp'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tommcdo/vim-exchange'
Bundle 'tommcdo/vim-lion'
Bundle 'wellle/targets.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'gcmt/wildfire.vim'
Bundle 'rking/ag.vim'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Raimondi/delimitMate'
Bundle 'Twinside/vim-cuteErrorMarker'
Bundle 'brookhong/cscope.vim'
Bundle 'godlygeek/tabular'
Bundle 'jnwhiteh/vim-golang'
Bundle 'jpalardy/vim-slime'
Bundle 'jayflo/vim-skip'
Bundle 'Keithbsmiley/investigate.vim'
Bundle 'kana/vim-arpeggio'
Bundle 'kana/vim-textobj-user'
Bundle 'majutsushi/tagbar'
Bundle 'mtth/locate.vim'
Bundle 'nanliu/vim-puppet'
Bundle 'bbchung/clighter'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'nviennot/irb-config'
Bundle 'christfo/vim-mercenary'
Bundle 'scrooloose/nerdtree'
Bundle 'sjbach/lusty'
Bundle 'sjl/gundo.vim'
Bundle 'disassembler/splice.vim'
Bundle 'sunaku/QFixToggle'
Bundle 'timcharper/textile.vim'
Bundle 'tomasr/molokai'
Bundle 'qstrahl/vim-matchmaker'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'gorkunov/smartpairs.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'diffchanges.vim'
Bundle 'Colortest'
Bundle 'EasyGrep'
Bundle 'justDo'
Bundle 'Mark--Karkat'
Bundle 'QuickBuf'
Bundle 'SearchCompl.vim'
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'TailMinusF'
Bundle 'headerguard'
Bundle 'vim-toplevel'
Bundle 'YankRing.vim'
Bundle 'a.vim'
Bundle 'foldsearch'
Bundle 'gregsexton/gitv'
Bundle 'gregsexton/VimCalc'
Bundle 'matchit.zip'
Bundle 'mru.vim'
Bundle 'node'
Bundle 'noerrmsg.vim'
Bundle 'NPM'
Bundle 'TurboMark'
Bundle 'tlib'
Bundle 'vim-git-log'
Bundle 'vim-json-bundle'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'vim-javascript'
Bundle 'ZoomWin'
Bundle 'PatternsOnText'
Bundle 'winresizer.vim'
Bundle 'textobj-comment'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'hwrod/interactive-replace.git'
Bundle 'zhaocai/linepower.vim'
Bundle 'haya14busa/incsearch.vim'
if ( empty($SUPRESS_YCM)  )
  Bundle 'Valloric/YouCompleteMe.git'
endif

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end
runtime ftplugin/man.vim
source $VIMRUNTIME/ftplugin/man.vim

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

colorscheme molokai
set nocompatible
set t_Co=256
set ignorecase
set virtualedit=onemore
set hlsearch
set switchbuf=useopen,usetab
set cmdheight=2
let mapleader=","
set history=10000
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
set cino+=g0             " place C++ scope declarations at start of line
set cino+=t0             " place function return_type decl at start of line
set cino+=+4             " indent for a continuation line
set fillchars+=vert:\|
set backupdir=~/.local/share/vim/backup//
set directory=~/.local/share/vim/swap//
set undodir=~/.local/share/vim/undo//

" nmap <C-H>  <C-W>h
" nmap <C-J>  <C-W>j
" nmap <C-K>  <C-W>k
" nmap <C-L>  <C-W>l

"cmap ack  Ack
cnoreabbrev <expr> ack ((getcmdtype() is# ':' && getcmdline() is# 'ack')?('Ack'):('ack'))
cnoreabbrev <expr> ag ((getcmdtype() is# ':' && getcmdline() is# 'ag')?('Ag'):('ag'))
if executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif

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
nnoremap Y y$
nnoremap 0 ^

cnoremap <C-N>  <Down>
cnoremap <C-P>  <Up>

nnoremap [t :tabp<cr>
nnoremap ]t :tabn<cr>

" always magic on search
let g:incsearch#magic = '\v'
let g:incsearch#emacs_like_keymap = 1
" augroup incsearch-keymap
"   autocmd!
"   autocmd VimEnter call s:incsearch_keymap()
" augroup END
" function! s:incsearch_keymap()
"   IncSearchNoreMap <Right> <Over>(incsearch-next)
"   IncSearchNoreMap <Left>  <Over>(incsearch-prev)
"   IncSearchNoreMap <Tab>   <Over>(incsearch-complete)
"   IncSearchNoreMap <Down>  <Over>(incsearch-scroll-f)
"   IncSearchNoreMap <Up>    <Over>(incsearch-scroll-b)
" endfunction
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
cnoremap s/ s/\v

"add :w!! to write as sudo
cmap w!! w !sudo tee % > /dev/null 

let g:slime_target="tmux"
function! To_Tmux()
  let b:text = input("tmux:", "", "custom,")
  call <SID>SlimeSend(b:text . "\\r")
endfunction

" Open and close srcExplr, taglist and NERD_tree individually
nnoremap <F5> :GundoToggle<CR>
nnoremap <F6> :TagbarToggle<CR>
nnoremap <F7> :NERDTreeToggle<CR>

nnoremap <leader><Leader>  :noh<cr>
nnoremap <Leader>do :DiffChangesDiffToggle<cr>
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>co :copen 35 <cr>:cfile<up><cr>:CleanupMarkErrors<cr>:MarkErrors<CR> 
nnoremap <leader>bo :copen 35 <cr>:cfile build.out <cr>:CleanupMarkErrors<cr>:MarkErrors<CR> 
nnoremap <leader>fd :compiler rspec<cr>:cfile ./autotest.spec<cr>:copen<cr>:CleanupMarkErrors<cr>:MarkErrors<CR>


" run the following to dow tmux repeat command, then 'ru' chord to repeat that
" :execute    'silent !tmux send-keys -t target.2 "dow "\' | redraw! 
" execute    'silent !tmux send-keys -t target.2 "stopecho '''' > serial.raw dow ./apps/bin/box_img.elf run"' | redraw!

autocmd BufRead,BufNewFile *.log set syntax=log 

" add autocmd so that the gutter is always displayed to stop the cursor
" jumping
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')


" Like windo but restore the current window.
function! WinDo(command)
  let currwin=winnr()
  execute 'windo ' . a:command
  execute currwin . 'wincmd w'
endfunction
com! -nargs=+ -complete=command Windo call WinDo(<q-args>)
" Like bufdo but restore the current buffer.
function! BufDo(command)
  let currBuff=bufnr("%")
  execute 'bufdo ' . a:command
  execute 'buffer ' . currBuff
endfunction
com! -nargs=+ -complete=command Bufdo call BufDo(<q-args>)
" Like tabdo but restore the current tab.
function! TabDo(command)
  let currTab=tabpagenr()
  execute 'tabdo ' . a:command
  execute 'tabn ' . currTab
endfunction
com! -nargs=+ -complete=command Tabdo call TabDo(<q-args>)
command! -nargs=1 Silent  | execute ':silent !'.<q-args>  | execute ':redraw!'

" change paste <motion>
" Blackhole the motion and replace it with the contents of current refgister

function! ChangePaste(type, ...) 
  silent exe "normal! `[v`]\"_c".getreg(g:currentRegister) 
endfunction
nmap <silent> cp :let g:currentRegister=v:register<cr>:set opfunc=ChangePaste<CR>g@
"
runtime! bundle_config/*.vim
"inoremap   <silent><CR>  <c-r>=neocomplcache#smart_close_popup()<cr><cr>





