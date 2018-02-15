" Theme setup

set background=light
colorscheme github
let g:airline_theme='github'

" colorscheme onedark
" let g:airline_theme='onedark'

" Adjust onedark theme
" hi VertSplit guibg=#3E4452 guifg=#3E4452 gui=none

hi def link jsxTag Identifier
hi def link jsxTagName Identifier
hi def link jsxCloseTag Identifier
hi def link jsxCloseString Identifier

" onedark coloring for bad spelling is annoying
hi clear SpellBad
hi SpellBad gui=underline cterm=underline

" Hide the annoying ~ non texts
hi NonText      guifg=bg     guibg=bg     gui=none

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
