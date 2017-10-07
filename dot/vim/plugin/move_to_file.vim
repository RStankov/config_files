command! -bang -range -nargs=1 -complete=file MoveToFile <line1>,<line2>write<bang> <args> | <line1>,<line2>delete _ | vsplit <args> <cr>
