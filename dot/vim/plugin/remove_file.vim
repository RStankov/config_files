" Remove the current file
command! RemoveFile call s:RemoveFile() <Bar> q!
function! s:RemoveFile()
  let fileName = expand('%:p')
  let deleteStatus = delete(fileName)
  if (deleteStatus != 0)
    echo fileName + " is not deleted!"
  endif
endfunction

