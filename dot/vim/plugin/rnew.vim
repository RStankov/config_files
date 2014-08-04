" Creates ruby file and corresponding spec file
"
" Credits to: @AndrewRadev -> https://github.com/AndrewRadev/Vimfiles/blob/master/personal/plugin/rnew.vim
"
command! -nargs=1 -complete=file Rnew call s:Rnew(<f-args>)
function! s:Rnew(name)
  let parts     = split(a:name, '/')
  let base_name = parts[-1]
  let dir_parts = parts[0:-2]

  let underscored_name = base_name
  if underscored_name =~ '\.rb$'
    let underscored_name = fnamemodify(underscored_name, ':r')
  endif

  call s:CreateRubyFile(underscored_name, dir_parts)
  call s:CreateRubySpec(underscored_name, dir_parts)

  redraw!
endfunction

function! s:CreateRubyFile(name, dir_parts)
  let file_name = join(a:dir_parts + [a:name . '.rb'], '/')
  call s:EnsureDirectoryExists(file_name)

  exe 'edit '.file_name
  $delete _
  normal! gg
  write
endfunction

function! s:CreateRubySpec(name, dir_parts)
  let spec_name = join(a:dir_parts + [a:name . '_spec.rb'], '/')

  if spec_name =~ '\<app/'
    let spec_name = s:SubstitutePathSegment(spec_name, 'app', 'spec')
  else
    let spec_name = s:SubstitutePathSegment(spec_name, 'lib', 'spec/lib')
  endif

  call s:EnsureDirectoryExists(spec_name)

  exe 'vsplit '.spec_name
  call append(0, [
        \ 'require ''spec_helper''',
        \ '',
        \ ])
  $delete _
  normal! G
  write
endfunction

function! s:SubstitutePathSegment(expr, segment, replacement)
  return substitute(a:expr, '\(^\|/\)'.a:segment.'\(/\|$\)', '\1'.a:replacement.'\2', '')
endfunction

function! s:EnsureDirectoryExists(file)
  let dir = fnamemodify(a:file, ':p:h')

  if !isdirectory(dir)
    call mkdir(dir, 'p')
  endif
endfunction
