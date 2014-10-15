" Vim filetype plugin
" Language:		2dotxt
" Maintainer:		Rich Soni <_@richsoni.com>
" Last Change:		2014 Oct 14

if exists("b:did_ftplugin")
  finish
endif

setlocal comments=:#
setlocal commentstring=#\ %s
setlocal formatoptions-=tw formatoptions+=cqnlj
setlocal suffixesadd=.txt

function! s:TwoDoToggleComplete()
  if matchstr(getline(line(".")), '^[xX].*$') != ''
    execute 's/[xX]//'
  else
    execute 's/\(.*\)/x\1/'
  endif
endfunction


function! s:TwoDoIsolate(expr)
  execute "normal!Oj"
  execute "normal!O"
  execute "g/".a:expr."/m".line('.').'-1'
  "unreverse grouping
  execute "normal!k"
  execute "g/".a:expr."/m".line('.')
endfunction

function! s:TwoDoTogglePriorityUp()
  let line=getline(line("."))
  if col('.') <= matchend(line, '(\a\?)\|\S', 0)
    if matchstr(line, '[\s?]*([A])', 0) != ''
      execute 's/(A)/(B)/'
    elseif matchstr(line, '[\s?]*([B])', 0) != ''
      execute 's/(B)/(C)/'
    elseif matchstr(line, '[\s?]*([C])', 0) != ''
      execute 's/(C)/(D)/'
    elseif matchstr(line, '[\s?]*([D])', 0) != ''
      execute 's/(D)\s*\(\S\)/\1/'
    else
      execute 's/\([^x\s]\)/(A) \1/'
    endif
  else
    execute 'normal! '
  endif
  echo('')
endfunction

function! s:TwoDoTogglePriorityDown()
  let line=getline(line("."))
  if col('.') <= matchend(line, '(\a\?)\|\S', 0)
    if matchstr(line, '[\s?]*([A])', 0) != ''
      execute 's/(A)\s*\(\S\)/\1/'
    elseif matchstr(line, '[\s?]*([B])', 0) != ''
      execute 's/(B)/(A)/'
    elseif matchstr(line, '[\s?]*([C])', 0) != ''
      execute 's/(C)/(B)/'
    elseif matchstr(line, '[\s?]*([D])', 0) != ''
      execute 's/(D)/(C)/'
    else
      execute 's/\([^x\s]\)/(D) \1/'
    endif
  else
    execute 'normal! '
  endif
  echo('')
endfunction

function! TwoDoIsolateComplete(A,L,P)
  return system('grep -oe "'.a:A.'\S*" ~/Dropbox/gtd/index | sort | uniq')
endfunction

function! s:TwoDoJoin()
  silent execute 'normal! dippkdd'
endfunction

function! s:TwoDoBubbleOut()
  silent execute 'normal! dd{P'
endfunction

nnoremap <space><space> :call <SID>TwoDoToggleComplete()<cr>
nnoremap <C-A> :call <SID>TwoDoTogglePriorityUp()<cr>
nnoremap <C-X> :call <SID>TwoDoTogglePriorityDown()<cr>
command! -nargs=1 -complete=custom,TwoDoIsolateComplete TwoDoIsolate call s:TwoDoIsolate(<q-args>)
nnoremap <C-K> :call <SID>TwoDoJoin()<cr>
nnoremap <C-J> :TwoDoIsolate 
nnoremap K :call <SID>TwoDoBubbleOut()<cr>
nnoremap g} vip:sort<cr>
