" Use only my snippets
let g:snippets_dir=$HOME . "/.vim/snippets"

" NERDTree use minimal UI
let NERDTreeMinimalUI = 1

" Set SuperTab completion type to context
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 0
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
