" Quick shortcuts for editing vim config
command! CRefresh source $MYVIMRC

" Shortcut for the Ag (or something else in the future)
command! -nargs=* -complete=dir F :exe "Rg" <q-args>

" Open current file directory in Finder
command! Finder silent exe '!open ' . expand("%:p:h")
