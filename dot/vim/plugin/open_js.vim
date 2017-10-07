" Credits vesln (https://github.com/vesln/.dotfiles/blob/master/nvim/config/functions/open-js.vim)
"
" Configure with the following variables:
"
" let g:js_base_paths = [getcwd() . '/src/']
" let g:js_base_path = getcwd() . '/src/'

function! s:error(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
  let v:errmsg = a:msg
endfunction

function! s:findJsFile(name, from)
  let dir = isdirectory(a:from) ? a:from : fnamemodify(a:from, ":h")

  if a:name !~# '^\v(/|\./|\.\./)' && filereadable(dir . "/" . a:name)
    return dir . "/" . a:name
  else
    return node#lib#find(a:name, dir)
  end
endfunction

function! s:findJsPath(name, from)
  let path = s:findJsFile(a:name, a:from)

  if !empty(path)
    return path
  endif

  if exists('g:js_base_path')
    let path = s:findJsFile(g:js_base_path . a:name, a:from)
    if !empty(path)
      return path
    endif
  endif

  if exists('g:js_base_paths')
    for base_path in g:js_base_paths
      let path = s:findJsFile(base_path . a:name, a:from)
      if !empty(path)
        return path
      endif
    endfor
  endif
endfunction

function! s:OpenJS(name, from, ...)
  if empty(a:name) | return | endif

  let path = s:findJsPath(a:name, a:from)

  if empty(path)
    return s:error("E447: Can't find file \"" . a:name . "\" in path")
  endif

  exe "e " . fnameescape(path)
endfunction

command! OpenJS :call <SID>OpenJS(expand("<cfile>"), bufname("%"))
