" Vim color file
"
" Note: Based on work of Anthony Carapetis, Brian Mock, Ryan Heath

hi clear
syntax reset

set background=light

let g:colors_name="github"

hi Normal       guifg=#000000 guibg=#FFFFFF

" Cursor
hi Cursor		guibg=#444454 guifg=#F8F8FF
hi CursorLine	guibg=#D8D8DD
hi CursorColumn	guibg=#E8E8EE

" Diff
hi DiffAdd       guifg=#003300 guibg=#DDFFDD gui=none
hi DiffChange                  guibg=#ececec gui=none
hi DiffText      guifg=#000033 guibg=#DDDDFF gui=none
hi DiffDelete    guifg=#DDCCCC guibg=#FFDDDD gui=none

" Folding
hi Folded		guibg=#ECECEC guifg=#808080 gui=none
hi vimFold		guibg=#ECECEC guifg=#808080 gui=none
hi FoldColumn	guibg=#ECECEC guifg=#808080 gui=none

" Line Numbering
hi LineNr		guifg=#959595 guibg=#ECECEC gui=none
hi NonText		guifg=#808080 guibg=#ECECEC
hi Folded		guifg=#808080 guibg=#ECECEC gui=none
hi FoldeColumn  guifg=#808080 guibg=#ECECEC gui=none

" Status Lines
hi VertSplit	guibg=#bbbbbb guifg=#bbbbbb gui=none
hi StatusLine   guibg=#bbbbbb guifg=#404040 gui=none
hi StatusLineNC guibg=#bbbbbb guifg=#bbbbbb gui=none

" Misc
hi ModeMsg		guifg=#990000
hi MoreMsg		guifg=#990000

hi Title		guifg=#ef5939
hi WarningMsg	guifg=#ef5939
hi SpecialKey   guifg=#177F80 gui=none

hi MatchParen	guibg=#cdcdfd guifg=#000000
hi Underlined	guifg=#000000 gui=underline
hi Directory	guifg=#990000

" Search, Visual, etc
hi Visual		guifg=#FFFFFF guibg=#3465a4 gui=none
hi VisualNOS    guifg=#FFFFFF guibg=#204a87 gui=none
hi IncSearch	guibg=#cdcdfd guifg=#000000 gui=none
hi Search		guibg=#cdcdfd guifg=#000000 gui=none

" Completion menus
hi WildMenu     guifg=#7fbdff guibg=#425c78 gui=none
hi Pmenu        guibg=#808080 guifg=#ffffff gui=none
hi PmenuSel     guibg=#cdcdfd guifg=#000000 gui=none
hi PmenuSbar    guibg=#000000 guifg=#444444
hi PmenuThumb   guibg=#aaaaaa guifg=#aaaaaa

" Spelling
hi spellBad     guisp=#fcaf3e
hi spellCap     guisp=#73d216
hi spellRare    guisp=#fcaf3e
hi spellLocal   guisp=#729fcf

" Tabs
hi TabLine		guifg=#404040 guibg=#dddddd gui=none
hi TabLineFill	guifg=#404040 guibg=#dddddd gui=none
hi TabLineSel	guifg=#404040 gui=none

" Syntax
hi Ignore		guifg=#808080
hi Identifier	guifg=#0086B3
hi PreProc		guifg=#A71D5D gui=none
hi Comment		guifg=#999988
hi Constant		guifg=#0086B3 gui=none
hi String		guifg=#183691
hi Function		guifg=#795DA3 gui=none
hi Statement	guifg=#A71D5D gui=none
hi Type			guifg=#445588 gui=none
hi Number		guifg=#0086B3
hi Todo			guifg=#FFFFFF guibg=#990000 gui=none
hi Special		guifg=#159828 gui=none
hi Error        guibg=#f8f8ff guifg=#ff1100 gui=undercurl
hi Todo         guibg=#f8f8ff guifg=#ff1100 gui=underline
hi Label        guifg=#000000 gui=none
hi StorageClass guifg=#a71d5d gui=none
hi Structure    guifg=#000000 gui=none
hi TypeDef      guifg=#000000 gui=none

" Aliases
hi link cppSTL          Function
hi link cppSTLType      Type
hi link Character		Number
hi link htmlTag			htmlEndTag
hi link htmlTagName     htmlTag
hi link htmlLink		Underlined
hi link pythonFunction	Identifier
hi link Question		Type
hi link CursorIM		Cursor
hi link VisualNOS		Visual
hi link xmlTag			Identifier
hi link xmlTagName		Identifier
hi link shDeref			Identifier
hi link shVariable		Function
hi link rubySharpBang	Special
hi link perlSharpBang	Special
hi link schemeFunc      Statement

" Language specifics
hi rubySymbol       guifg=#0086B3
hi rubyConstant     guifg=#0086B3

hi jsGlobalObjects guifg=#0086B3
hi jsNull          guifg=#0086B3


hi def link jsxTag Identifier
hi def link jsxTagName Identifier
hi def link jsxCloseTag Identifier
hi def link jsxCloseString Identifier
