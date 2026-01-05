if has("gui_running")
  set background=light

  " colorscheme alabaster
  " hi VertSplit guibg=#bbbbbb guifg=#bbbbbb gui=none

  " let g:airline_theme='github'

  " function! s:airline_github_override() abort
  "   " Theme might not be github; guard just in case
  "   if !exists('g:airline#themes#github#palette')
  "     return
  "   endif

  "   let g:airline#themes#github#palette.normal.airline_a = ['#222222', '#aaaaaa', 0, 248]
  "   let g:airline#themes#github#palette.normal.airline_b = ['#222222', '#cccccc', 0, 250]
  "   let g:airline#themes#github#palette.normal.airline_c = ['#000000', '#e5e5e5', 0, 254]
  "   let g:airline#themes#github#palette.normal.airline_x = ['#000000', '#e5e5e5', 0, 254]
  "   let g:airline#themes#github#palette.normal.airline_y = ['#000000', '#e5e5e5', 0, 254]
  "   let g:airline#themes#github#palette.normal.airline_z = ['#000000', '#cccccc', 0, 250]
  " endfunction

  " augroup AirlineGithubOverride
  "   autocmd!
  "   " Fired after a theme is loaded
  "   autocmd User AirlineAfterTheme call s:airline_github_override()
  " augroup END

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
