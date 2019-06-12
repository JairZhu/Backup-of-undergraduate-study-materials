data segment
name1 db 'HELLO WORLD', 0dh, 0ah, '$'
data ends
code segment
assume cs:code,ds:data

begin:
    mov ax,data
    mov ds,ax
    lea dx,name1
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h                  
code ends
    end begin
