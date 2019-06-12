data segment
source db 1,2,3,4,5,6,7,8,9,10,10h,56h,34h,90h,89h
count equ $-source
dest db count dup (0)
data ends

code segment
    assume cs:code, ds:data
begin:
    mov ax, data
    mov ds, ax
    mov es, ax
    mov cx, count
    lea si, source
    lea di, dest
again:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    dec cx
    jnz again
    mov ah, 4ch
    int 21h
code ends
    end begin

