.assembly palindrome {}

.method static void Main()
{
    .entrypoint
    .locals (string word)
    .maxstack 1

    ldstr "Hello world! :)"
    call void [mscorlib]System.Console::WriteLine(string)
    call string [mscorlib]System.Console::ReadLine()
    stloc word
    ret
}