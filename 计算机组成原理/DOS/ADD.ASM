data segment
buff db 6, ?, 6 dup (?)
count db 2
result dw ?
msg1 db 'invalid number', 0dh, 0ah, '$'
msg2 db 'overflow', 0dh, 0ah, '$'
data ends

code segment
	assume cs:code, ds:data
main proc far
	push ds
	mov ax, 0
	push ax
	mov ax, data
	mov ds, ax
in1:
	lea dx, buff
	mov ah, 0ah
	int 21h
	mov dl, 0ah
	mov ah, 02h
	int 21h
	mov bx, 0
	lea si, buff + 2
	mov ah, 0
	cld
l:
	lodsb
	cmp al, 30h
	jb err1
	cmp al, 39h
	ja err1
	and al, 0fh
	add bx, bx
	jc err2
	mov cx, bx
	add bx, bx
	jc err2
	add bx, bx
	jc err2
	add bx, cx
	jc err2
	add bx, ax
	jc err2
	dec buff + 1
	jnz l
	dec count
	jz in2
	mov result, bx
	jmp in1
in2:
	add bx, result
	jc err2
	mov ax, bx
	mov bh, 0ah
	mov cx, 0
out1:
	div bh
	mov bl, al
	mov al, ah
	or al, 30h
	and ax, 00ffh
	push ax
	inc cx
	mov al, bl
	and ax, 00ffh
	cmp ax, 0h
	jne	out1
out2:
	pop dx
	mov ah, 02h
	int 21h
	dec cx
	jnz out2
done:
	ret
err1:
	lea dx, msg1
	jmp output
err2:
	lea dx, msg2
output:
	mov ah, 09h
	int 21h
	jmp done
main endp
code ends
	end main