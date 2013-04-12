" Make , the leader key
let mapleader = ","

" Toggle NERDTree
nmap gn :NERDTreeToggle<cr>

" Splitjoin on Shift +/-
nmap _ :SplitjoinJoin<cr>
nmap + :SplitjoinSplit<cr>

" Split screens
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l
nnoremap gq :on<cr>

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
nnoremap <leader>= :Tabularize /=<CR>

" Tabularize => (I use ctrl + l for inserting =>)
nnoremap <leader>l :Tabularize /=><CR>

" Stitch
nnoremap <leader>- :Switch<cr>

" Resize widows with <leader> + arrows
nnoremap <leader><Right> :vertical res +5<cr>
nnoremap <leader><Left> :vertical res -5<cr>
nnoremap <leader><Up> :res +5<cr>
nnoremap <leader><Down> :res -5<cr>

" Open BufExplorer
nnoremap <leader>be :BufExplorer<cr>

" Open next/previous and close buffers
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bp :bprevious<cr>
nnoremap <leader>bn :bnext<cr>

" Insert blank lines
map <C-Enter> m`O<Esc>``
map <S-Enter> m`o<Esc>``
