set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" " Vundle plugin system
Plug 'VundleVim/Vundle.vim'

" " Languages
Plug 'ekalinin/Dockerfile.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elixir-lang/vim-elixir'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
" Plug 'moll/vim-node'

" " Other
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/writable_search.vim'
Plug 'corntrace/bufexplorer'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'janko-m/vim-test'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'miyakogi/conoline.vim'
Plug 'msanders/snipmate.vim'
Plug 'scrooloose/nerdtree'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Auto-Pairs'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'mitermayer/vim-prettier'
Plug 'jremmen/vim-ripgrep'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'

call plug#end()

filetype plugin indent on
