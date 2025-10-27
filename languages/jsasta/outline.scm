(function_declaration
  name: (identifier) @name) @item

(external_declaration
  name: (identifier) @name) @item

(struct_declaration
  name: (identifier) @name) @item

(variable_declaration
  name: (identifier) @name
  value: [
    (function_declaration)
  ]) @item
