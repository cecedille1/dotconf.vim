"Dotconf vim syntax file
"By Grégoire ROCHER <gr@enix.org>
"for DotConf files https://github.com/NaPs/Dotconf

if exists("b:current_syntax")
  finish
end

syn keyword dotConfUnit k
syn keyword dotConfUnit M
syn keyword dotConfUnit G
syn keyword dotConfUnit T
syn keyword dotConfUnit P
syn keyword dotConfUnit E
syn keyword dotConfUnit Z
syn keyword dotConfUnit Y
syn keyword dotConfUnit Ki
syn keyword dotConfUnit Mi
syn keyword dotConfUnit Gi
syn keyword dotConfUnit Ti
syn keyword dotConfUnit Pi
syn keyword dotConfUnit Ei
syn keyword dotConfUnit Zi
syn keyword dotConfUnit Yi
syn match dotConfNumber '\v[-+]?[0-9]+(\.[0-9]+)?' contained skipwhite nextgroup=dotConfUnit

syn region dotConfText start=+"+ skip=/\\"/ end=+"+ contained
syn region dotConfText start=+'+ skip=/\\'/ end=+'+ contained

syn keyword dotConfList , contained nextgroup=@dotConfValues
syn keyword dotConfNO no contained
syn keyword dotConfYES yes contained
syn match dotConfName '^ *[a-zA-Z_][a-zA-Z0-9_-]*' contained
syn cluster dotConfValuesRaw contains=dotConfNO,dotConfYES,dotConfText,dotConfNumber
syn cluster dotConfValues contains=@dotConfValuesRaw,dotConfList

syn keyword dotConfInclude include nextgroup=dotConfText skipwhite

syn keyword dotConfEqual =
syn region dotConfVariable start='^' end='$' contains=dotConfName,dotConfEqual,@dotConfValues skipwhite oneline

syn cluster dotConfStatement contains=dotConfInclude,dotConfVariable,dotConfSection

syn match dotConfComment ' *#.*$'

hi def link dotConfComment Comment
hi def link dotConfInclude Keyword
hi def link dotConfText String
hi def link dotConfNumber Type
hi def link dotConfEqual Operator
hi def link dotConfYES Boolean
hi def link dotConfNO Boolean
hi def link dotConfName Identifier

