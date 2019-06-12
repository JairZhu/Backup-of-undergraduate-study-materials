;引导程序
	org 7c00h	; BIOS将把引导扇区加载到0:7C00h处，并开始执行
	offsetofos equ 8100h
	
;写入中断向量表
%macro write_inerrupt_vector 2
	pusha
	mov ax, 0h
	mov es, ax
	mov ax, %1
	mov bx, 4
	mul bx
	mov bp, ax
	mov ax, %2
	mov word[es:bp], ax
	add bp, 2
	mov ax, cs
	mov word[es:bp], ax
	popa
%endmacro
	
;定义20h中断向量
write_inerrupt_vector 20h, myinterrupt20h

jmp Start
	
;显示信息
%macro print_message 4 ;(message, message_length, x, y)	
	pusha
	mov ax, cs
	mov es, ax
    mov bp, %1      		;es:bp: 字符串首地址
    mov cx, %2        		;字符串长度
	mov bx, 0007h
    mov ax, 01301h  		;调用显示字符串的功能
    mov dh, %3				;行
	mov dl, %4				;列
    int 10h
    popa
%endmacro

myinterrupt20h:
	push ax
	push ds
	push es
	
	print_message message1, 24, 23, 12
	mov ah, 01h
	int 16h
	jz no_input		;没有按键，则跳转至no_input
	mov ah, 00h
	int 16h
	cmp al, 'q'
	jne no_input	;若没按q，跳转至no_input
	jmp 800h:100h
no_input:
	
	pop es
	pop ds
	pop ax
	iret

Start:
	mov ax, cs
	mov ds, ax
	mov es, ax
	
Lording_OS:
	mov ax,cs                	;段地址 ; 存放数据的内存基地址
	mov es,ax                	;设置段地址（不能直接mov es,段地址）
	mov bx, offsetofos  		;偏移地址; 存放数据的内存偏移地址
    mov ah,2                 	; 功能号
	mov al,7                 	;扇区数
    mov dl,0                 	;驱动器号 ; 软盘为0，硬盘和U盘为80H
    mov dh,0                 	;磁头号 ; 起始编号为0
    mov ch,0                 	;柱面号 ; 起始编号为0
	mov cl,2					;起始扇区号 ; 起始编号为1
    int 13H                  	;调用读磁盘BIOS的13h功能
    ;内核程序已加载到指定内存区域中

cls:				;清屏操作
	mov ah,06h     ;调用10h号BIOS中断的6号功能
    mov al,0        ;al=0代表清屏
    mov bh,07h     ;设置将屏幕置为黑底白字
    mov ch,0        ;从(0,0)到(24,79)
    mov cl,0   
    mov dh,24  
    mov dl,79
    int 10h        ;调用中断

show:
	print_message info, 41, 0, 0
	
	mov ah, 00h
	int 16h
	
jump_to_kernel:
    jmp 800h:100h
	
Data:
	info db "Loading system...(Press any key to enter)"
	message1 db 'Please input q to return'
	times 510-($-$$) db 0
	dw 0xaa55