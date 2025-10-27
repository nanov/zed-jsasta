(function_declaration
  body: (_) @function.inside) @function.around

(call_expression) @call.around

(comment) @comment.around

(block) @block.around

(parameter) @parameter.around
