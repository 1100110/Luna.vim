"=============================================================================
" What Is This: Add some conceal operator for your luna files
" File:         luna.vim (conceal enhancement)
" Author:       Jude Young <0b1100110@gmail.com>
" Last Change:  2012 May 16
" Version:      0.1
" Require:      set nocompatible somewhere on your .vimrc


if exists('g:no_luna_conceal') || !has('conceal') || &encoding != 'utf-8'
    finish
end

"if exists('g:luna_small_unicode')
    "syntax match lunaNiceOperator "<-" conceal cchar=←
    "syntax match lunaNiceOperator "->" conceal cchar=→
    "syntax match lunaNiceOperator "=>" conceal cchar=⇒
"endif
"let g:luna_conceal_mod_path=1

"let g:luna_conceal_pub=1
" For those who don't want to see `::`...
"if exists('g:luna_conceal_mod_path')
    "syn match lunaNiceOperator "::" conceal cchar=∷
"endif

" For those who don't want to see `pub`...
"if exists('g:luna_conceal_pub')
    "syn match lunaPublicSigil contained "pu" conceal cchar=＊
    "syn match lunaPublicRest contained "b" conceal cchar=
    "syn match lunaNiceOperator "pub " contains=lunaPublicSigil,lunaPublicRest
"endif


syn match lunaRightArrowHead contained ">" conceal cchar= 
syn match lunaRightArrowTail contained "-" conceal cchar=⟶
syn match lunaNiceOperator "->" contains=lunaRightArrowHead,lunaRightArrowTail

syn match lunaFatRightArrowHead contained ">" conceal cchar= 
syn match lunaFatRightArrowTail contained "=" conceal cchar=⟹
syn match lunaNiceOperator "=>" contains=lunaFatRightArrowHead,lunaFatRightArrowTail

syntax match    lunaNiceOperator " / "  conceal cchar=÷
syntax match    lunaNiceOperator " \* " conceal cchar=∙
syntax keyword  lunaNiceStatement lambda conceal cchar=λ


syntax match lunaNiceOperator "==" conceal cchar=≡
syntax match lunaNiceOperator "!=" conceal cchar=≢
syntax match lunaNiceOperator "<=" conceal cchar=≲
syntax match lunaNiceOperator ">=" conceal cchar=≳

syntax match lunaNiceOperator ">>"   conceal cchar=»
syntax match lunaNiceOperator ".." conceal cchar=‥ 

hi link lunaNiceOperator Operator
hi! link Conceal Operator
setlocal conceallevel=2
