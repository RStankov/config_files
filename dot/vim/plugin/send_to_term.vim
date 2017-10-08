function! SendToTerm()
  " Uses a script from `janko-m/vim-test/`
  let script_path = g:test#plugin_path . '/bin/osx_iterm'
  let cmd = join([script_path, shellescape(getline('.'))])
  execute 'silent !'.cmd
endfunction

command -range SendToTerm <line1>,<line2>call SendToTerm()

" Matches `tmux-plugins/vim-tmux` mappings
nmap g! :SendToTerm<CR>
vmap g! :SendToTerm<CR>
