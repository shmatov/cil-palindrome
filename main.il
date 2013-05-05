.assembly palindrome {}

.method static void Main()
{
    .entrypoint
    .maxstack 1

    ldstr "Hello world! :)"
    call void [mscorlib]System.Console::WriteLine(string)
    ret
}