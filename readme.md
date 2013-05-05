Directives
==========
* `.entrypoint` — defines the application entry point (the function called by .NET Runtime when the program starts).
* `.maxstack` — defines the maximum stack depth used by the function code. The C# compiler sets always the exact value for each function. In the sample project, I set this value to 8.

Commands
========
* `ldstr _string_` — loads the string constant onto the stack.
* `call _function(parameters)_` — calls the static function. Parameters for the function should be loaded onto the stack before this call
* `pop` — pops a value from the stack. Used when we don't need to store a value in the variable.
* `ret` — returns from a function.
