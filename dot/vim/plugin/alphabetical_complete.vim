"
" Heavily inspired by
"    CompleteHelper.vim (Generic functions to support custom insert mode completions)
"    by Ingo Karkat
"

function! FindMatches(base)
  let l:pattern = '\V\<' . escape(a:base, '&#039') . '\k\+'
  let l:matches = []

  for l:bufferNumber in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    let l:matchTemplate = {'menu': bufname(l:bufferNumber)}

    for l:line in getbufline(l:bufferNumber, 1, '$')
      " Note: Do not just use matchstr() with {count}, because we cannot
      " reliably recognize whether an empty result just means "empty match
      " at {count}" or actually means "no more matches".
      let l:endPos = 0
      while 1
        let l:startPos = l:endPos
        let l:endPos = matchend(l:line, l:pattern, l:startPos)
        if l:endPos == -1
          break
        endif

        " Store match text in match object.
        let l:matchObj = copy(l:matchTemplate)
        let l:matchObj.word = matchstr(l:line, l:pattern, l:startPos)

        " Only add if this is an actual match that is not yet in the list of matches.
        if !empty(l:matchObj.word) && index(l:matches, l:matchObj) == -1
          call add(l:matches, l:matchObj)
        endif
      endwhile
    endfor

    if complete_check()
      break
    endif
  endfor

  return l:matches
endfunction

function! AlphabeticalComplete(findstart, base)
  if a:findstart
    let l:startCol = searchpos('\k*\%#', 'bn', line('.'))[1]
    if l:startCol == 0
      let l:startCol = col('.')
    endif
    return l:startCol - 1
  else
    return sort(FindMatches(a:base))
  endif
endfunction

set completefunc=AlphabeticalComplete

function! CleverTab()
  if pumvisible()
    return "\<c-n>"
  endif

  if strpart(getline('.'), 0, col('.') -1) =~ '^\s*$'
    return "\<tab>"
  else
    return "\<c-x>\<c-u>"
  endif
endfunction

inoremap <tab> <c-r>=CleverTab()<cr>
inoremap <c-n> <c-r>=CleverTab()<cr>

" Hack for bypassing snipmate tab completion
" it checks for SuperTab and then calls <c-n>
if !exists("g:SuperTabMappingForward")
  let g:SuperTabMappingForward = '<tab>'
endif

