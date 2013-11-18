filetype plugin off " We switch it back on again later, but off for pathogen to get a lookin
filetype off

autocmd ColorScheme * call ColourOverride()
function ColourOverride()
  highlight Pmenu       ctermbg=157        gui=bold ctermfg=blue 
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
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-flatfoot'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-dispatch'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Raimondi/delimitMate'
Bundle 'Valloric/YouCompleteMe.git'
Bundle 'Twinside/vim-cuteErrorMarker'
Bundle 'brookhong/cscope.vim'
Bundle 'godlygeek/tabular'
Bundle 'jnwhiteh/vim-golang'
Bundle 'jpalardy/vim-slime'
Bundle 'kana/vim-arpeggio'
Bundle 'kana/vim-textobj-user'
Bundle 'majutsushi/tagbar'
Bundle 'mtth/locate.vim'
Bundle 'nanliu/vim-puppet'
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
Bundle 'NPM'
Bundle 'TurboMark'
Bundle 'tlib'
Bundle 'vim-git-log'
Bundle 'vim-json-bundle'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'vim-javascript'
Bundle 'ag.vim'
Bundle 'ZoomWin'
Bundle 'PatternsOnText'
Bundle 'winresizer.vim'
Bundle 'textobj-comment'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'hwrod/interactive-replace.git'
Bundle 'zhaocai/linepower.vim'

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
nnoremap / /\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap ? ?\v
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



runtime! bundle_config/*.vim
"inoremap   <silent><CR>  <c-r>=neocomplcache#smart_close_popup()<cr><cr>

