" Taken form AndrewRadev
" https://github.com/AndrewRadev/Vimfiles/blob/94ccd3e6e1b727af5c17bb5594cf765afe9643b0/startup/autocommands.vim?fbclid=IwAR0REbxXt7pS-bDgtnITcRHbTd8m4e6R-Oyjt8sUEmuyhRoJQz7C4gXeQPQ#L22-L23

" Check if it's necessary to create a directory
autocmd BufNewFile * call s:EnsureDirectoryExists()

function! s:EnsureDirectoryExists()
  let required_dir = expand("%:h")

  if !isdirectory(required_dir)
    if !confirm("Directory '" . required_dir . "' doesn't exist. Create it?")
      return
    endif

    try
      call mkdir(required_dir, 'p')
    catch
      echoerr "Can't create '" . required_dir . "'"
    endtry
  endif
endfunction
