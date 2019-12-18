set background=light
colorscheme github
let g:airline_theme='github'

" Adjust onedark theme
" colorscheme onedark
" let g:airline_theme='onedark'
" hi VertSplit guibg=#3E4452 guifg=#3E4452 gui=none

hi def link jsxTag Identifier
hi def link jsxTagName Identifier
hi def link jsxCloseTag Identifier
hi def link jsxCloseString Identifier

" Spell errors
hi clear SpellBad
hi SpellBad gui=underline cterm=underline

" Hide the annoying ~ non texts
hi NonText guifg=bg guibg=bg gui=none

if has("gui_running")
  " Font.
  set guifont=Menlo:h14

  " Hide toolbar and menubar.
  set guioptions-=T
  set guioptions-=m

  " Scrollbars
  set guioptions-=L
  set guioptions-=r

  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif
