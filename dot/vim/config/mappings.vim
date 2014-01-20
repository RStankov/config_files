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
nmap <leader>9 mz^f<Space>xv$S)<Esc>`z

" method(a1, a2, a3) -> method a1, a2, a3
nmap <leader>0 mzF(ds(i<Space><Esc>`z

