" Jump to last cursor position unless it's invalid or in an event handler
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" JSON -> JavaScript
autocmd BufNewFile,BufRead *.json set filetype=javascript

autocmd BufNewFile * if &filetype == "" | setlocal ft=ruby | endif

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
