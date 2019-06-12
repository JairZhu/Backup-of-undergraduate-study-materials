; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;                              klib.asm
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


;=========================================================================
;					void _run_test();
;=========================================================================
;加载并运行程序
public _run_test
_run_test proc

	xor ax, ax
	mov es, ax
	
	mov ax,1000h
	mov es,ax 		                ;设置段地址, 存放数据的内存基地址
	mov bx,100h						; ES:BX=读入数据到内存中的存储地址
	mov ah,2 		                ; 功能号
	mov al,2 	                	; 要读入的扇区数 2
	mov dl,0                 		; 软盘驱动器号（对硬盘和U盘，此处的值应改为80H）
	mov dh,0 		                ; 磁头号
	mov ch,0                 		; 柱面号
	mov cl,9			          	; 起始扇区号（编号从1开始）
	int 13H 		                ; 调用13H号中断
	
	mov word ptr ds:[0], 0100h
	mov word ptr ds:[2], 1000h
	
	jmp dword ptr ds:[0]                       ; 跳转到该内存地址
_run_test endp


;=========================================================================
;					void _run();
;=========================================================================
;加载并运行程序
public _run
_run proc

	xor ax, ax
	mov es, ax
	mov word ptr es:[24h], offset KeyInt
	mov word ptr es:[26h], cs
	
	mov ax,1000h
	mov es,ax 		                ;设置段地址, 存放数据的内存基地址
	mov bx,100h						; ES:BX=读入数据到内存中的存储地址
	mov ah,2 		                ; 功能号
	mov al,1 	                	; 要读入的扇区数 1
	mov dl,0                 		; 软盘驱动器号（对硬盘和U盘，此处的值应改为80H）
	mov dh,0 		                ; 磁头号
	mov ch,0                 		; 柱面号
	mov cl,byte ptr[_pro]          	; 起始扇区号（编号从1开始）
	int 13H 		                ; 调用13H号中断
	
	mov word ptr ds:[0], 0100h
	mov word ptr ds:[2], 1000h
	
	jmp dword ptr ds:[0]                       ; 跳转到该内存地址
	
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
			mov dx, 0100h
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


;****************************
; 时钟中断程序              *
;****************************
Timer:
	push ax								;寄存器压栈
	push bx
	push cx
	push dx
	push bp
    push es
	push ds
	
	dec byte ptr es:[cccount]				;递减计数变量
	jnz fin								; >0 跳转
	inc byte ptr es:[tmp]				;自增tmp
	cmp byte ptr es:[tmp], 1			;根据tmp选择显示内容
	jz ch1								;1显示‘/’
	cmp byte ptr es:[tmp], 2			;2显示‘|’
	jz ch2
	cmp byte ptr es:[tmp], 3			;3显示‘\’
	jz ch3
	cmp byte ptr es:[tmp], 4			;4显示‘-’
	jz ch4
	jmp showch
	
ch1:
	mov bp, offset str1
	jmp showch
	
ch2:
	mov bp, offset str2
	jmp showch
	
ch3:
    mov bp,offset str3
	jmp showch
	
ch4:
	mov byte ptr es:[tmp],0
	mov bp, offset str4
	jmp showch
	
showch:
	mov ah,13h 	                        ; 功能号
	mov al,0                     		; 光标放到串尾
	mov bl,0Fh 	                        ; 0000：黑底、1111：亮白字
	mov bh,0 	                    	; 第0页
	mov dh,24 	                        ; 第24行
	mov dl,78 	                        ; 第78列
	mov cx,1 	                        ; 串长为 1
	int 10h 	                    	; 调用10H号中断
	mov byte ptr es:[cccount],dddelay
	
fin:
	mov al,20h					        ; AL = EOI
	out 20h,al						    ; 发送EOI到主8529A
	out 0A0h,al					        ; 发送EOI到从8529A
	
	pop ds
	pop es                              ; 恢复寄存器信息
	pop bp
	pop dx 
	pop cx
	pop bx
	pop ax
	iret		
	
	str1 db '/'
	str2 db '|'
	str3 db '\'
	str4 db '-'
	dddelay equ 8					        ; 计时器延迟计数
	cccount db dddelay					     ; 计时器计数变量，初值=dddelay
	tmp db 0

;****************************
; 33号中断系统调用服务程序  *
;****************************
int_21h:
	push bp
	push ds
	push es
	
	mov bx, cs
	mov ds, bx
	mov es, bx
	
	cmp ah, 1
	je showstring1
	cmp ah, 2
	je showstring2
	cmp ah, 3
	je showstring3
	jmp end21h
	
showstring1:
	mov bp, offset string1
	mov dh, 3
	mov dl, 6
	mov cx, 28
	mov bl, 0ah
	jmp showstring
	
showstring2:
	mov bp, offset string2
	mov dh, 5
	mov dl, 37
	mov cx, 43
	mov bl, 0fh
	jmp showstring
	
showstring3:
	mov bp, offset string3
	mov dh, 19
	mov dl, 8
	mov bl, 71h
	mov cx, 10
	jmp showstring
	
showstring:
	mov ah, 13h
	mov al, 0
	mov bh, 0
	int 10h
	
end21h:
	pop es
	pop ds
	pop bp
	iret
	
string1 db "I Love The Operating System!"
string2 db "When call system server, you will see this!"
string3 db "Thank you!"

