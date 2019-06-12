data segment
m1 dd 12345678h
m2 dd 78563412h
result dd 0
data ends
code segment
    assume cs:code, ds:data
begin:
    mov ax, data
    mov ds, ax
    mov ax, word ptr m1
    add ax, word ptr m2
    mov word ptr result, ax
    mov ax, word ptr m1 + 2
    adc ax, word ptr m2 + 2
    mov word ptr result + 2, ax
    mov ah, 4ch
    int 21h
code ends
    end begin
