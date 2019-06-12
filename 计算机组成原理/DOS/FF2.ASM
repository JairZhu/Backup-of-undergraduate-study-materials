data segment
source dw 1,2,3,4,5,6,7,8
count equ ($-source)/2
dest dw 0,0
data ends
extra segment
code segment
    assume cs:code,ds:data,es:extra
start:
    mov ax,data
    mov ds,ax
    mov bx,extra
    mov es,bx
    lea si,source
    lea di,dest
    mov cx,count
    rep movsw
    mov ah,4ch
    int 21h
code ends
end start
