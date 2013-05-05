.assembly palindrome {}

.method static void Main()
{
    .entrypoint
    .locals (char[] word, int32 length)
    .maxstack 1

    ldstr "Hello world! :)"
    call void [mscorlib]System.Console::WriteLine(string)
    call char[] ReadWord()
    stloc word
    ldloc word
    call int32 WordLength(char[])
    stloc length
    ldloc length
    call void [mscorlib]System.Console::Write(int32)
    ret
}

.method static char[] ReadWord()
{
    .maxstack 1
    call string [mscorlib]System.Console::ReadLine()
    callvirt instance char[] string::ToCharArray()
    ret
}

.method static int32 WordLength(char[] word)
{
    .maxstack 1
    ldarg word
    ldlen
    conv.i4
    ret
}