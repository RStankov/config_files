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
Plug 'vim-ruby/vim-ruby', { 'branch': 'endless-def' }
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
Plug 'moll/vim-node'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'udalov/kotlin-vim'

" Other
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/writable_search.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'corntrace/bufexplorer'
Plug 'ecomba/vim-ruby-refactoring', { 'branch': 'main' }
Plug 'janko-m/vim-test'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
Plug 'miyakogi/conoline.vim'
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
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Auto-Pairs'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'mitermayer/vim-prettier'
Plug 'jremmen/vim-ripgrep'
Plug 'w0rp/ale'
Plug 'c-brenn/phoenix.vim'
Plug 'tweekmonster/startuptime.vim'
Plug 'mattn/gist-vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}} " :CocInstall coc-ultisnips
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag'
Plug 'skywind3000/asyncrun.vim'
Plug 'zerowidth/vim-copy-as-rtf'

" Themes
Plug 'altercation/vim-colors-solarized'

" Projects
Plug 'producthunt/vim-producthunt', { 'branch': 'main' }

call plug#end()

filetype plugin indent on
