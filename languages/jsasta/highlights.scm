; Variables
(identifier) @variable

; Parameters
(parameter
  name: (identifier) @variable.parameter)

; Types
(type_annotation) @type

((identifier) @type
  (#match? @type "^[A-Z][a-zA-Z0-9_]*$"))

[
  "int"
  "string"
  "bool"
  "void"
] @type.builtin

; Constants
((identifier) @constant
  (#match? @constant "^[A-Z][A-Z_0-9]+$"))

; Keywords
[
  "var"
  "let"
  "const"
] @keyword

[
  "struct"
] @keyword.type

"function" @keyword.function
"external" @keyword.function

"return" @keyword.return

[
  "if"
  "else"
] @keyword.conditional

[
  "for"
  "while"
  "break"
  "continue"
] @keyword.repeat

; Functions
(function_declaration
  name: (identifier) @function)

(external_declaration
  name: (identifier) @function)

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (member_expression
    property: (identifier) @function.call))

; Structs
(struct_declaration
  name: (identifier) @type)

(struct_field
  name: (identifier) @property)

; Variables
(variable_declaration
  name: (identifier) @variable)

; Properties and members
(member_expression
  property: (identifier) @property)

(pair
  key: (identifier) @property)
(pair
  key: (string) @property)

; Literals
(number) @number
(string) @string
(true) @boolean
(false) @boolean

; Operators
[
  "="
  "+="
  "-="
  "*="
  "/="
  "=="
  "!="
  "<"
  "<="
  ">"
  ">="
  "&&"
  "||"
  "!"
  "+"
  "-"
  "*"
  "/"
  "%"
  "++"
  "--"
  "<<"
  ">>"
  "&"
] @operator

; Punctuation
[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
  ";"
  ","
  "."
  ":"
] @punctuation.delimiter

"?" @punctuation.special
"..." @punctuation.special

; Comments
(comment) @comment
