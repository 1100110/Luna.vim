" Vim syntax file
" Language:     Luna 
" Maintainer:   Jude Young <0b1100110@gmail.com>
" Last Change:  2012 May 21

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Support cpoptions
"let s:cpo_save = &cpo
"set cpo&vim

"let b:current_syntax = "luna"

syn keyword lunaConditional if else elseif
syn keyword lunaPackage     extern import export module priv pub log nextgroup=lunaIdentifier skipwhite
syn keyword lunaKeyword     for foreach if else elseif end ret return
syn keyword lunaKeyword     do while loop 

syn keyword lunaKeyword     mod struct class enum nextgroup=lunaIdentifier skipwhite
syn keyword lunaKeyword     fn template pure nextgroup=lunaFuncName skipwhite
syn keyword lunaKeyword     assert throw nothrow new delete
syn keyword lunaBuiltin     typeof stringof cast typedef define basetype 

syn keyword lunaStorage     let imut mut ref scope shared static global nextgroup=lunaIdentifier skipwhite

syn match lunaIdentifier    contains=lunaIdentifierPrime "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match lunaFuncName      "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

" reserved
syn keyword lunaType        int uint 
syn keyword lunaType        float half real 
syn keyword lunaType        char bool byte u8 u16 u32 u64 i8 i16 i32 i64 f16 f32 f64 
syn keyword lunaType        str

syn keyword lunaType        d_short d_int d_uint d_long d_ulong c_ulong c_void 
syn keyword lunaType        size_t ptrdiff_t clock_t time_t

syn keyword   lunaSelf        self
syn keyword   lunaBoolean     true false ()

syn keyword   lunaConstant    Ok Err          " result
syn keyword   lunaConstant    Cons Nil        " list
" syn keyword lunaConstant    empty node      " tree

" If foo::bar changes to foo.bar, change this ("::" to "\.").
" If foo::bar changes to Foo::bar, change this (first "\w" to "\u").
"syn match     rustModPath     "\w\(\w\)*::[^<]"he=e-3,me=e-3
"syn match     rustModPathSep  "::"

syn match     lunaFuncCall    "\w\(\w\)*("he=e-1,me=e-1
"syn match     lunaFuncCall    "\w\(\w\)*::<"he=e-3,me=e-3 " foo::<T>();

syn match     lunaFormat      display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlLjzt]\|ll\|hh\)\=\([aAbdiuoxXDOUfFeEgGcCsSpn?]\|\[\^\=.[^]]*\]\)" contained
syn region    lunaString      start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=lunaTodo,lunaFormat

syn region    lunaAttribute   start="#\[" end="\]" contains=lunaString

" Number literals
syn match     lunaNumber      display "\<[0-9][0-9_]*\>"
syn match     lunaNumber      display "\<[0-9][0-9_]*\(u\|u8\|u16\|u32\|u64\)\>"
syn match     lunaNumber      display "\<[0-9][0-9_]*\(i8\|i16\|i32\|i64\)\>"

syn match lunaHexNumber   display "\<0x[a-fA-F0-9_]\+\>"
syn match lunaHexNumber   display "\<0x[a-fA-F0-9_]\+\(u\|u8\|u16\|u32\|u64\)\>"
syn match lunaHexNumber   display "\<0x[a-fA-F0-9_]\+\(i8\|i16\|i32\|i64\)\>"
syn match lunaBinNumber   display "\<0b[01_]\+\>"
syn match lunaBinNumber   display "\<0b[01_]\+\(u\|u8\|u16\|u32\|u64\)\>"
syn match lunaBinNumber   display "\<0b[01_]\+\(i8\|i16\|i32\|i64\)\>"

syn match lunaFloat       display "\<[0-9][0-9_]*\(f\|f16\|f32\|f64\)\>"
syn match lunaFloat       display "\<[0-9][0-9_]*\.[0-9_]\+\>"
syn match lunaFloat       display "\<[0-9][0-9_]*\.[0-9_]\+\(f\|f16\|f32\|f64\)\>"

"rustLifetime must appear before rustCharacter, or chars will get the lifetime highlighting
syn match lunaLifetime    display "\'\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*"
syn match lunaCharacter   "'\([^'\\]\|\\\(['nrt\\\"]\|x\x\{2}\|u\x\{4}\|U\x\{8}\)\)'"

syn region  lunaCommentDoc  start="/\*[\*!]" end="\*/"
syn region  lunaCommentDoc  start="//[/!]" skip="\\$" end="$" keepend
syn match   lunaComment     "/\*\*/"
syn match   lunaComment     "\#\*"
syn region  lunaComment     start="/\*\([^\*!]\|$\)" end="\*/" contains=lunaTodo
syn region  lunaComment     start="//\([^/!]\|$\)" skip="\\$" end="$" contains=lunaTodo keepend

syn keyword lunaTodo contained TODO FIXME XXX NB BUG NOTE HACK HELP

hi def link lunaHexNumber       lunaNumber
hi def link lunaBinNumber       lunaNumber
hi def link lunaIdentifierPrime lunaIdentifier

hi def link lunaFormat        Special
hi def link lunaString        String
hi def link lunaCharacter     Character
hi def link lunaNumber        Number
hi def link lunaBoolean       Boolean
hi def link lunaConstant      Constant
hi def link lunaSelf          Constant
hi def link lunaFloat         Float
hi def link lunaOperator      Operator
hi def link lunaKeyword       Keyword
hi def link lunaConditional   Conditional
hi def link lunaIdentifier    Identifier
hi def link lunaModPath       Include
hi def link lunaFuncName      Function
hi def link lunaCommentDoc    SpecialComment
hi def link lunaComment       Comment
hi def link lunaType          Type
hi def link lunaTodo          Todo
hi def link lunaAttribute     PreProc
hi def link lunaStorage       StorageClass
hi def link lunaLifetime      Special

" Other Suggestions:
" hi rustMacro ctermfg=magenta

syn sync minlines=200
syn sync maxlines=500

let b:current_syntax = "luna"
