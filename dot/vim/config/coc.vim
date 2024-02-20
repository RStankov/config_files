" Copilot
let g:copilot_no_tab_map = v:true

" Copilot with CTRL-J (we override the tab with Coc)
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

" Coc setup
let g:coc_config_home = '/Users/rstankov/.vim'
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-solargraph', 'coc-snippets']

" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Key mappings
" - TAB and SHIFT+TAB to navigate through popup menu
" - ENTER to confirm completion
" - CTRL+SPACE to trigger completion
" - K to show documentation in preview window
" - gi to navigate to implementation/type definition/definition
" - <leader>rn to rename symbol
" - <leader>n to next diagnostic
" - <leader>o toggle outline

inoremap <expr><S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <Tab> CustomCocOnTab()
inoremap <silent><expr> <CR> CustomCocOnEnter()
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <silent> K :call CustomCocShowDocumentation()<CR>
nnoremap <silent> gi :call CustomCocNavigation()<CR>

nnoremap <silent> <leader>rn <Plug>(coc-rename)
nnoremap <silent> <leader>n <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>o  :call CustomCocToggleOutling()<CR>

" Custom function
function! CustomCocOnTab() abort
  call copilot#Dismiss()

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

  let s = copilot#GetDisplayedSuggestion()
  if !empty(s.text)
    return copilot#Accept("\<CR>")
  else
    return "\<CR>"
  endif
endfunction

function! CustomCocShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! CustomCocNavigation()
  " Save current cursor position
  let l:pos = getpos('.')

  " Try 'go to implementation'
  call CocAction('jumpImplementation')
  if l:pos != getpos('.')
    return
  endif

  " Try 'go to type definition'
  call CocAction('jumpTypeDefinition')
  if l:pos != getpos('.')
    return
  endif

  " Try 'go to definition'
  call CocAction('jumpDeclaration')
  if l:pos != getpos('.')
    return
  endif
endfunction

function! CustomCocToggleOutling() abort
  let winid = coc#window#find('cocViewId', 'OUTLINE')
  if winid == -1
    call CocActionAsync('showOutline', 1)
  else
    call coc#window#close(winid)
  endif
endfunction

