" Vim syntax file
" Language:	TritiumScript

if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'tritiumscript'
endif


" Comments
syn keyword tritiumScriptCommentTodo   TODO FIXME XXX TBD HC SJ AF contained
syn match   tritiumScriptLineComment   "#.*" contains=tritiumScriptCommentTodo
syn match   tritiumScriptLineComment	 "//.*"

" Block comments - sync w C style comments to get all that nesting logic
syn region  tritiumScriptBlockComment   start="/\*"  end="\*/"
syn sync ccomment tritiumScriptBlockComment

" Strings - gets quite complicated; copied from JS syntax file
syn match   tritiumScriptSpecial	  "\\\d\d\d\|\\."
syn region  tritiumScriptStringD	  start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javaScriptSpecial,@htmlPreproc
syn region  tritiumScriptStringS	  start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javaScriptSpecial,@htmlPreproc
syn region  tritiumScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

" Tritium keywords
syn keyword tritiumScriptDebug          log
syn keyword tritiumScriptBase           var match with read fetch asset script concat export dump
syn keyword tritiumScriptNode           select $ text attribute move_here move_to copy_here copy_to
syn keyword tritiumScriptNode           name remove wrap inner_wrap
syn keyword tritiumScriptNode           inject_top inject_bottom inject_after inject_before inject_at inject
syn keyword tritiumScriptNode           insert_top insert_bottom insert_after insert_before insert_at insert
syn keyword tritiumScriptXMLNode        cdata inner wrap_text_children add_class insert_javascript
syn keyword tritiumScriptAttribute      remove value name
syn keyword tritiumScriptText           rewrite set replace xml xhtml html prepend append clear

" Rotor keywords
syn keyword tritiumScriptRotor          test go select match? nomatch? click type select_option select_option? switch_to_frame
syn keyword tritiumScriptRotor          switch_to_window optimize_page page_content_changed?

" TODO: variables enclosed in brackets should be captured
syn match tritiumScriptVariable         "$\h\w*" display
syn match tritiumScriptInstruction      "@\h\w*"  display

syn match   tritiumScriptBraces	   "[{}\[\]]"
syn match   tritiumScriptParens	   "[()]"

syn sync fromstart
syn sync maxlines=100

" Color this guy
hi def link tritiumScriptLineComment	      Comment
hi def link tritiumScriptBlockComment	      Comment
hi def link tritiumScriptCommentTodo	      Todo

hi def link tritiumScriptSpecial            Special
hi def link tritiumScriptStringD	          String
hi def link tritiumScriptStringS	          String
hi def link tritiumScriptRegexpString       String

hi def link tritiumScriptDebug              Debug
hi def link tritiumScriptBase               Define

hi def link tritiumScriptNode               Function
hi def link tritiumScriptXMLNode            Function
hi def link tritiumScriptPositional         Operator
hi def link tritiumScriptAttribute          Operator
hi def link tritiumScriptText               Operator

hi def link tritiumScriptBraces             Function
hi def link tritiumScriptParens             Function
hi def link tritiumScriptVariable           Type
hi def link tritiumScriptInstruction        Type

hi def link tritiumScriptRotor              Type

" Define Type Include
"
let b:current_syntax = "tritiumscript"
if main_syntax == 'tritiumscript'
  unlet main_syntax
endif

" TODO: include HTML syntax file so that stuff works as well
" TODO: advanced - add some tritium based rules (value worked on inside attribute etc)

" vim: ts=2
