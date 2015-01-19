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
"set relativenumber
set number
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
set colorcolumn=100

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

function! MakeRspecFileIfMissing()
ruby << EOF
  class MakesRspecFileIfMissing
    def self.for(buffer)
      if spec_file?(buffer) || already_exists?(spec_for_buffer(buffer))
        puts "Spec already exists"
        return
      end

      # puts "going to make #{directory_for_spec(buffer)}"
      # puts "going to make #{spec_for_buffer(buffer)}"
      system 'mkdir', '-p', directory_for_spec(buffer)
      File.open(spec_for_buffer(buffer), File::WRONLY|File::CREAT|File::EXCL) do |file|
        file.write "require 'spec_helper'"
      end
    end

    private
    def self.spec_file?(file)
      file.match(/.*_spec.rb$/)
    end

    def self.already_exists?(b)
      File.exists?(b)
    end

    def self.spec_for_buffer(b)
      spec_buffer = b.sub('/app/', '/spec/')
      spec_buffer.sub!('/lib/', '/spec/lib/')
      spec_buffer.sub!('.rb', '_spec.rb')
      return spec_buffer
    end

    def self.directory_for_spec(b)
      File.dirname(self.spec_for_buffer(b))
    end
  end
  buffer = VIM::Buffer.current.name
  MakesRspecFileIfMissing.for(buffer)
EOF
endfunction
map <leader>s :call MakeRspecFileIfMissing()<CR> :A<CR>
map <leader>S :call MakeRspecFileIfMissing()<CR> :AT<CR>

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

""""""" Vimwiki
let wiki_1 = {}
let wiki_1.path = '~/Dropbox/vimwiki'
let wiki_2 = {}
let wiki_2.path = '~/Dropbox/vimwikimd'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let g:vimwiki_list = [wiki_1, wiki_2]
