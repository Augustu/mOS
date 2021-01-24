org     0x0
bits    16

jmp     main

Print:
        lodsb
        or          al, al
        jz          PrintDone
        mov         ah, 0eh
        int         10h
        jmp         Print

PrintDone:
        ret

main:
        cli
        push        cs
        pop         ds

        mov         si, Msg
        call        Print

        cli
        hlt

Msg     db          "Preparing to load operating system...", 13, 10, 0

