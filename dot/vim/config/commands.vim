" Quick shortcuts for editing vim config
command! CRefresh source $MYVIMRC

" Shortcut for the Ag (or something else in the future)
command! -nargs=* -complete=dir F :exe "Rg --type-add 'graphql:*.{graphql}'" <q-args>

