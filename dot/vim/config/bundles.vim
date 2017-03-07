set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/vundle')

" Vundle plugin system
Plugin 'VundleVim/Vundle.vim'

" Languages
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'elixir-lang/vim-elixir'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'
Plugin 'RStankov/vim-node'        " my fork have proper support for `gf`

" Themes

Plugin 'joshdick/onedark.vim'

" Other
Plugin 'AndrewRadev/sideways.vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'AndrewRadev/writable_search.vim'
Plugin 'corntrace/bufexplorer'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'janko-m/vim-test'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'mileszs/ack.vim'
Plugin 'miyakogi/conoline.vim'
Plugin 'msanders/snipmate.vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'neo4j-contrib/cypher-vim-syntax'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'thinca/vim-visualstar'
Plugin 'thisivan/vim-matchit'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/Auto-Pairs'
Plugin 'jparise/vim-graphql'

call vundle#end()
filetype plugin indent on
