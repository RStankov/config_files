" Jump to last cursor position unless it's invalid or in an event handler
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" JSON -> JavaScript
autocmd BufNewFile,BufRead *.json set filetype=javascript

autocmd BufNewFile * if &filetype == "" | setlocal ft=ruby | endif

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Reformat with Prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql execute 'PrettierAsync --require-config'
