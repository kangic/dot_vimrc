"============== general settings =======================
" Map the leader key to SPACE
let mapleader="\<SPACE>"

scriptencoding utf-8
set encoding=utf-8
set fenc=utf-8
set termencoding=utf-8
set term=xterm-256color

set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

set backspace=eol,start,indent

if !&scrolloff
	set scrolloff=3       	" Show next 3 lines while scrolling.
endif

if !&sidescrolloff
	set sidescrolloff=5 	" Show next 5 columns while side-scrolling.
endif
set nostartofline		" Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" Relative numbering
function! NumberToggle()
    if(&relativenumber == 1)
        set nornu
        set number
    else
        set rnu
    endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

"============= set vim-plug========================
" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'scrooloose/syntastic'

Plug 'kien/ctrlp.vim'

Plug 'valloric/youcompleteme'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"============== general key mapping ======================
"Folding
map <F2> v]}zf
map <F3> zo
map <F4> zd

nmap <F5> :Tlist<CR><C-W><C-W>
nmap <F6> :SrcExplToggle<CR>
map <F7> :call NumberToggle()<CR>
nmap <F8> :NERDTreeToggle .<CR>

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
"let g:Gtags_Auto_Update=1
"nmap <C-]> :Gtags<CR><CR>
"nmap <C-\> :Gtags -r<CR><CR>
"nmap <C-n> :cn<CR>
"nmap <C-p> :cp<CR>

"============== SrcExpl settings =======================
let g:SrcExpl_winHeight=8
let g:SrcExpl_refreshTime=300
let g:SrcExpl_gobackKey="<SPACE>"
let g:SrcExpl_pluginList=["__Tag_List__", "_NERD_tree_1", "Source_Explorer"]
let g:SrcExpl_isUpdateTags=0
let g:SrcExpl_updateTagsCmd="ctags --sort=foldcase -R ."
let g:SrcExpl_updateTagsKey="<F12>"

"============== vim-airline settings =======================
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'simple'

"============== vim-livedown settings =======================
let g:livedown_autorun=0
let g:livedown_open=1
let g:livedown_port=1337

nmap gm :LivedownPreview<CR>

"====== vim-easy-align settings ======
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

"====== ctrlp settings ======
let g:ctrlp_map = '<c-p>'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore += '\v\.(exe|so|dll)$'

"====== syntastic settings ======
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_mode_map = {'mode' : 'passive'}

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

nmap <C-w><C-e> :SyntasticCheck<CR>
nmap <C-w><C-t> :SyntasticToggleMode<CR>



"====== theme settings ======
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
"colorscheme zenburn

"====== bufferlist.vim settings =====
map <silent> <F12> :call BufferList()<CR>

"====== buffer moving settings =====
set hidden
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprev<CR>
nnoremap <S-k> :bdelete<CR>

let GtagsCscope_Auto_Map = 1
let GtagsCscope_Ignore_Case = 1
let GtagsCscope_Absolute_Path = 1
let GtagsCscope_Keep_Alive = 1
let GtagsCscope_Auto_Load = 1
set cscopetag
