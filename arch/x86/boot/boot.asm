bits    16
org     0x7c00

Start:
    jmp     loader

msg     db  "Welcome to My Operating System!", 0

Print:
    lodsb
    or      al, al
    jz      PrintDone
    mov     ah, 0eh
    int     10h
    jmp Print

PrintDone:
    ret

loader:
    xor     ax, ax
    mov     ds, ax
    mov     es, ax

    mov     si, msg
    call    Print

    cli
    hlt

times 510 - ($-$$) db 0
dw      0xaa55
