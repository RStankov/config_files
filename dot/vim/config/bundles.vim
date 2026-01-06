set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Vundle plugin system
Plug 'VundleVim/Vundle.vim'

" Languages
Plug 'ekalinin/Dockerfile.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'elixir-lang/vim-elixir'
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
Plug 'moll/vim-node'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'udalov/kotlin-vim'
Plug 'jupyter-vim/jupyter-vim'

" Other
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'AndrewRadev/writable_search.vim'
Plug 'alvan/vim-closetag'
Plug 'c-brenn/phoenix.vim'
Plug 'chrisbra/Colorizer'
Plug 'corntrace/bufexplorer'
Plug 'ecomba/vim-ruby-refactoring', { 'branch': 'main' }
Plug 'janko-m/vim-test'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jremmen/vim-ripgrep'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'mattn/gist-vim'
Plug 'mitermayer/vim-prettier'
Plug 'miyakogi/conoline.vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'thinca/vim-visualstar'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tweekmonster/startuptime.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Auto-Pairs'
Plug 'vim-scripts/indentpython.vim'
Plug 'w0rp/ale'
Plug 'zerowidth/vim-copy-as-rtf'
Plug 'ubaldot/vim-outline'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'sderev/alabaster.vim'

call plug#end()

filetype plugin indent on
