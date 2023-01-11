if exists("b:current_syntax")
    finish
endif

" raja syntax definition for vi/vim
syntax sync fromstart

" prefer hard tabs
set noexpandtab

" operators
syntax match rajaOp "\v\+"
syntax match rajaOp "\v\-"
syntax match rajaOp "\v\*"
syntax match rajaOp "\v\/"
syntax match rajaOp "\v\%"

syntax match rajaOp "\v\&"
syntax match rajaOp "\v\|"
syntax match rajaOp "\v\^"

syntax match rajaOp "\v\>"
syntax match rajaOp "\v\<"
syntax match rajaOp "\v\="
syntax match rajaOp "\v\>\="
syntax match rajaOp "\v\<\="
syntax match rajaOp "\v\!\="
highlight link rajaOp Operator

syntax match rajaDelim "\v\:"
syntax match rajaDelim "\v\,"
syntax match rajaDelim "\v\."
highlight link rajaDelim Delimiter

syntax keyword rajaKeyword match
syntax keyword rajaKeyword alias
highlight link rajaKeyword Keyword


syntax keyword rajaBuiltin __print
syntax keyword rajaBuiltin __string
syntax keyword rajaBuiltin __args
highlight link rajaBuiltin Include


" functions
syntax match rajaFunction "\v\=\>"
highlight link rajaFunction Type

" bools
syntax keyword rajaBool true false
highlight link rajaBool Boolean

" constants
syntax keyword rajaConst _
highlight link rajaConst Constant

" numbers should be consumed first by identifiers, so comes before
syntax match rajaNumber "\v\d+"
syntax match rajaNumber "\v\d+\.\d+"
highlight link rajaNumber Number

syntax match rajaFnIdentifier "\v[A-Za-z_!][A-Za-z0-9_!?]*\ *\=*\ *\(" contains=rajaFnIdentifierName
syntax match rajaFnIdentifierName "\v[A-Za-z_][A-Za-z0-9_!?]*" contained
highlight link rajaFnIdentifierName Identifier

" functions
syntax match rajaFnCall "\v[A-Za-z_!][A-Za-z0-9_!?]*\(" contains=rajaFunctionName
syntax match rajaFunctionName "\v[A-Za-z_][A-Za-z0-9_!?]*" contained
highlight link rajaFunctionName Function

syntax match rajaTypeName "\v[A-Z][a-z]*"
highlight link rajaTypeName Type

" strings
syntax region rajaString start=/\v"/ skip=/\v(\\.|\r|\n)/ end=/\v"/
highlight link rajaString String

" comment
syntax match rajaLineComment "\v\#.*" contains=rajaTodo,rajaNote
highlight link rajaLineComment Comment

" -- shebang, highlighted as comment
syntax match rajaShebangComment "\v^#!.*"
highlight link rajaShebangComment Comment

" -- TODO in comments
syntax match rajaTodo "\v(TODO\(.*\)|TODO)" contained
highlight link rajaTodo Todo
syntax match rajaNote "\v(NOTE\(.*\)|NOTE)" contained
highlight link rajaNote Note

" syntax-based code folds
syntax region rajaExpressionList start="(" end=")" transparent fold
syntax region rajaMatchExpression start="{" end="}" transparent fold
syntax region rajaComposite start="\v\[" end="\v\]" transparent fold
set foldmethod=syntax

let b:current_syntax = "raja"
