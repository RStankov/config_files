function! s:SortLinesOpFunc(...)
  '[,']sort
endfunction

nnoremap <silent> \s :<C-u>set operatorfunc=<SID>SortLinesOpFunc<CR>g@

function! SortImports()
  mark z
  execute "normal! gg/import\<cr>\<cr>"
  normal \sip
  normal `z
  delmarks z
endfunction

command! SortImports :call SortImports()
