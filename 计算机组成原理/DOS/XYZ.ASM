data segment
da1 db 1h,2h,3h,4h,5h,6h,7h,8h,9h,0ah
da2 db 0ah,9h,8h,7h,6h,5h,4h,3h,2h,1h
op db 1,0,1,1,0,1,0,0,1,0
result db 10 dup (?)
data ends

code segment
    assume cs:code, ds:data, es:data
begin:
    mov ax, data
    mov ds, ax
	mov es, ax
    lea si, da1
    lea di, result
    lea bx, da2
	mov cx, 0ah
L:
    lodsb
	mov ah, [bx + 0ah]
    cmp ah, 1h
	jne sub1
	add al, [bx]
	jmp next
sub1:
	sub al, [bx]
next:
	add bx, 1
	stosb
	loop L
	mov ah, 4ch
	int 21h
code ends
	end begin
