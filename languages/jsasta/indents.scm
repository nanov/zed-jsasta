(block
  "{" @indent
  "}" @outdent) @indent

(function_declaration
  body: (block) @indent)

(if_statement
  consequence: (_) @indent
  alternative: (_)? @indent)

(for_statement
  body: (_) @indent)

(while_statement
  body: (_) @indent)

(array_expression
  "[" @indent
  "]" @outdent)

(object_expression
  "{" @indent
  "}" @outdent)
