set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Add Bundles below
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'sjl/badwolf'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'wakatime/vim-wakatime'
Plugin 'vinitkumar/vim-misc'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mitsuhiko/fruity-vim-colorscheme'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'exu/pgsql.vim'
Plugin 'mitsuhiko/vim-python-combined'

let g:airline_theme = 'badwolf'
let g:airline#extension#syntastic#enabled = 1

colorscheme fruity
let g:colors_name="molokai"
set guifont=Inconsolata\ for\ Powerline:h14
set antialias
set backspace=2    " Backspace for dummies
set linespace=0    " No extra spaces between rows
set scrolloff=999  " Minimum lines to keep above and below cursor
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set splitbelow
set splitright
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=100 " Increase history from 20 default to 1000
set laststatus=2 " Always show status line
set nocompatible " Make vim more useful
set noerrorbells " Disable error bells.
set nostartofline
set ruler " Show the cursor position
set title " Show the filename in the window titlebar.
set background=dark
set tabstop=2
set mouse=a
set softtabstop=2
set expandtab
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

set clipboard=unnamed

syntax enable

scriptencoding utf10
" Disable the scrollbars
set guioptions-=r
set guioptions-=L
set encoding=utf-8
" set nobackup
" set noswapfile
" set pastetoggle=<F2>

" Map Leader
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR> 
nnoremap <Leader><space> za
nmap <leader>cd :cd %:h<CR>
nmap <leader>lcd :lcd %:h<CR>
nmap <silent> <leader>vimrc :e ~/.vimrc<CR>
map <leader>y "*y
map <leader>p "*p
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" nnoremap <leader>u :GundoToggle<CR>
" nnoremap <leader>s :mksession<CR>

" Better search and replace using /keyword + cs + .n
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>\:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Key remapping
nnoremap <CR> G
nnoremap <BS> gg
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap J 10j
nnoremap K 10k
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gV `[V`]
inoremap jk <esc>

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/vimrc')
    source $VIRTUAL_ENV/vimrc
endif

" SimpleFold related settings # Maybe
let g:indentobject_meaningful_indentation = ["python", "markdown", "ocaml"]
autocmd FileType python setlocal completeopt-=preview

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_clip_command = 'pbcopy'
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1

" Colorcolumns
if version >= 703
  autocmd FileType * setlocal colorcolumn=0
  " autocmd FileType ruby,python,javascript,c,cpp,objc,rst
  "  \ let &colorcolumn="80,".join(range(84,300),",")
  autocmd FileType ruby,python,javascript,c,cpp,objc,rst let &colorcolumn="80"
endif

" python support
" --------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes and it sucks ass if it's highlighted then. And for exceptions I
"  don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
\ formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1

let g:syntastic_python_checkers=['flake8', 'python']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Spell check always on
set spell spelllang=en_us

autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd FileType go set sw=4
autocmd FileType go set tabstop=4
autocmd FileType go set sts=0
autocmd FileType go set expandtab
autocmd FileType go set smarttab
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType html set sw=2
autocmd FileType c set sw=2
autocmd FileType c set ts=2
autocmd FileType c set sts=2
autocmd FileType html set ts=2
autocmd FileType html set sts=4

"Nerdtree
nmap <C-u> :NERDTreeToggle<CR>
nmap <C-c> :NERDTreeCWD<CR>
let NERDTreeIgnore = ['\.pyc$']

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
hi Visual term=reverse cterm=reverse guibg=Grey
