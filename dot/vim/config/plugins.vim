" Use only my snippets
let g:snippets_dir=$HOME . "/.vim/snippets"

" NERDTree use minimal UI
let NERDTreeMinimalUI = 1

" NERDTree auto delete buffer after file is removed
let NERDTreeAutoDeleteBuffer = 1

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
let g:airline_theme='github'
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

let g:test#javascript#mocha#file_pattern = '.*\.test\.js$'
let g:test#javascript#mocha#executable = 'npm run mocha'

" ConoLine
let g:conoline_auto_enable = 1

" Threat every JavaScript file as JSX
let g:jsx_ext_required = 0

" Create alternative file
function! s:CreateAlternative()
  let related = rails#buffer().alternate_candidates()[0]
  exec('vsplit ' . related)
endfunction

command! AC :call <SID>CreateAlternative()