;****************************
; 34号中断程序              *
;****************************
int_34:
	push ds
	push es
	push bp
	
	mov ax, cs
	mov ds, ax
	mov es, ax
	mov ah, 13h
	mov al, 0
	mov bl, 0ah
	mov bh, 0
	mov dh, 0
	mov dl, 0
	mov bp, offset mes1
	mov cx, 360
	int 10h
	
	pop bp
	pop es
	pop ds
	iret
	
mes1:
	db "    ====================    ", 0ah, 0dh
	db "   =    **    **   **   =   ", 0ah, 0dh
	db "  =     **    **   **    =  ", 0ah, 0dh
	db " =      **    **          = ", 0ah, 0dh
	db "=       ********   **      =", 0ah, 0dh
	db "=       ********   **      =", 0ah, 0dh
	db " =      **    **   **     = ", 0ah, 0dh
	db "  =     **    **   **    =  ", 0ah, 0dh
	db "   =    **    **   **   =   ", 0ah, 0dh
	db "    ====================    ", 0ah, 0dh
	db "                        =   ", 0ah, 0dh
	db "                         =  ", 0ah, 0dh
	
;***********************************
;*  void _int34()                  *
;***********************************
public _int34
_int34 proc
	int 34
	ret
_int34 endp
	
	
;****************************
; 35号中断程序              *
;****************************
int_35:
	push bp
	push ds
	push es
	
	mov ax, cs
	mov ds, ax
	mov es, ax
	mov ah, 13h
	mov al, 0
	mov bl, 0Eh
	mov bh, 0
	mov dh, 6
	mov dl, 40
	mov bp, offset mes2
	mov cx, 29
	int 10h
	
	pop es
	pop ds
	pop bp
	
	iret

mes2 db "This experiment is difficult!"
	

;***********************************
;*  void _int35()                  *
;***********************************
public _int35
_int35 proc
	int 35
	ret
_int35 endp	

	
;****************************
; 36号中断程序              *
;****************************
int_36:
	push bp
	push ds
	push es
	
	mov ax, cs
	mov ds, ax
	mov es, ax
	mov ah, 13h
	mov al, 0
	mov bl, 05h
	mov bh, 0
	mov dh, 12
	mov dl, 0
	mov bp, offset mes3
	mov cx, 216
	int 10h
	
	pop es
	pop ds
	pop bp

	iret

mes3:
	db "    *********   ", 0ah, 0dh
	db "   * ****** **  ", 0ah, 0dh
	db "  * **    *** * ", 0ah, 0dh
	db " *  **         *", 0ah, 0dh
	db " * *********   *", 0ah, 0dh
	db "  * ********* * ", 0ah, 0dh
	db "   *       ***  ", 0ah, 0dh
	db "    * **   **   ", 0ah, 0dh
	db "     *******    ", 0ah, 0dh
	db "      *   *     ", 0ah, 0dh
	db "       * *      ", 0ah, 0dh
	db "        *       ", 0ah, 0dh
	
	
;***********************************
;*  void _int36()                  *
;***********************************
public _int36
_int36 proc
	int 36
	ret
_int36 endp	

	
;****************************
; 37号中断程序              *
;****************************
int_37:
	push bp
	push ds
	push es
	
	mov ax, cs
	mov ds, ax
	mov es, ax
	mov ah, 13h
	mov al, 0
	mov bl, 71h
	mov bh, 0
	mov dh, 20
	mov dl, 48
	mov bp, offset mes4
	mov cx, 16
	int 10h
	
	pop es
	pop ds
	pop bp
	
	iret

mes4 db "It's a nice day!"


;***********************************
;*  void _int37()                  *
;***********************************
public _int37
_int37 proc
	int 37
	ret
_int37 endp


;****************************
; 键盘中断程序              *
;****************************
KeyInt:
    push ax
    push bx
    push cx
    push dx
	push bp
	push es
	push ds
	
	mov ax, cs
	mov ds, ax
	mov es, ax
	
	inc byte ptr es:[odd]
	cmp byte ptr es:[odd], 1
	je print
	mov byte ptr es:[odd], 0
	jmp final
	
print:
    mov ah,13h 	                    ; 功能号
	mov al,0                 		; 光标放到串尾
	mov bl,0ah 	                    ; 亮绿
	mov bh,0 	                	; 第0页
	mov dh,byte ptr es:[cnn] 	    ; 第 cnn 行
	mov dl,byte ptr es:[cnn]	    ; 第 cnn 列
	mov bp, offset OUCH 	        ; BP=串地址
	mov cx,10  	                    ; 串长为 10
	int 10h 		                ; 调用10H号中断
    
	call Delay
	
	mov ax, 0601h					;清除OUCH!OUCH!
	mov bh, 0Fh
	mov ch, byte ptr es:[cnn]
	mov cl, byte ptr es:[cnn]
	mov dh, byte ptr es:[cnn]
	mov dl, byte ptr es:[cnn]
	add dl, 10
	int 10h
	
	inc byte ptr es:[cnn]
	cmp byte ptr es:[cnn], 25
	jne final
	mov byte ptr es:[cnn], 0
	
final:
	in al,60h

	mov al,20h					    ; AL = EOI
	out 20h,al						; 发送EOI到主8529A
	out 0A0h,al					    ; 发送EOI到从8529A
	
	pop ds
	pop es
	pop bp
	pop dx
	pop cx
	pop bx
	pop ax
	
	iret							; 从中断返回

OUCH:
    db "OUCH!OUCH!"
	cnn db 0
	odd db 1
	
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
	

;****************************
; 休眠系统调用程序          *
;****************************

sleep:
	push cx
	mov cx, 50
loop3:
	call Delay
	loop loop3
	pop cx
	iret
	 