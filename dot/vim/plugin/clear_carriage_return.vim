function! s:CleanCarriageReturn()
  let cursor = getpos('.')
  %s/\r\(\n\)/\1/g
  call setpos('.', cursor)
endfunction
