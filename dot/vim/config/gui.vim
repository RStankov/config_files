if has("gui_running")
  set background=light

  colorscheme github
  let g:airline_theme='github'

  " colorscheme solarized
  " let g:airline_theme='solarized'

  " Font
  set guifont=JetBrains\ Mono:h15

  " Hide toolbar and menubar
  set guioptions-=T
  set guioptions-=m

  " Scrollbars
  set guioptions-=L
  set guioptions-=r

  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
else
  set background=dark
  let g:solarized_termcolors=256
  let g:airline_theme='onedark'

  hi VertSplit ctermbg=7 ctermfg=7
endi

" Spell errors
hi clear SpellBad
hi SpellBad gui=underline cterm=underline

" Hide the annoying tilde (~)
hi NonText ctermbg=0 ctermfg=0 guifg=bg guibg=bg gui=none
hi EndOfBuffer ctermbg=0 ctermfg=0 guifg=bg guibg=bg gui=none
