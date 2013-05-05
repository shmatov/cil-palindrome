Directives
==========
* `.entrypoint` — defines the application entry point (the function called by .NET Runtime when the program starts).
* `.maxstack` — defines the maximum stack depth used by the function code. The C# compiler sets always the exact value for each function. In the sample project, I set this value to 8.

Commands
========
* `ldstr string` — loads the string constant onto the stack.
* `call function(parameters)` — calls the static function. Parameters for the function should be loaded onto the stack before this call
* `callvirt <method>` - call a method associated with an object.
* `stloc name` - pop a value from stack into local variable.
* `ldloc name` - load local variable onto stack.
* `pop` — pops a value from the stack. Used when we don't need to store a value in the variable.
* `ret` — returns from a function.
* `ldarg name` - load argument onto the stack.
* `ldlen` - push the length of array on the stack.
* `conv.i4` - convert to int32, pushing int32 on stack.
