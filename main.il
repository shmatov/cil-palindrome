.assembly palindrome {}

.namespace Palindrome
{
    .method static void Main()
    {
        .entrypoint
        .maxstack 3
    
        .locals (char[] word)
    
        call char[] ReadWord()
        stloc word
    
        // word
        ldloc word
        // head
        ldc.i4.0
        //tail
        ldloc word
        call int32 LastWordIndex(char[])
    
        call bool IsPalindrome(char[], int32, int32)
        call void [mscorlib]System.Console::Write(bool)
        ret
    }
    
    .method static char[] ReadWord()
    {
        .maxstack 1
        call string [mscorlib]System.Console::ReadLine()
        callvirt instance char[] string::ToCharArray()
        ret
    }
    
    .method static int32 LastWordIndex(char[] word)
    {
        .maxstack 2
        ldarg word
        ldlen
        conv.i4
        call int32 Dec(int32)
        ret
    }
    
    .method static bool IsPalindrome(char[] word, int32 head, int32 tail)
    {
        .maxstack 3
        ldarg head
        ldarg tail
        bge YEP

        ldarg word
        ldarg head
        ldelem char
    
        ldarg word
        ldarg tail
        ldelem char
    
        beq EQUAL
        ldc.i4.0
        ret
    
    EQUAL:
        ldarg word
        ldarg head
        call int32 Inc(int32)
        ldarg tail
        call int32 Dec(int32)
        call bool IsPalindrome(char[], int32, int32)
        ret

    YEP:
        ldc.i4.1
        ret
    }

    .method static int32 Inc(int32 num)
    {
        .maxstack 2
        ldarg num
        ldc.i4.1
        add
        ret
    }

    .method static int32 Dec(int32 num)
    {
        .maxstack 2
        ldarg num
        ldc.i4.1
        sub
        ret
    }
}