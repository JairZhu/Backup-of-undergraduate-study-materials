data segment
buffer db 5, 0, 6 dup (0)
m2 dw 0
data ends
code segment
    assume cs:code, ds:data
begin:
    mov ax, data
    mov ds, ax
    lea ds, buffer
    mov ah, 0ah
    int 21h

