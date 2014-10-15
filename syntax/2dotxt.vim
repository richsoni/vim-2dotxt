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

" (A) hello
" (a) world
syn region todotxtPriA start=/^\s*\(([Aa])\)/ end=/ / contains=ALL

" (B) hello
" (b) world
syn region todotxtPriB start=/^\s*\(([Bb])\)/ end=/ / contains=ALL

" (C) hello
" (c) world
syn region todotxtPriC start=/^\s*\(([Cc])\)/ end=/ / contains=ALL

" (D) hello
" (d) world
syn region todotxtPriD start=/^\s*\(([Dd])\)/ end=/ / contains=ALL

" (W) hello
" (w) world
syn region todotxtWait start=/^\s*\(([Ww])\)/ end=/ / contains=ALL

" #(W) hello
" # anything
syn match  todotxtComment "#.*"

" x(W) hello
" X anything
syn match  todotxtComplete "^\s*[xX].*"

" (A) +project-name_here
" +project
syn match todotxtProject "+\S*"

" (A) @context-name_here
" @context
syn match todotxtContext "@\S*"

hi def link todotxtPriA     Number
hi def link todotxtPriB     Statement
hi def link todotxtPriC     Keyword
hi def link todotxtPriD     Constant
hi def link todotxtWait     Comment
hi def link todotxtComment  Comment
hi def link todotxtComplete Comment
hi def link todotxtProject  Todo
hi def link todotxtContext  Function

" vim: ts=8 sw=2
