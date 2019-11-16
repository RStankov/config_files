let g:html_number_lines = 0
let g:html_font = 'Monaco'

function! CopyCode()
  " set nonumber
  CopyRTF
  " set number
  hi NonText guifg=bg guibg=bg gui=none
endfunction

command! CopyCode :call CopyCode()
