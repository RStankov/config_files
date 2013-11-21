" Base on vwilight
runtime bundle/vwilight/colors/vwilight.vim

let g:colors_name = "rstankov"

hi Normal         guifg=#f6f3e8     guibg=#141414     gui=NONE      ctermfg=NONE     ctermbg=NONE        cterm=NONE
hi NonText        guifg=#070707     guibg=#141414     gui=NONE      ctermfg=black    ctermbg=NONE        cterm=NONE

hi Cursor         guifg=black       guibg=white       gui=NONE      ctermfg=black    ctermbg=white       cterm=reverse
hi LineNr         guifg=#3D3D3D     guibg=#141414     gui=NONE      ctermfg=darkgray ctermbg=NONE        cterm=NONE
hi NonText        guifg=#141414     guibg=#141414     gui=NONE      ctermfg=darkgray ctermbg=NONE        cterm=NONE

hi VertSplit      guifg=#002b2b     guibg=#002b2b     gui=NONE
hi StatusLine     guifg=#f8f8f8     guibg=#002b2b     gui=bold
hi StatusLineNC   guifg=#f8f8f8     guibg=#002b2b     gui=NONE

hi Folded         guifg=#a0a8b0     guibg=#384048     gui=NONE      ctermfg=NONE     ctermbg=NONE        cterm=NONE
hi Title          guifg=#f6f3e8     guibg=NONE        gui=bold      ctermfg=NONE     ctermbg=NONE        cterm=NONE
hi Visual         guifg=NONE        guibg=#262D51     gui=NONE      ctermfg=NONE     ctermbg=darkgray    cterm=NONE

hi SpecialKey     guifg=#808080     guibg=#343434     gui=NONE      ctermfg=NONE     ctermbg=NONE        cterm=NONE

hi WildMenu       guifg=green       guibg=yellow      gui=NONE      ctermfg=black    ctermbg=yellow      cterm=NONE

hi PmenuSbar      guifg=black       guibg=white       gui=NONE      ctermfg=black    ctermbg=white       cterm=NONE

hi Error          guifg=NONE        guibg=NONE        gui=undercurl ctermfg=white    ctermbg=red         cterm=NONE     guisp=#FF6C60 " undercurl color
hi ErrorMsg       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=white    ctermbg=red         cterm=NONE
hi WarningMsg     guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=white    ctermbg=red         cterm=NONE

hi CursorLine     guifg=NONE        guibg=#141414     gui=NONE      ctermfg=NONE     ctermbg=NONE        cterm=BOLD
hi CursorColumn   guifg=NONE        guibg=#141414     gui=NONE      ctermfg=NONE     ctermbg=NONE        cterm=BOLD
hi MatchParen     guifg=#f6f3e8     guibg=#857b6f     gui=BOLD      ctermfg=white    ctermbg=darkgray    cterm=NONE
hi Pmenu          guifg=#f6f3e8     guibg=#444444     gui=NONE      ctermfg=NONE     ctermbg=NONE        cterm=NONE

hi Todo           guifg=NONE        guibg=NONE        gui=NONE      ctermfg=NONE     ctermbg=NONE        cterm=NONE
