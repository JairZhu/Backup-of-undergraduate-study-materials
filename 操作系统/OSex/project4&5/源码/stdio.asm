extrn _input:near

.8086
_TEXT segment byte public 'CODE'
assume cs:_TEXT
DGROUP group _TEXT,_DATA,_BSS
org 100h

start:
	
public _printChar
_printChar proc 
	push bp
		mov bp,sp
		mov al,[bp+4]
		mov bl,0
		mov ah,0eh
		int 10h
		mov sp,bp
	pop bp
	ret
_printChar endp


public _getChar
_getChar proc
	mov ah,0
	int 16h
	mov byte ptr[_input], al
	ret
_getChar endp

public _cls
_cls proc 
; 清屏
        push ax
        push bx
        push cx
        push dx		
			mov	ax, 600h	; AH = 6,  AL = 0
			mov	bx, 700h	; 黑底白字(BL = 7)
			mov	cx, 0		; 左上角: (0, 0)
			mov	dx, 184fh	; 右下角: (24, 79)
			int	10h		; 显示中断
			
			mov ah, 02h
			mov bh, 0
			mov dx, 0100h
			int 10h
		pop dx
		pop cx
		pop bx
		pop ax
		ret
_cls endp


Delay:
	push ax
	push cx
	
	mov ax, 400
loop1:
	mov cx, 50000
loop2:
	loop loop2
	dec ax
	cmp ax, 0
	jne loop1
	
	pop cx
	pop ax
	ret
	

public _sleep
_sleep proc
	push cx
	mov cx, 50
loop3:
	call Delay
	loop loop3
	pop cx
	ret
_sleep endp

_TEXT ends

_DATA segment word public 'DATA'

_DATA ends

_BSS	segment word public 'BSS'
_BSS ends

end start