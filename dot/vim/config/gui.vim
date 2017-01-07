" Theme setup
set background=light
colorscheme github
let g:airline_theme='github'

" Hide the annoying ~ non texts
hi NonText      guifg=bg     guibg=bg     gui=NONE

" Font.
set guifont=Hack:h12

" Hide toolbar and menubar.
set guioptions-=T
set guioptions-=m

" Scrollbars
set guioptions-=L
set guioptions-=r

" Turn off blinking in normal mode
set gcr=n:blinkon0

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif
