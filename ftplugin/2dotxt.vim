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
