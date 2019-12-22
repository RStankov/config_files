" Jump to last cursor position unless it's invalid or in an event handler
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" JSON -> JavaScript
au BufEnter *.json set filetype=javascript

autocmd BufEnter * if &filetype == "" | setlocal ft=ruby | endif

" TSX files are just TypeScript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript
