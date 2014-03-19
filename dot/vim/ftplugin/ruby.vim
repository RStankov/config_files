" Rails.vim :A on lib/foo.rb -> spec/lib/foo_spec.rb
autocmd User Rails/lib/* let b:rails_alternate = 'spec/' . rails#buffer().name()[0:-4] . '_spec.rb'

" Rails.vim :A on spec/lib/foo_spec.rb -> lib/foo.rb
autocmd User Rails/spec/lib/* let b:rails_alternate = rails#buffer().name()[5:-9] . '.rb'

" Ruby refactoring
nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rel  :RExtractLet<cr>
nnoremap <leader>riv  :RInlineTemp<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>rem  :RExtractMethod<cr>
vnoremap <leader>rev  :RExtractLocalVariable<cr>
vnoremap <leader>rrv  :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>

" My ruby refactoring methods
function! RubyExtractBeforeBlock()
  :'<,'>d
  exec "?^\\s*\\<\\(describe\\|context\\)\\>"
  normal $p
  normal V=
  normal `[v`]
  :'<,'>s/\(\s*\)\(\w.*\)/\1before do\r\1  \2\r\1end\r/
  normal ==
endfunction

nnoremap <leader>reb V:call RubyExtractBeforeBlock()<cr>
vnoremap <leader>reb :call RubyExtractBeforeBlock()<cr>

