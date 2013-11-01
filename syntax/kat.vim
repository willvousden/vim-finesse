setlocal commentstring=%%s

if exists('b:current_syntax')
  finish
endif

setlocal iskeyword+=.
setlocal iskeyword+=-
setlocal iskeyword+=+

" Commands.
syn match command /\(^\s*\)\@<=\w\+:\@!/
syn match command /\(^\s*\w\+:\s\+\)\@<=\w\+/
highlight link command Keyword

"" Node names.
"syn match node /^\@<!\<n\(ode\)\?\w\+\>/
"highlight link node Label

" Comments.
syn match com /[%#].*$/
highlight link com Comment

" Operators.
"syn match operator /[-+\*^:/]/
syn match op /:/
highlight link op Operator

" Numbers.
syn match num /\w\@<![+-]\?\(\d\+\)[umkMG]\?\w\@!/
syn match num /\w\@<![+-]\?\(\d*\.\?\d\+\)[umkMG]\?\w\@!/
highlight link num Number

" Variables.
syn match var /\$\w\+/
highlight link var Identifier

let s:components = [ 'l', 'm[12]\?', 's', 'bs[12]\?', 'isol', 'mod', 'lens', 'pd\d*', 'ad', 'shot', 'qshot', 'bp', 'cp', 'guoy', 'beam' ]

" Components.
let s:component_regex = 'syn match component /\(^\s*\)\@<=\(' . join(s:components, '\|') . '\)\(\s\+\|$\)\@=/'
exec s:component_regex
highlight link component Type

" Component names.
let s:componentname_regex = 'syn match componentname /\(^\s*\(' . join(s:components, '\|') . '\)\s\+\)\@<=\w\+/'
exec s:componentname_regex
highlight link componentname Identifier

" Function calls.
syn match functionname /\w\+(\@=/
syn match functionname /\(^\s*func\s\+\)\@<=\w\+/
highlight link functionname Function

"" Constant definitions.
"syn match const /\(^\s*const\s\+\)\@<=\w\+/
"highligh link const Identifier

" Run sequentially?
" FIXME Not sure about this!
syn match runlabel /\(^\s*\)\@<=\w\+:/
highlight link runlabel Label

let b:current_syntax = 'kat'
