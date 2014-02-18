" Use only my snippets
let g:snippets_dir=$HOME . "/.vim/snippets"

" NERDTree use minimal UI
let NERDTreeMinimalUI = 1

" Set SuperTab completion type to context
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 0
let g:SuperTabCompletionContexts = ['s:ContextText']
"
" airline settings
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='light'
let g:airline_enable_branch=0
let g:airline_enable_syntastic=0
let g:airline_detect_whitespace=0
let g:airline_section_b="%f"
let g:airline_section_c=""
let g:airline_section_x=""
let g:airline_section_y="%Y"
let g:airline_section_z="%3p%% : %3l : %3v : %3L"
