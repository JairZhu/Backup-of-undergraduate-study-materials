data segment
source dw 1,2,3,4,5,6,7,8,0,1,3,63,87,0,3,90,32,90,2,6,28,37,9,0,4
count equ ($-source)/2
dest dw count dup (0)
data ends

code segment
    assume cs:code, ds:data, es:data
begin:
    mov ax, data
    mov ds, ax
    mov bx, data
    mov es, bx
    lea si, source
    lea di, dest
    mov cx, count
    rep movsw
    mov ah, 4ch
    int 21h
code ends
    end begin
