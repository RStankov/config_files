" Use only my snippets
let g:snippets_dir=$HOME . "/.vim/snippets"

" NERDTree use minimal UI
let NERDTreeMinimalUI = 1

" NERDTree auto delete buffer after file is removed
let NERDTreeAutoDeleteBuffer = 1

" Don't show wildignore files and directories
let NERDTreeRespectWildIgnore = 1

" Track NERDTree state in tabs (credits @StanAngeloff and @gsamokovarov)
let g:nerdtree_tabs_open_on_new_tab=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_focus_on_files=1

" Make sure a NERDTree instance is mirrored for all tabs.
" This is needed as if the buffer with the only NERDTree instance is closed,
" the state is reset for the next mirror.
if has('autocmd')
  " Silently open and immediately close a NERDTree.
  au TabEnter * if !exists('t:hasNERDTree')
          \ | let t:hasNERDTree=1
          \ | execute 'silent! NERDTreeMirrorOpen'
          \ | execute 'silent! NERDTreeMirrorToggle'
        \ | endif

endif

" Airline settings
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_b="%f"
let g:airline_section_c=""
let g:airline_section_x=""
let g:airline_section_y="%Y"
let g:airline_section_z="%3p%% : %3l : %3v : %3L"

let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespaces#enabled = 0

" Vim-Test settings
let g:test#strategy = 'iterm'

let g:test#ruby#rspec#options = {
  \ 'nearest': '--format documentation',
  \ 'file':    '--format documentation',
\}

" Align begin and end in Ruby with one indent
let g:ruby_indent_assignment_style = 'variable'

" ConoLine
let g:conoline_auto_enable = 1

" Threat every JavaScript file as JSX
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1

" Enable jsdocs
let g:javascript_plugin_jsdoc = 1

" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 80

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'

" none|es5|all
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|postcss|json|graphql
let g:prettier#config#parser = 'typescript'

" require config
let g:prettier#config#require_config = 1

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor

" Turn on Ale only per-project basis
let g:ale_linters = { 'javascript': [], 'ruby': ['rubocop'], 'typescript': ['prettier', 'tsserver'] }
let g:ale_lint_on_save = 1
let g:ale_fixers = { 'ruby': ['rubocop'] }
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" Colorizer auto show colors (turn off with :ColorClear)
let g:colorizer_auto_color = 1
let g:colorizer_syntax = 1
let g:colorizer_auto_filetype = 'css,html,javascript,typescript,javascriptreact,typescriptreact,eruby,htmldjango'
let g:colorizer_colornames = 0
let g:colorizer_skip_comments = 1

" Auto close
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*erb,*.md'
let g:closetag_xhtml_filenames = '*.html,*.jsx,*.js,*.tsx,*erb,*.md'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Open quickfix window automatically at 8 lines height after command starts
" Docs: https://github.com/skywind3000/asyncrun.vim#quickfix-window
let g:asyncrun_open = 8

" Replace underscored identifier names with their camelCased versions
let b:switch_custom_definitions = [
      \   {
      \     '\<[a-z0-9]\+_\k\+\>': {
      \       '_\(.\)': '\U\1'
      \     },
      \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
      \       '\([A-Z]\)': '_\l\1'
      \     },
      \   },
      \   {
      \     'start':     '(\_s*',
      \     'end':       ')',
      \     'delimiter': ',\_s*',
      \     'brackets':  ['([{''"', ')]}''"'],
      \   },
      \   {
      \     'start':     '\[\_s*',
      \     'end':       '\]',
      \     'delimiter': ',\_s*',
      \     'brackets':  ['([{''"', ')]}''"'],
      \   },
      \   {
      \     'start':     '{\_s*',
      \     'end':       '}',
      \     'delimiter': ',\_s*',
      \     'brackets':  ['([{''"', ')]}''"'],
      \   },
      \ ]
