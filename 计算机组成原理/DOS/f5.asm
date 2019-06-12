data segment
source dw 1,2,3,4,5,6,7,8,0,1,3,63,87,0,3,90,32,90,2,6,28,37,9,0,4
count equ ($-source)/2
dest dw 0,0
data ends

code segment
    assume cs:code, ds:data, es:data
begin:
    mov ax, data
    mov ds, ax
    mov es, ax
    lea si, source
	add si, 2*count-2
    lea di, dest
	add di, 2
    mov cx, count
	std 
    rep movsw
    mov ah, 4ch
    int 21h
code ends
    end begin
