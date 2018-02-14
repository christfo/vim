" autocmd ColorScheme * call ColourOverride()
" function ColourOverride()
"   highlight Pmenu       ctermbg=159        gui=bold ctermfg=darkblue 
"   highlight PmenuSel    ctermbg=darkblue   gui=bold ctermfg=blue 
"   highlight Matchmaker  ctermbg=darkyellow gui=bold ctermfg=white 
"   highlight MatchParen  cterm=bold         ctermbg=none ctermfg=green
" endfunction

" Setting up Vundle - the vim plugin Plugr

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

let mapleader=","
let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++11 -Iinclude"]
call plug#begin('~/.vim/bundle')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --tern-completer' }
Plug 'mhinz/vim-grepper'
Plug 'fmoralesc/molokayo'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'ternjs/tern_for_vim'
Plug 'rhysd/clever-f.vim'
Plug 'rhysd/vim-clang-format'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-sexp'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'othree/html5-syntax.vim'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'elzr/vim-json'
Plug 'burnettk/vim-angular'
Plug 'vim-scripts/Python-mode-klen'
" Plug 'wilywampa/python-mode'
" Plug 'kien/rainbow_parentheses.vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-lion'
Plug 'wellle/targets.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'Shougo/unite.vim'
Plug 'gcmt/wildfire.vim'
Plug 'albfan/ag.vim'
Plug 'gabesoft/vim-ags'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-airline/vim-airline'
Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'jiangmiao/auto-pairs'
" Plug 'gorkunov/smartpairs.vim'
" Plug 'Raimondi/delimitMate'
" Plug 'cohama/lexima.vim'
" Plug 'Twinside/vim-cuteErrorMarker'
Plug 'brooth/far.vim'
Plug 'brookhong/cscope.vim'
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'jpalardy/vim-slime'
Plug 'dzeban/vim-log-syntax'
" Plug 'jayflo/vim-skip'
Plug 'Keithbsmiley/investigate.vim'
Plug 'kana/vim-arpeggio'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'lucapette/vim-textobj-underscore'
Plug 'sgur/vim-textobj-parameter'
Plug 'jceb/vim-textobj-uri'
Plug 'libclang-vim/vim-textobj-clang'
Plug 'rhysd/libclang-vim', { 'do': 'make' }
Plug 'chun-yang/vim-textobj-chunk'
Plug 'vimtaku/vim-textobj-keyvalue'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-operator-user'
Plug 'majutsushi/tagbar'
Plug 'mtth/locate.vim'
Plug 'nanliu/vim-puppet'
Plug 'nviennot/irb-config'
" Plug 'christfo/vim-mercenary'
Plug 'sjbach/lusty'
Plug 'sjl/gundo.vim'
Plug 'disassembler/splice.vim'
Plug 'sunaku/QFixToggle'
Plug 'timcharper/textile.vim'
Plug 'tomasr/molokai'
" Plug 'wookiehangover/jshint.vim'
Plug 'qstrahl/vim-matchmaker'
" Plug 'tomtom/quickfixsigns_vim'
Plug 'vim-ruby/vim-ruby'
Plug 'gregsexton/gitv'
Plug 'gregsexton/VimCalc'
Plug 'jelera/vim-javascript-syntax'
Plug 'zah/nim.vim'
" Plug 'hwrod/interactive-replace'
Plug 'zhaocai/linepower.vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'haya14busa/incsearch.vim', Cond(! has('nvim'))
" Plug 'vim-syntastic/syntastic' ", Cond(! has('nvim'))
Plug 'neomake/neomake' ", Cond(has('nvim')) 
" Plug 'junegunn/fzf', Cond(has('nvim'), { 'dir': '~/.fzf', 'do': './install --all' })
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible', Cond(! has('nvim'))
Plug 'vim-scripts/YankRing.vim' 
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'AndrewRadev/linediff.vim'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'  ", {'do': 'call glaive#Install()'}
Plug 'Shougo/deoplete.nvim', Cond(has('nvim'), { 'do': ':UpdateRemotePlugins' })
Plug 'tmhedberg/matchit'
Plug 'yegappan/mru'
Plug 'vim-scripts/node'
Plug 'ShawnHuang/vim-noerrmsg'
Plug 'vim-scripts/NPM'
Plug 'kbairak/TurboMark'
Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/ZoomWin'
Plug 'simeji/winresizer'
Plug 'glts/vim-textobj-comment'
Plug 'jmcantrell/vim-diffchanges'
Plug 'vim-scripts/Colortest'
Plug 'dkprice/vim-easygrep'
Plug 'noscript/justDo.vim'
Plug 'thetomcraig/Mark--Karkat'
Plug 'vim-scripts/QuickBuf'
Plug 'pelodelfuego/Vim-Swoop'
Plug 'vim-scripts/SearchCompl.vim'
Plug 'drmikehenry/vim-headerguard'
Plug 'hura/vim-toplevel'
Plug 'fjolnir/a.vim'
Plug 'embear/vim-foldsearch'

