data segment
source db 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
count equ $-source
dest db count dup(0)
data ends
code segment
    assume cs:code, ds:data, es:data
begin:
    mov ax, data
    mov es, ax
    mov ds, ax
    lea si, source
    lea di, dest
    mov cx, count
ag:
    lods source
    or al, 20h
    stos dest
    loop ag
    mov ah, 4ch
    int 21h
code ends
    end begin
