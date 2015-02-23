"============== setting information ==============
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set term=screen-256color

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
set lazyredraw

set backspace=eol,start,indent

set noerrorbells
set novisualbell

set showmatch

"set column
"set textwidth=80
"execute "set colorcolumn=" . join(range(1,80), ',')
"highlight ColorColumn ctermbg=16 guibg=Black

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
Plugin 'http://github.com/vim-scripts/SrcExpl'
Plugin 'vim-livedown'

"For c/c++
"Plugin 'c.vim'
Plugin 'a.vim'
"For node.js
Plugin 'node.js'
"Markdown
Plugin 'MarkdownFootnotes'
Plugin 'Markdown'
Plugin 'Markdown-syntax'
"Color schemes
Plugin 'tomasr/molokai'
"For python
Plugin 'hynek/vim-python-pep8-indent'
"solarized
Plugin 'vim-colors-solarized'

call vundle#end()
filetype plugin indent on

colorscheme solarized
let g:solarized_termcolors=256
set background=dark

"============== num func ======================
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
		set nu
	else
		set relativenumber
		set nonu
	endif
endfunc


"============== general key mapping ======================
"Folding
map <F2> v]}zf
map <F3> zo
map <F4> zd

nmap <F5> :Tlist<CR><C-W><C-W>
nmap <F6> :BufExplorer<CR>
nmap <F7> :SrcExplToggle<CR>
nmap <F8> :NERDTreeToggle .<CR>

map <F9> :call NumberToggle()<cr>
map <F10> :! zsh<CR>
nmap <F12> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.cc' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -R -i cscope.files -f cscope.out<CR>
    \:cs reset<CR>


map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

"set window size
nmap <s-h> <C-W><
nmap <s-j> <C-W>-
nmap <s-k> <C-W>+
nmap <s-l> <C-W>>

"move window
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j 
nmap <c-k> <c-w>k 
nmap <c-l> <c-w>l 


"========= switch between file buffers ========
map ,x :bn!<CR>	  " Switch to Next File Buffer
map ,z :bp!<CR>	  " Switch to Previous File Buffer
map ,w :bw<CR>	  " Close Current File Buffer

map ,1 :b!1<CR>	  " Switch to File Buffer #1
map ,2 :b!2<CR>	  " Switch to File Buffer #2
map ,3 :b!3<CR>	  " Switch to File Buffer #3
map ,4 :b!4<CR>	  " Switch to File Buffer #4
map ,5 :b!5<CR>	  " Switch to File Buffer #5
map ,6 :b!6<CR>	  " Switch to File Buffer #6
map ,7 :b!7<CR>	  " Switch to File Buffer #7
map ,8 :b!8<CR>	  " Switch to File Buffer #8
map ,9 :b!9<CR>	  " Switch to File Buffer #9
map ,0 :b!0<CR>	  " Switch to File Buffer #0


"============== NERDTree =========================
let NERDTreeIgnore=['\.vim$','\~$','*.o','tags','*.out','cscope'] 
"let NERDTreeQuitOnOpen=1
let NERDTreeWinPos="left"
"let NERDTreeQuitOnOpen=0

autocmd vimenter * NERDTree

"============== set ctags ========================
set tagbsearch

set tags+=./tags,../tags,./include/tags,/usr/include/tags


"============== Taglist settings =======================
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


"============== cscope settings =======================
set csprg=/usr/bin/cscope "linux type
set csto=0
set cst
set nocsverb

cs add /usr/include/cscope.out
"cs add /usr/src/linux/cscope.out

set csverb


"============== SrcExpl settings =======================
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 300
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_pluginList = ["__Tag_List__", "_NERD_tree_1", "Source_Explorer"]
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey = "<F12>"

"============== vim-airline settings =======================
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'


"============== vim-livedown settings =======================
let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1337

map gm :call LivedownPreview()<CR>
