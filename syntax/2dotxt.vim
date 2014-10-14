" Vim syntax file
" Language:    2do.txt
" Maintainer:    Rich Soni <_@richsoni.com>
" Filenames:    *.txt *.todo *.ckl
" Last Change:  2014-10-14

" if exists("b:current_syntax")
"   finish
" endif

" if !exists('main_syntax')
"   let main_syntax = '2dotxt'
" endif

syn sync minlines=10
syn case ignore

syn region todotxtPriA start=/^\s*\(([Aa])\)/ end=/ / contains=ALL
syn region todotxtPriB start=/^\s*\(([Bb])\)/ end=/ / contains=ALL
syn region todotxtPriC start=/^\s*\(([Cc])\)/ end=/ / contains=ALL
syn region todotxtPriD start=/^\s*\(([Dd])\)/ end=/ / contains=ALL
syn region todotxtWait start=/^\s*\(([Ww])\)/ end=/ / contains=ALL
syn match  todotxtComment "#.*" contains=ALL
syn match  todotxtComplete "^\s*[xX].*" contains=ALL

" hi def link todoAssignee       Number
" hi todoBold term=bold cterm=bold gui=bold
" hi def link todoCommand        Special
" hi def link todoContext        Statement
" hi def link todoDate           PreProc
" hi def link todoDefer          Type
" hi def link todoDone           NonText
" hi def link todoEmail          Underlined
" hi def link todoFoldProject    PreProc
" hi def link todoLabel          Todo
" hi def link todoNever          Comment
" hi todoPriority term=bold cterm=bold gui=bold
" hi def link todoProject        Identifier
" hi def link todoQuery          Constant
" hi def link todoRACI           PreProc
" hi def link todoRecur          Constant
" hi def link todoString         Question 
" hi def link todoURI            Underlined 
" hi def link todoUline          CursorLine
" hi def link todoVerb           Type

hi def link todotxtPriA Statement
hi def link todotxtPriB Number
hi def link todotxtPriC Todo
hi def link todotxtPriD Function
hi def link todotxtWait Comment
hi def link todotxtComment Comment
hi def link todotxtComplete Comment

" vim: ts=8 sw=2
