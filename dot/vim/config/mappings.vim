" Make , the leader key
let mapleader = ","

" Toggle NERDTree
nmap gn :NERDTreeToggle<cr>
nmap gnn :NERDTreeFind<cr>

" Splitjoin on Shift +/-
nmap _ :SplitjoinJoin<cr>
nmap + :SplitjoinSplit<cr>

" Split screens
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> :on<cr>

" CtrlP clear cache
nnoremap <leader>p :CtrlPClearCache<CR>

" Clear search results when hitting space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Keep the cursor in place when joining lines with J
nnoremap J mzJ`z

nnoremap j gj
nnoremap k gk

" Switch
nnoremap <leader>- :Switch<cr>

" Next search result
nnoremap <leader><leader> :cn<cr>

nnoremap s, :SidewaysLeft<cr>
nnoremap s. :SidewaysRight<cr>

" Insert blank lines
map <C-Enter> m`O<Esc>``
map <S-Enter> m`o<Esc>``

" Close quickfix window
nnoremap Q :ccl<cr>

" Surround with parentheses: method a1, a2, a3 -> method(a1, a2, a3)
nmap <silent> <Plug>WrapWithParentheses mz^`z2hf<Space>xv$hS)`z
      \:call repeat#set("\<Plug>WrapWithParentheses")<CR>
nmap <leader>9 <Plug>WrapWithParentheses

" Delete surrounding parentheses: method(a1, a2, a3) -> method a1, a2, a3
nmap <silent> <Plug>RemoveWrapingParentheses mzlF(ds(i<Space><Esc>`z
      \:call repeat#set("\<Plug>RemoveWrapingParentheses")<CR>
nmap <leader>0 <Plug>RemoveWrapingParentheses

" Reformat the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Find merge conflict markers
nmap <silent> <leader>mc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Bind K to grep word under cursor (or selected content)
nnoremap K yw:tabnew<CR>:F "\b<C-R>0\b"<CR>:cw<CR>
vnoremap K y:<C-U>tabnew<CR>:F "\b<C-R>0\b"<CR>:cw<CR>

" Emulate TextMate-style indentation shortcuts
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Move between ale linter markers
nnoremap ]e :ALENextWrap<CR>
nnoremap [e :ALEPreviousWrap<CR>

" Test running
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>L :TestLast<CR>

" Show information about content under cursor
nnoremap <silent> K :call CocAction('doHover')<CR>

" Do suggested auto-fix action (like imports)
nmap <leader>do <Plug>(coc-codeaction)

if has("gui_macvim") && has("gui_running")
  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> :tablast<CR>
  imap <D-9> <Esc>:tablast<CR>
else
  " Switch tab with Ctrl + [1-9].
  nnoremap <c-1> :tabn 1<CR>
  nnoremap <c-2> :tabn 2<CR>
  nnoremap <c-3> :tabn 3<CR>
  nnoremap <c-4> :tabn 4<CR>
  nnoremap <c-5> :tabn 5<CR>
  nnoremap <c-6> :tabn 6<CR>
  nnoremap <c-7> :tabn 7<CR>
  nnoremap <c-8> :tabn 8<CR>
  nnoremap <c-9> :tabn 9<CR>
  nnoremap <c-9> :tablast<CR>
  inoremap <c-1> <C-o>:tabn 1<CR>
  inoremap <c-2> <C-o>:tabn 2<CR>
  inoremap <c-3> <C-o>:tabn 3<CR>
  inoremap <c-4> <C-o>:tabn 4<CR>
  inoremap <c-5> <C-o>:tabn 5<CR>
  inoremap <c-6> <C-o>:tabn 6<CR>
  inoremap <c-7> <C-o>:tabn 7<CR>
  inoremap <c-8> <C-o>:tabn 8<CR>
  inoremap <c-9> <C-o>:tabn 9<CR>
  inoremap <c-9> <C-o>:tablast<CR>
endif

if has('gui_vimr')
  " Switch tab with Cmd + [1-9].
  nnoremap <d-1> :tabn 1<CR>
  nnoremap <d-2> :tabn 2<CR>
  nnoremap <d-3> :tabn 3<CR>
  nnoremap <d-4> :tabn 4<CR>
  nnoremap <d-5> :tabn 5<CR>
  nnoremap <d-6> :tabn 6<CR>
  nnoremap <d-7> :tabn 7<CR>
  nnoremap <d-8> :tabn 8<CR>
  nnoremap <d-9> :tabn 9<CR>
  nnoremap <d-9> :tablast<CR>
  inoremap <d-1> <C-o>:tabn 1<CR>
  inoremap <d-2> <C-o>:tabn 2<CR>
  inoremap <d-3> <C-o>:tabn 3<CR>
  inoremap <d-4> <C-o>:tabn 4<CR>
  inoremap <d-5> <C-o>:tabn 5<CR>
  inoremap <d-6> <C-o>:tabn 6<CR>
  inoremap <d-7> <C-o>:tabn 7<CR>
  inoremap <d-8> <C-o>:tabn 8<CR>
  inoremap <d-9> <C-o>:tabn 9<CR>
  inoremap <d-9> <C-o>:tablast<CR>

  " Move between tabs
  nnoremap <S-D-{> :tabp<CR>
  vnoremap <S-D-{> :tabp<CR>
  inoremap <S-D-{> :tabp<CR>
  nnoremap <S-D-}> :tabn<CR>
  vnoremap <S-D-}> :tabn<CR>
  inoremap <S-D-}> :tabn<CR>

  " Save file with Cmd + s.
  nnoremap <d-s> :w<CR>
  inoremap <d-s> <C-o>:w<CR>

  " Close current buffer/file with Cmd + w.
  nnoremap <d-w> :tabclose<CR>
  inoremap <d-w> <C-o>:tabclose<CR>

  " Map Cmd + z and Cmd + Shift + z to undo/redo.
  nnoremap <C-z> u
  inoremap <C-z> <C-o>u
  nnoremap <C-S-z> <C-r>
  inoremap <C-S-z> <C-o><C-r>
endif
