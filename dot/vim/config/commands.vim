" Quick shortcuts for editing vim config
command! CRefresh source $MYVIMRC

" Shortcut for the Ag (or something else in the future)
command! -nargs=* -complete=dir F :exe "Rg" <q-args>

" Open current file directory in Finder
command! Finder silent exe '!open ' . expand("%:p:h")

" Create alternative file
function! s:CreateAlternative()
  let related = rails#buffer().alternate_candidates()[0]
  exec('vsplit ' . related)
endfunction

command! AC :call <SID>CreateAlternative()

command! -nargs=* -complete=dir F :exe "Rg --glob !db" <q-args>

command! Rubocop :AsyncRun bundle exec rubocop -a
