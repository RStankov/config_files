" Access colors present in 256 colorspace
let base16colorspace=256

" Editor theme
colorscheme base16-onedark

" Airline theme
let g:airline_theme='onedark'

" Hide the annoying ~ non texts
hi NonText guifg=bg guibg=bg gui=none

" JSX styling
hi def link jsxTag Identifier
hi def link jsxTagName Identifier
hi def link jsxCloseTag Identifier
hi def link jsxCloseString Identifier

" Todo comment styling
hi! link Todo Comment

" Bad spelling styling
hi clear SpellBad
hi SpellBad gui=underline cterm=underline

" ALE markers styling
hi ALEErrorSign guibg=#ff6961 guifg=#ff6961 gui=none
hi ALEWarningSign guibg=#fdfd96 guifg=#fdfd96 gui=none

" Fonts
" - SF Mono can be fond in `/Applications/Utilities/Terminal.app/Contents/Resources/Fonts`
" - Hack can be fond in `http://sourcefoundry.org/hack/`
set guifont=SF\ Mono\ Regular:h12,Hack:h12,Inconsolata:h14

" Hide toolbar and menubar
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
