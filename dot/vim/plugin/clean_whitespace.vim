augroup clean_whitespace
  autocmd!

  autocmd BufWrite * call s:CleanWhitespace()
augroup END

function! s:CleanWhitespace()
  let cursor = getpos('.')
  %s/\s\+$//e
  call setpos('.', cursor)
endfunction
