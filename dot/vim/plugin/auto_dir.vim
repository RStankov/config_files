" When editing a directory with `vim /path/to/dir`, cd to it.
"
" Credits to: @AndrewRadev -> https://gist.github.com/AndrewRadev/5635632
"
augroup autodir
  autocmd!
  autocmd BufEnter,VimEnter * call s:MaybeEnterDirectory(expand("<amatch>"))
augroup END

function! s:MaybeEnterDirectory(file)
  if a:file != '' && isdirectory(a:file)
    let dir = a:file
    exe "cd ".dir
  endif
endfunction
