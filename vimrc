"============== setting information ==============
scriptencoding utf-8
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set term=screen-256color

set hlsearch
set ts=2
set expandtab
set rnu
set cindent
set autoindent
set smartindent
set wrap
set ruler
set shiftwidth=2
set ff=unix
set lazyredraw

set backspace=eol,start,indent

set noerrorbells
set novisualbell

set showmatch

"For vim-airline
set t_Co=256
set laststatus=2

" Folding
set foldmethod=marker
set fdm=marker
syntax on
filetype on

set noswapfile

set cursorline
"set cursorcolumn

"set textwidth=80
"set cc=81

set wildmenu

"====== diff mode ======
if &diff
	syntax off
endif

"====== set auto changing to current dir ======
"set autochdir
"autocmd BufEnter * silent! lcd %:p:h

"====== set for cpp ======
au Bufenter *.\(c\|cc\|cpp\|h\) set et

"============= set vundle ========================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"============= My vundle plugin list ============
Plugin 'superSnipMate'
Plugin 'matchparenpp'
Plugin 'gtags.vim'
Plugin 'The-NERD-tree'
Plugin 'bling/vim-airline'
Plugin 'http://github.com/vim-scripts/SrcExpl'
Plugin 'vim-livedown' "manual install

"For c/c++
Plugin 'a.vim'
Plugin 'c.vim'
Plugin 'SingleCompile'
Plugin 'scrooloose/syntastic'

"For node.js
Plugin 'node.js'
Plugin 'jade.vim'

"Markdown
Plugin 'MarkdownFootnotes'
Plugin 'Markdown'
Plugin 'Markdown-syntax'

"For python
Plugin 'hynek/vim-python-pep8-indent'

"colorschemes
Plugin 'vim-colors-solarized' "manual install
Plugin 'railscasts'
Plugin 'tomasr/molokai'

"vim-easy-align(manual install)
Plugin 'junegunn/vim-easy-align'

"vim-ctrlspace
Plugin 'szw/vim-ctrlspace'


call vundle#end()
filetype plugin indent on

"colorscheme railscasts 
colorscheme solarized 
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark


"============== num func ======================
let relativenumber=1
set relativenumber
set number

function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
		set nu
	else
		set relativenumber
		set number
	endif
endfunc


"============== general key mapping ======================
"Folding
map <F2> v]}zf
map <F3> zo
map <F4> zd

nmap <F5> :Tlist<CR><C-W><C-W>
nmap <F6> :SrcExplToggle<CR>
map <F7> :call NumberToggle()<CR>
nmap <F8> :NERDTreeToggle .<CR>

nmap <F9> :SCCompiler<CR>
nmap <F10> :SCCompilerRun<CR>

map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

"set window size
nmap <s-h> <C-W><
nmap <s-j> <C-W>-
nmap <s-k> <C-W>+
nmap <s-l> <C-W>>

"========= switch between file buffers ========
map ,x :bn!<CR>	  " Switch to Next File Buffer
map ,z :bp!<CR>	  " Switch to Previous File Buffer
map ,w :bw<CR>	  " Close Current File Buffer

"============== NERDTree =========================
let NERDTreeIgnore=['\.vim$','\~$','*.o','tags','*.out','cscope']
"let NERDTreeQuitOnOpen=1
let NERDTreeWinPos="left"

"autocmd vimenter * NERDTree

"============== gtags.vim settings =======================
let g:Gtags_Auto_Update=1
nmap <C-]> :Gtags<CR><CR>
nmap <C-\> :Gtags -r<CR><CR>
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>

"============== SrcExpl settings =======================
let g:SrcExpl_winHeight=8
let g:SrcExpl_refreshTime=300
let g:SrcExpl_gobackKey="<SPACE>"
let g:SrcExpl_pluginList=["__Tag_List__", "_NERD_tree_1", "Source_Explorer"]
let g:SrcExpl_isUpdateTags=0
let g:SrcExpl_updateTagsCmd="ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey="<F12>"

"============== vim-airline settings =======================
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1

let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='|'

"============== vim-livedown settings =======================
let g:livedown_autorun=0
let g:livedown_open=1
let g:livedown_port=1337

nmap gm :LivedownToggle<CR>

"====== vim-easy-align settings ======
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"====== vim-cpplint settings ======
"autocmd BufWritePost *.h,*.cc,*.cpp call Cpplint()

"====== vim-ctrlspace settings ======
set hidden
set showtabline=1

let g:airline_exclude_preview=1 "for vim-ctrlspace

hi CtrlSpaceSelected term=reverse ctermfg=187  ctermbg=23  cterm=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244  ctermbg=232 cterm=NONE
hi CtrlSpaceSearch   ctermfg=220  ctermbg=NONE cterm=bold
hi CtrlSpaceStatus   ctermfg=230  ctermbg=234  cterm=NONE

hi CursorLine cterm=NONE,underline

let g:CtrlSpaceSaveWorkspaceOnExit=1
