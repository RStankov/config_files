" Use only my snippets
let g:snippets_dir=$HOME . "/.vim/snippets"

" NERDTree use minimal UI
let NERDTreeMinimalUI = 1

" Track NERDTree state in tabs (credits @StanAngeloff and @gsamokovarov)
let g:nerdtree_tabs_open_on_new_tab=0
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

" airline settings
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='solarized'
let g:airline_enable_branch=0
let g:airline_enable_syntastic=0
let g:airline_detect_whitespace=0
let g:airline_section_b="%f"
let g:airline_section_c=""
let g:airline_section_x=""
let g:airline_section_y="%Y"
let g:airline_section_z="%3p%% : %3l : %3v : %3L"
