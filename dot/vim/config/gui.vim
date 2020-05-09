syntax enable

hi def link jsxTag Identifier
hi def link jsxTagName Identifier
hi def link jsxCloseTag Identifier
hi def link jsxCloseString Identifier

" Spell errors
hi clear SpellBad
hi SpellBad gui=underline cterm=underline

" Hide the annoying tilde (~)
hi NonText guifg=bg guibg=bg gui=none
hi EndOfBuffer guibg=bg guifg=bg gui=none

if has("gui_running")
  " Font.
  set guifont=JetBrains\ Mono:h13

  " Hide toolbar and menubar.
  set guioptions-=T
  set guioptions-=m

  " Scrollbars
  set guioptions-=L
  set guioptions-=r

  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif
