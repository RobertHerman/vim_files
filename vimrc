filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on

" no need to be vi compatible
set nocompatible

" set up color scheme
colorscheme default
set t_Co=256

" prevents security exploits
set modelines=0

" Sane spacing and tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Clear old autocmds in group so we don't get warnings on reloading vimrc
"autocmd!

"General behavior
"behave xterm

" make life a little easier
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set visualbell
set noerrorbells
set cursorline
set ttyfast
set ruler
set autoread
set dictionary="/usr/dict/words"
set history=100
set nofoldenable
set complete-=i
set timeoutlen=3000
set ttimeoutlen=50
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backspace=indent,eol,start
set laststatus=2
set statusline=%<%f\ %y\ %h%m%r%#warningmsg#%*%=%-14.(%l,%c%V%)\ %P
"set statusline=%<%f\ %h%m%r%#warningmsg#%{SyntasticStatusLineFlag()}%*%=%-14.(%l,%c%V%)\ %P
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=darkred ctermbg=NONE gui=NONE guifg=darkred guibg=NONE
highlight ExtraWhitespace ctermbg=darkgreen  guifg=darkgreen
set undofile

"remap leader key to comma from \\
let mapleader = ","


" window behavior
set splitbelow
set splitright
set winminheight=1

" search stuff
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" some convenience remaps
nnoremap j gj
nnoremap k gk
inoremap jj <ESC>

"some window remaps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l

" get rid of the help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" save having to hit the shift key for :
nnoremap ; :

"tabs
nnoremap th :tabprevious<CR>
nnoremap tl :tabnext<CR>
nnoremap td :tabclose<CR>
nnoremap tn :tabnew<CR>

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set list
set listchars=tab:▸\ ,eol:¬

" allow me to create a note quickly
" broken
"map <leader>n :sp ~/notes/stream-`date '+\%Y\%m\%d\%H\%M\%S'`.txt<CR><esc>:!ln -s % ~/notes/latest.txt<CR><leader>h
"map <leader>h i<cr><esc>30i-<esc>a><esc> :r!date +'\%A \%v \%r'<cr>kJk<esc>64i=<esc>yypO

" Source the vimrc file after saving it
"if has("autocmd")
"  autocmd bufwritepost $HOME/.vim/vimrc source $HOME/.vim/vimrc
"  autocmd bufwritepost $HOME/.vimrc source $HOME/.vim/vimrc
"endif


"""""""" NERDTree:
map <leader>dc :NERDTreeClose<cr>
map <leader>do :NERDTree<cr>
map <leader>df :NERDTreeFind<cr>
" Enable nice colors
let NERDChristmasTree = 1
" Make it easy to see where we are
let NERDTreeHighlightCursorline = 1
" Make bookmarks visible
let NERDTreeShowBookmarks = 1
" Show hidden files
let NERDTreeShowHidden = 1
" Don't hijack NETRW
"let NERDTreeHijackNetrw = 0
let NERDTreeHijackNetrw = 1
let NERDTreeIgnore=['\.$', '\~$']

