; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;                              klib.asm
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
extern  macro %1    ;统一用extern导入外部标识符
	extrn %1
endm

;导入C中的全局函数或全局变量
extern _sector_number:near
extern _current_seg:near
extern _input:near
extern _cmain:near
extern _create_new_PCB:near
extern _kernal_mode:near
extern _process_number:near
extern _current_process_number:near
extern _first_time:near
extern _save_PCB:near
extern _schedule:near
extern _get_current_process_PCB:near

back_time dw 1

;=========================================================================
;					void _run_test();
;=========================================================================
;加载并运行程序
public _run_test
_run_test proc

	xor ax, ax
	mov es, ax
	
	mov ax,09000h
	mov es,ax 		                ;设置段地址, 存放数据的内存基地址
	mov bx,100h						; ES:BX=读入数据到内存中的存储地址
	mov ah,2 		                ; 功能号
	mov al,1 	                	; 要读入的扇区数 2
	mov dl,0                 		; 软盘驱动器号（对硬盘和U盘，此处的值应改为80H）
	mov dh,0 		                ; 磁头号
	mov ch,0                 		; 柱面号
	mov cl,15			          	; 起始扇区号（编号从1开始）
	int 13H 		                ; 调用13H号中断
	
	mov word ptr ds:[0], 0100h
	mov word ptr ds:[2], 09000h
	
	jmp dword ptr ds:[0]                       ; 跳转到该内存地址
_run_test endp


;************ *****************************
; *SCOPY@                                 *
;****************** ***********************
; 实参为局部字符串带初始化异常问题的补钉程序
public SCOPY@
SCOPY@ proc 
	arg_0 = dword ptr 6
	arg_4 = dword ptr 0ah
	push bp
	mov bp,sp
	push si
	push di
	push ds
	lds si,[bp+arg_0]
	les di,[bp+arg_4]
	cld
	shr cx,1
	rep movsw
	adc cx,cx
	rep movsb
	pop ds
	pop di
	pop si
	pop bp
	retf 8
SCOPY@ endp


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


;=========================================================================
;					void _run_process(int start, int seg)
;=========================================================================
public _run_process
_run_process proc
	push es
	
	mov ax, word ptr [_current_seg]
	mov es, ax
	mov bx, 100h
	mov ah, 2
	mov al, 1
	mov dl, 0
	mov dh, 0
	mov ch, 0
	mov cl, byte ptr [_sector_number]
	int 13h
	
	call _create_new_PCB
	
	pop es
	ret
_run_process endp


;=========================================================================
;					void _set_timer()
;=========================================================================
public _set_timer
_set_timer proc
	push ax
	mov al, 36h
	out 43h, al
	mov ax, 11931		;频率为100Hz
	out 40h, al
	mov al, ah
	out 40h, al
	pop ax
	ret
_set_timer endp


;=========================================================================
;					void _set_clock()
;=========================================================================
public _set_clock
_set_clock proc
	push es
	call near ptr _set_timer
	xor ax, ax
	mov es, ax
	mov word ptr es:[20h], offset Timer
	mov word ptr es:[22h], cs
	pop es
	ret
_set_clock endp



;****************************
; 时钟中断程序              *
;****************************
Timer:
	cmp word ptr [_kernal_mode], 1
	jne process_timer
	jmp kernal_timer
	
process_timer:
	.386
	push ss
	push gs
	push fs
	push es
	push ds
	.8086
	push di
	push si
	push bp
	push sp
	push dx
	push cx
	push bx
	push ax
	
	cmp word ptr [back_time], 0
	jnz time_to_go
	mov word ptr [back_time], 1
	mov word ptr [_kernal_mode], 1
	add sp, 11*2
	push 512
	push 800h
	push 100h
	iret
	
time_to_go:
	inc word ptr [back_time]
	mov ax, cs
	mov ds, ax
	mov es, ax
	call _save_PCB
	call _schedule
	
store_PCB:
	mov ax, cs
	mov ds, ax
	call _get_current_process_PCB
	mov si, ax
	mov ss, word ptr ds:[si]
	mov sp, word ptr ds:[si+2*7]
	cmp word ptr [_first_time], 1
	jnz next_time
	mov word ptr [_first_time], 0
	jmp start_PCB
	
next_time:
	add sp, 11*2						
	
start_PCB:
	mov ax, 0
	push word ptr ds:[si+2*15]
	push word ptr ds:[si+2*14]
	push word ptr ds:[si+2*13]
	
	mov ax, word ptr ds:[si+2*12]
	mov cx, word ptr ds:[si+2*11]
	mov dx, word ptr ds:[si+2*10]
	mov bx, word ptr ds:[si+2*9]
	mov bp, word ptr ds:[si+2*8]
	mov di, word ptr ds:[si+2*5]
	mov es, word ptr ds:[si+2*3]
	.386
	mov fs, word ptr ds:[si+2*2]
	mov gs, word ptr ds:[si+2*1]
	.8086
	push word ptr ds:[si+2*4]
	push word ptr ds:[si+2*6]
	pop si
	pop ds
	
process_timer_end:
	push ax
	mov al, 20h
	out 20h, al
	out 0A0h, al
	pop ax
	iret
	
kernal_timer:
    push es
	push ds
	
	dec byte ptr es:[cccount]		    ;递减计数变量
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
	
ch1:
	mov bl, '/'
	jmp showch
	
ch2:
	mov bl, '|'
	jmp showch
	
ch3:
    mov bl, '\'
	jmp showch
	
ch4:
	mov byte ptr es:[tmp],0
	mov bl, '-'
	jmp showch
	
showch:
	.386
	push gs
	mov	ax,0B800h				; 文本窗口显存起始地址
	mov	gs,ax					; GS = B800h
	mov ah,0Fh
	mov al,bl
	mov word[gs:((80 * 24 + 78) * 2)], ax
	pop gs    
	.8086
	mov byte ptr es:[cccount],8
	
fin:
	mov al,20h					        ; AL = EOI
	out 20h,al						    ; 发送EOI到主8529A
	out 0A0h,al					        ; 发送EOI到从8529A
	
	pop ds
	pop es                              ; 恢复寄存器信息
	iret		
	
	cccount db 8					     ; 计时器计数变量，初值=8
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