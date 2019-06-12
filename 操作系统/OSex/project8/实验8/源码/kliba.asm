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
extern _do_fork:near
extern _do_wait:near
extern _do_exit:near
extern _initial_PCB_settings:near
extern _sub_ss:near
extern _f_ss:near
extern _stack_size:near
extern _sector_size:near
extern _semaGet:near
extern _semaFree:near
extern _semaP:near
extern _semaV:near

back_time dw 1

;=========================================================================
;					void _run_process()
;=========================================================================
public _run_process
_run_process proc
	push es
	
	mov ax, word ptr [_current_seg]
	mov es, ax
	mov bx, 100h
	mov ah, 2
	mov al, byte ptr [_sector_size]
	mov dl, 0
	mov dh, 0
	mov ch, 0
	mov cl, byte ptr [_sector_number]
	int 13h
	
	call _create_new_PCB
	
	pop es
	ret
_run_process endp


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
;					void _set_timer()
;=========================================================================
public _set_timer
_set_timer proc
	push ax
	mov al, 34h
	out 43h, al
	mov ax, 23863		;频率为100Hz
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
	
	cmp word ptr [back_time], 1200
	jnz time_to_go
	mov word ptr [back_time], 1
	mov word ptr [_current_process_number], 0
	mov word ptr [_kernal_mode], 1
	mov	ax, 600h
	mov	bx, 700h	
	mov	cx, 0		
	mov	dx, 184fh	
	int	10h			
	call _initial_PCB_settings
	call _PCB_Restore
	
time_to_go:
	inc word ptr [back_time]
	mov ax, cs
	mov ds, ax
	mov es, ax
	call _save_PCB
	call _schedule
	call _PCB_Restore
	iret
	
public _PCB_Restore
_PCB_Restore proc
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
endp _PCB_Restore

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

;*************************************************
; void _stackCopy(int sub_ss,int f_ss, int size);
;*************************************************
public _stackCopy
_stackCopy proc
	push ax
	push es
	push ds
	push di
	push si
	push cx

	mov ax, word ptr [_sub_ss]                ; 子进程 ss
	mov es,ax
	mov di, 0
	mov ax, word ptr [_f_ss]               ; 父进程 ss
	mov ds, ax
	mov si, 0
	mov cx, word ptr [_stack_size]               ; 栈的大小
	cld
	rep movsw                    ; ds:si->es:di

	pop cx
	pop si
	pop di
	pop ds
	pop es
	pop ax
	ret
_stackCopy endp

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
	cmp ah, 4
	je to_forking
	cmp ah, 5
	je to_waiting
	cmp ah, 6
	je to_exiting
	cmp ah, 7
	je to_semaget
	cmp ah, 8
	je to_semafree
	cmp ah, 9
	je to_semap
	cmp ah, 10
	je to_semav
	jmp end21h

to_semap:
	pop es
	pop ds
	pop bp
	jmp semaping

to_semav:
	pop es
	pop ds
	pop bp
	jmp semaving

to_semafree:
	pop es
	pop ds
	pop bp
	jmp semafreeing

to_semaget:
	pop es
	pop ds
	pop bp
	jmp semageting

to_forking:
	pop es
	pop ds
	pop bp
	jmp forking

to_waiting:
	pop es
	pop ds
	pop bp
	jmp waiting

to_exiting:
	pop es
	pop ds
	pop bp
	jmp exiting

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


semaving:
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
	mov ax,cs
	mov ds, ax
	mov es, ax
	call _save_PCB
	mov bx,ax
	push bx
	call near ptr _semaV  
    pop bx
	iret


semaping:
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
	mov ax,cs
	mov ds, ax
	mov es, ax
	call _save_PCB
	mov bx,ax
	push bx
	call near ptr _semaP  
    pop bx
	iret


semafreeing:
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
	mov ax,cs
	mov ds, ax
	mov es, ax
	call _save_PCB
	mov bx,ax
	push bx
	call near ptr _semaFree  
    pop bx
	iret

semageting:
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
	mov ax,cs
	mov ds, ax
	mov es, ax
	call near ptr _save_PCB
	mov bx,ax
	push bx
	call near ptr _semaGet  
    pop bx
	iret

;*************** ********************
;*  21 号中断 4 号功能                     *
;**************** *******************
; 进程创建 
forking:
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
	push ax                                         ; 以上所有 push 为把寄存器的值当做参数传给 savePCB

	mov ax,cs
	mov ds, ax
	mov es, ax

	call _save_PCB
	call near ptr _do_fork   ; 调用 C 过程
	iret


;*************** ********************
;*  21 号中断 5 号功能                     *
;**************** *******************
; 进程等待
waiting:
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
	push ax                                         ; 以上所有 push 为把寄存器的值当做参数传给 savePCB

	mov ax,cs
	mov ds, ax
	mov es, ax

	call _save_PCB
	call near ptr _do_wait   ; 调用 C 过程
	iret


;*************** ********************
;*  21 号中断 6 号功能                     *
;**************** *******************
; 进程结束
exiting:
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
	push ax                                         ; 以上所有 push 为把寄存器的值当做参数传给 savePCB

	mov ax,cs
	mov ds, ax
	mov es, ax

	call _save_PCB
	call near ptr _do_exit   ; 调用 C 过程
	iret
	

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