if ( ! has('nvim')  )
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
endif
call plug#end()
call glaive#Install()
Glaive codefmt plugin[mappings]

if ( has('nvim')  )
    if (has("termguicolors"))
        set termguicolors
    endif
    let g:far#source='agnvim'
    let g:yankring_clipboard_monitor=0
else
    let g:far#source='ag'
endif

runtime! bundle_config/*.vim

set rtp+=/usr/local/opt/fzf
function s:AddCodefmtEqualMapping() abort
  " Replace all the various ={motion} keys to codefmt
  nnoremap <buffer> = :set opfunc=codefmt#FormatMap<CR>g@
  nnoremap <buffer> == :FormatLines <CR>
  vnoremap <buffer> = :FormatLines  <CR>
endfunction
augroup codefmt_equal
  autocmd FileType h,cc,c,cpp,proto call s:AddCodefmtEqualMapping()
augroup END

function s:AddCodefmtEqualMappingYapf() abort
  " Replace all the various ={motion} keys to codefmt
  nnoremap <buffer> = :set opfunc=codefmt#FormatMap<CR>g@
  nnoremap <buffer> == :FormatLines yapf<CR>
  vnoremap <buffer> = :FormatLines  yapf<CR>
endfunction
augroup codefmt_equal
  autocmd FileType python call s:AddCodefmtEqualMappingYapf()
augroup END

let g:clang_format#detect_style_file=1
autocmd BufWritePre  *.{cpp,h,c,cc,hpp,js,py}  call StripTrailingWhite()

function! StripTrailingWhite()
  let l:winview = winsaveview()
  silent! %s/\s\+$//
  call winrestview(l:winview)
endfunction

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete | setlocal formatprg=yapf | set efm=\%A\ \ File\ \"%f\"\\,\ line\ %l\\,\ %m,%C\ %m,%Z 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'go' : ['.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

colorscheme molokayo
set nocompatible
set t_Co=256
set ignorecase
set virtualedit=onemore
set hlsearch
set switchbuf=useopen,usetab
set cmdheight=2
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

set ts=3
set autoindent
set expandtab
set shiftwidth=3

cnoreabbrev <expr> ack ((getcmdtype() is# ':' && getcmdline() is# 'ack')?('Ack'):('ack'))
" cnoreabbrev <expr> ag ((getcmdtype() is# ':' && getcmdline() is# 'ag')?('Ag'):('ag'))
cnoreabbrev <expr> ags ((getcmdtype() is# ':' && getcmdline() is# 'ags')?('Ags'):('ags'))
if executable('ack')
  set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
  set grepformat=%f:%l:%c:%m
endif
if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
nnoremap <leader>* :Grepper -tool rg -cword -noprompt -noswitch<cr>

" swap tag following shortcuts to show list by default
set tags=tags;
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>
vnoremap g<c-]> <c-]>

set mouse=a
set ttymouse=sgr
hi  Visual term=reverse ctermbg=244 guibg=#403D3D
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

nnoremap [w <plug>unimpairedLPrevious
nnoremap ]w <plug>unimpairedLNext

"add :w!! to write as sudo
cmap w!! w !sudo tee % > /dev/null 

" Open and close srcExplr, taglist and NERD_tree individually
nnoremap <F5> :GundoToggle<CR>
nnoremap <F6> :TagbarToggle<CR>

nnoremap <Leader>do :DiffChangesDiffToggle<cr>
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>co :copen 15 <cr>:cfile<up><cr>
nnoremap <leader>bo :copen 25 <cr>:cfile build.out <cr>

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

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endfun

nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

