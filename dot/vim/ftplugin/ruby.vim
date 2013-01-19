" Rails.vim :A on lib/foo.rb -> spec/lib/foo_spec.rb
autocmd User Rails/lib/* let b:rails_alternate = 'spec/' . rails#buffer().name()[0:-4] . '_spec.rb'

" Rails.vim :A on spec/lib/foo_spec.rb -> lib/foo.rb
autocmd User Rails/spec/lib/* let b:rails_alternate = rails#buffer().name()[5:-9] . '.rb'

function! PromoteToLet()
  normal! dd
  normal! P
  .s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  normal ==
endfunction

nnoremap <leader>pl :call PromoteToLet()<cr>

function! PromoteToBefore()
  :'<,'>s/\(\s*\)\(\w.*\)/\1before do\r\1  \2\r\1end\r/
  normal ==
  normal! V
  /before do
endfunction

nnoremap <leader>pb V:call PromoteToBefore()<cr>
vnoremap <leader>pb :call PromoteToBefore()<cr>

function! ExtractVariable()
  let name = input("Variable name: ")
  if name == ''
    return
  endif
  " Enter visual mode (not sure why this is needed since we're already in visual mode anyway)
  normal! gv

  " Replace selected text with the variable name
  exec "normal c" . name
  " Define the variable on the line above
  exec "normal! O" . name . " = "
  " Paste the original selected text to be the variable value
  normal! $p
endfunction

vnoremap <leader>ev :call ExtractVariable()<cr>

function! InlineVariable()
  " Copy the variable under the cursor into the 'a' register
  let l:tmp_a = @a
  normal "ayiw
  " Delete variable and equals sign
  normal 2daW
  " Delete the expression into the 'b' register
  let l:tmp_b = @b
  normal "bd$
  " Delete the remnants of the line
  normal dd
  " Go to the end of the previous line so we can start our search for the
  " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
  " work; I'm not sure why.
  normal k$
  " Find the next occurence of the variable
  exec '/\<' . @a . '\>'
  " Replace that occurence with the text we yanked
  exec ':.s/\<' . @a . '\>/' . @b
  let @a = l:tmp_a
  let @b = l:tmp_b
endfunction

nnoremap <leader>iv :call InlineVariable()<cr>

" Shift + Enter in insert mode closes statement with 'end'
imap <S-CR> <CR><CR>end<Esc>-cc
