" Make , the leader key
let mapleader = ","

" Toggle NERDTree
nmap gn :NERDTreeToggle<cr>

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
nnoremap <D-5> :CtrlPClearCache<CR>

" Clear search results when hitting space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Keep the cursor in place when joining lines with J
nnoremap J mzJ`z

nnoremap j gj
nnoremap k gk

" Insert a hash rocket
imap <c-l> <space>=><space>

" Tabularize equals
nnoremap <leader>= :Tabularize /^[^=]*\zs=<cr>

" Tabularize colon
nnoremap <leader>: :Tabularize /:\zs<cr>

" Tabularize => (I use ctrl + l for inserting =>)
nnoremap <leader>l :Tabularize /=><cr>

" Switch
nnoremap <leader>- :Switch<cr>

" Reorder arguments by ctrl + arrows
nnoremap <c-Left> :SidewaysLeft<cr>
nnoremap <c-Right> :SidewaysRight<cr>

" Open BufExplorer
nnoremap <leader>be :BufExplorer<cr>

" Insert blank lines
map <C-Enter> m`O<Esc>``
map <S-Enter> m`o<Esc>``

" Close quickfix window
nnoremap Q :ccl<cr>

" method a1, a2, a3 -> method(a1, a2, a3)
nmap <silent> <Plug>WrapWithParentheses mz^`z2hf<Space>xv$hS)`z
\:call repeat#set("\<Plug>WrapWithParentheses")<CR>
nmap <leader>9 <Plug>WrapWithParentheses

" method(a1, a2, a3) -> method a1, a2, a3
nmap <silent> <Plug>RemoveWrapingParentheses mzlF(ds(i<Space><Esc>`z
\:call repeat#set("\<Plug>RemoveWrapingParentheses")<CR>
nmap <leader>0 <Plug>RemoveWrapingParentheses

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Emulate TextMate-style indentation shortcuts
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

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
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif
