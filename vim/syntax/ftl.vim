" Vim syntax file
" Language:	FreeMarker
" Maintainer:	Li Chengwen <chengwen.li@travelzen.com>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'ftl'
endif

" Source HTML syntax
if version < 600
  source <sfile>:p:h/html.vim
else
  runtime! syntax/html.vim
endif
unlet b:current_syntax

" Next syntax items are case-sensitive
syn case match

" directives and interpolations
syn region ftlStartDirective start=+<#+ end=+>+ contains=ftlKeyword, ftlDirective, ftlString, ftlComment
syn region ftlEndDirective start=+</#+ end=+>+ contains=ftlDirective
syn region ftlStartDirectiveAlt start=+\[#+ end=+\]+ contains=ftlKeyword, ftlDirective, ftlString, ftlComment
syn region ftlEndDirectiveAlt start=+\[/#+ end=+\]+ contains=ftlDirective
syn region ftlStartUserDirective start=+<@+ end=+>+ contains=ftlString, ftlComment
syn region ftlEndUserDirective start=+</@+ end=+>+
syn region ftlStartUserDirectiveAlt start=+\[@+ end=+\]+ contains=ftlString, ftlComment
syn region ftlEndUserDirectiveAlt start=+\[/@+ end=+\]+
syn region ftlInterpolation start=+${+ end=+}+
syn region ftlInterpolation2 start=+#{+ end=+}+
syn region ftlString contained start=+"+ end=+"+
syn region ftlComment start=+<#--+ end=+-->+
syn region ftlCommentAlt start=+\[#--+ end=+--\]+

" keywords
syn keyword ftlDirective contained list if else macro import include switch case break
syn keyword ftlDirective contained assign local global nested recurse fallback visit
syn keyword ftlDirective contained function return t rt lt nt ftl
syn keyword ftlKeyword contained as in using

" Redefine htmlTag so that it can contain freemarkerExpr
syn clear htmlTag
syn region htmlTag start=+<[^/%]+ end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster,javaScript

" redefine string in html tags
syn region  htmlString   contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,ftlInterpolation,ftlStartDirective,ftlEndDirective,ftlStartUserDirective,ftlEndUserDirective
syn region  htmlString   contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,ftlInterpolation,ftlStartDirective,ftlEndDirective,ftlStartUserDirective,ftlEndUserDirective


" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ FtlHiLink hi link <args>
else
  command! -nargs=+ FtlHiLink hi def link <args>
endif

FtlHiLink ftlKeyword Statement
FtlHiLink ftlDirective Statement
FtlHiLink ftlStartDirective Function
FtlHiLink ftlEndDirective Function
FtlHiLink ftlStartUserDirective Function
FtlHiLink ftlEndUserDirective Function
FtlHiLink ftlInterpolation Constant
FtlHiLink ftlInterpolation2 Constant
FtlHiLink ftlString Constant
FtlHiLink ftlComment Comment

delcommand FtlHiLink

let b:current_syntax = "ftl"

" vim: ts=8
