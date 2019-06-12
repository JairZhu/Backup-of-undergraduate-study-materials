; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;                              klib.asm
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


;=========================================================================
;					void _run();
;=========================================================================
;加载并运行程序
public _run
_run proc	
	mov ax,cs
	mov es,ax 		                ;设置段地址, 存放数据的内存基地址
	mov bx,0B100h				; ES:BX=读入数据到内存中的存储地址
	mov ah,2 		                ; 功能号
	mov al,1 	                	; 要读入的扇区数 1
	mov dl,0                 		; 软盘驱动器号（对硬盘和U盘，此处的值应改为80H）
	mov dh,0 		                ; 磁头号
	mov ch,0                 		; 柱面号
	mov cl,byte ptr[_pro]          	; 起始扇区号（编号从1开始）
	int 13H 		                ; 调用13H号中断
	
	mov bx, 0B100h
	jmp bx                    ; 跳转到该内存地址
_run endp


;****************************
; void _cls()               *
;****************************
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
			mov dx, 0000h
			int 10h
		pop dx
		pop cx
		pop bx
		pop ax
		ret
_cls endp


;********************************************************
; void _printChar(char ch)                            *
;********************************************************
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


;****************************
; void _getChar()           *
;****************************

public _getChar
_getChar proc
	mov ah,0
	int 16h
	mov byte ptr [_input], al
	ret
_getChar endp

