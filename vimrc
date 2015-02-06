"============== setting information ==============
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8

set hlsearch
set ts=2
set rnu
set cindent
set autoindent
set smartindent
set wrap
set ruler
set shiftwidth=2
set ff=unix
set bg=dark
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

"============= set vundle ========================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'


"============= My vundle plugin list ============
Plugin 'superSnipMate'
Plugin 'matchparenpp'
Plugin 'cscope.vim'
Plugin 'ctags.vim'
Plugin 'taglist.vim'
Plugin 'bufexplorer.zip'
Plugin 'The-NERD-tree'
Plugin 'Conque-Shell'
Plugin 'bling/vim-airline'

"For c/c++
Plugin 'c.vim'
Plugin 'a.vim'
"For node.js
Plugin 'node.js'
"Markdown
Plugin 'MarkdownFootnotes'
Plugin 'Markdown'
Plugin 'Markdown-syntax'
"Color schemes
Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on

"============== num func ======================
function! NumberToggle()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc

map <F9> :call NumberToggle()<cr>

"============== key mapping ======================
"Folding
vmap <F2> zf 
map <F3> zo
map <F4> zc

"plugin
map <F5> :Tlist<CR><C-W><C-W>
map <F6> :BufExplorer<CR>
map <F7> :NERDTreeToggle .<CR>
nmap <F8> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
    \:cs reset<CR>

map <F12> <C-W><C-W> 
map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

"============== NERDTree =========================
let NERDTreeIgnore=['\.vim$','\~$','*.o','tags','*.out','cscope'] 
let NERDTreeQuitOnOpen=1
let NERDTreeWinPos="left"
let NERDTreeQuitOnOpen=0

autocmd vimenter * NERDTree

"============== set ctags ========================
map ,noi :set noai<CR>:set nocindent<CR>:set nosmartindent<CR>
map ,sei :set ai<CR>:set cindent<CR>:set smartindent<CR>
set tagbsearch

"============== set ctags =======================
set tags=./tags,../tags,../include/tags,/usr/include/tags,~/include/tags

if version >= 500
	func! Sts()
		let st = expand("<cword>")
		exe "sts ".st
	endfunc
	nmap ,st : call Sts()<cr>

	func! Tj()
		let st = expand("<cword>")
		exe "tj ".st
	endfunc
	nmap ,tj :call Tj()<cr>
endif

function! UPDATE_TAGS()
	let _f_ = expand("%:p")
	let _cmd_ = '"ctags -a -f ./tags --c++-kinds=+p --fields=+iaS --extra=+q " ' . '"' . _f_ . '"'
	let _resp = system(_cmd_)
	unlet _cmd_
	unlet _f_
	unlet _resp
	endfunction
autocmd BufWrite *.cpp,*.h,*.c call UPDATE_TAGS()

"============== set Taglist =======================
let Tlist_Auto_Open=1
let Tlist_Auto_Update=1
let Tlist_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_Close_On_Select=0
let Tlist_Exit_OnlyWindow=1
let Tlist_Display_Tag_Scope=1
let Tlist_Display_Prototype=1
let Tlist_Sort_Type="name"
let Tlist_Use_Right_Window=1
let Tlist_Inc_Winwidth=0
let Tlist_Exit_OnlyWindow=0
let Tlist_WinWidth=50


"============== set cscope =======================
set csprg=/usr/bin/cscope "linux type
set csto=0
set cst
set csverb

"============== set vim-airline =======================
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
