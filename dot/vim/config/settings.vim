" Switch on syntax highlighting
syntax on

" Filetype settings
filetype plugin on
filetype indent on

" Use vim defaults
set nocompatible

" Spellcheck on
set spell

" Disable swap files
set nobackup nowritebackup noswapfile

" Tell vim to always put a status line in, even if there is only one window
set laststatus=2

" Set formating options (see help for details)
set formatoptions=croqn

" Enable linebreaks and user '...' for marking them
set linebreak showbreak=...

" Automatically read a file that has changed on disk
set autoread

" Set default encoding to UTF-8
set encoding=utf-8

" Set file formats to Unix
set ffs=unix

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Fix backspace in insert mode
set backspace=indent,eol,start

" Autoindent options
set autoindent
set expandtab smarttab
set tabstop=8 softtabstop=2
set shiftwidth=2 shiftround

" Make vim work with rvm
set shell=/bin/sh

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Be case sensitive when searching
set ignorecase
set infercase
set noignorecase

" When searching try to be smart about cases
set smartcase

" For regular expressions turn magic on
set magic

" A buffer becomes hidden when it is abandoned
set hid

" Auto and Smart indent
set ai si

" Enable wildmenu command completions
set wildmenu
set wildmode=list:longest,full

" words also include dashes (-)
setlocal iskeyword+=-

" Ignore certain files in wildmenu
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=.DS_Store
set wildignore+=.git*
set wildignore+=*.woff,*.eof,*.otf
set wildignore+=*.jpg,*.png,*.gif,*.jpeg,*.ico
set wildignore+=*.swf,*.htc
set wildignore+=*/tmp/*,*/db/migrate,*/public/stylesheets/compiled

" Show the current mode
set showmode

" Keep short history
set history=50

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" A tab should display as "|    "
set listchars=tab:\|\

" Show trailing spaces as dots
set listchars+=trail:.

" Show line numbers
set number

" Don't break words
set linebreak

" Show line and column number
set ruler

" Remove startup message
set shortmess+=I

"" airline settings
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='tomorrow'
let g:airline_enable_branch=0
let g:airline_enable_syntastic=0
let g:airline_detect_whitespace=0
let g:airline_section_b="%f"
let g:airline_section_c=""
let g:airline_section_x=""
let g:airline_section_y="%Y"
let g:airline_section_z="%3p%% : %3l : %3v : %3L"
