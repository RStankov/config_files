" Move the current file
command! MoveFile call s:MoveFile()
function! s:MoveFile()
  let oldName = expand('%')
  let newName = input('Move file to: ', expand('%'), 'file')
  if newName != '' && newName != oldName
    exec ':saveas ' . newName
    exec ':silent !rm ' . oldName
    redraw!
  endif
endfunction
