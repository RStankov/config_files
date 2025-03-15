" Coc setup
let g:coc_config_home = '/Users/rstankov/.vim'
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-snippets']

" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Key mappings
" - TAB and SHIFT+TAB to navigate through popup menu
" - ENTER to confirm completion
" - CTRL+SPACE to trigger completion
" - K to show documentation in preview window
" - gi to navigate to implementation/type definition/definition
" - <leader>rn to rename symbol
" - <leader>n to next error
" - <leader>o toggle outline

inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <Tab> CustomCocOnTab()
inoremap <silent><expr> <CR> CustomCocOnEnter()
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> K :call CustomCocShowDocumentation()<CR>
nnoremap <silent> gi :call CustomCocNavigation()<CR>

nnoremap <silent> <leader>rn <Plug>(coc-rename)
nnoremap <silent> <leader>n :call GoToNextError()<CR>
nnoremap <silent> <leader>o  :call CustomCocToggleOutling()<CR>

function! GoToNextError() abort
  let l:original_pos = getcurpos()

  " Go to next COC error
  call CocAction('diagnosticNext')

  " If we are at the same position or moved backwards
  " try to go to ALE error
  let l:new_pos = getcurpos()
  if l:new_pos[1] < l:original_pos[1] || (l:new_pos[1] == l:original_pos[1] && l:new_pos[2] <= l:original_pos[2])
    ALENext

    " Repeat that for COC again (so we can rotate between ALE and COC)
    let l:new_pos = getcurpos()
    if l:new_pos[1] < l:original_pos[1] || (l:new_pos[1] == l:original_pos[1] && l:new_pos[2] <= l:original_pos[2])
      call CocAction('diagnosticNext')
    endif
  endif
endfunction

function! CustomCocOnTab() abort
  if coc#pum#visible()
    return coc#pum#next(1)
  endif

  if coc#expandableOrJumpable()
    return "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>"
  endif

  let col = col('.') - 1
  if !col || getline('.')[col - 1]  =~# '\s'
    return "\<Tab>"
  endif

  return coc#refresh()
endfunction

function! CustomCocOnEnter() abort
  if coc#pum#visible()
    let pum_info = coc#pum#info()
    let selected_index = pum_info['index']
    if selected_index != -1
      return coc#pum#confirm()
    endif
  endif

  return "\<CR>"
endfunction

function! CustomCocShowDocumentation() abort
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! CustomCocNavigation() abort
  " Save current cursor position
  let l:pos = getpos('.')

  " Check and try 'go to definition' if available
  if CocHasProvider('definition')
    call CocAction('jumpDefinition')
    if l:pos != getpos('.')
      return
    endif
  endif

  " Check and try 'go to implementation' if available
  if CocHasProvider('implementation')
    call CocAction('jumpImplementation')
    if l:pos != getpos('.')
      return
    endif
  endif

  " Check and try 'go to type definition' if available
  if CocHasProvider('typeDefinition')
    call CocAction('jumpTypeDefinition')
    if l:pos != getpos('.')
      return
    endif
  endif

  " Check and try 'go to declaration' if available
  if CocHasProvider('declaration')
    call CocAction('jumpDeclaration')
    if l:pos != getpos('.')
      return
    endif
  endif

  " If nothing worked, fall back to Vim's native gd
  normal! gd
endfunction

function! CustomCocToggleOutling() abort
  let winid = coc#window#find('cocViewId', 'OUTLINE')
  if winid == -1
    call CocActionAsync('showOutline', 1)
  else
    call coc#window#close(winid)
  endif
endfunction

