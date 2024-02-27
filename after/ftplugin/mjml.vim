let b:match_words =
  \ '{\|\<\%(if\|unless\|case\|while\|until\|for\|do\|class\|module\|def\|=\@<!begin\)\>=\@!' .
  \ ':' .
  \ '\<\%(else\|elsif\|ensure\|when\|rescue\|break\|redo\|next\|retry\)\>' .
  \ ':' .
        \ '}\|\%(^\|[^.\:@$=]\)\@<=\<end\:\@!\>' .
        \ ',^=begin\>:^=end\>,' .
  \ ',\[:\],(:)'

let b:match_skip =
	\ "synIDattr(synID(line('.'),col('.'),0),'name') =~ '" .
	\ "\\<ruby\\%(String\\|.\+Delimiter\\|Character\\|.\+Escape\\|" .
        \ "Regexp\\|Interpolation\\|Comment\\|Documentation\\|" .
	\ "ConditionalModifier\\|RepeatModifier\\|RescueModifier\\|OptionalDo\\|" .
	\ "MethodName\\|BlockArgument\\|KeywordAsMethod\\|ClassVariable\\|" .
	\ "InstanceVariable\\|GlobalVariable\\|Symbol\\)\\>'"
