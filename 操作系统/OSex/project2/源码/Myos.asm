;程序源代码（myos1.asm）
org  7c00h		; BIOS将把引导扇区加载到0:7C00h处，并开始执行
OffSetOfUserPrg1 equ 8100h
OffSetOfUserPrg2 equ 8300h
OffSetOfUserPrg3 equ 8500h
OffSetOfUserPrg4 equ 8700h
OffSetOfUserPrg5 equ 8900h

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

;定义20h, 21h中断向量
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

cls:				;清屏操作
	pusha
	mov ah,06h     ;调用10h号BIOS中断的6号功能
    mov al,0        ;al=0代表清屏
    mov bh,07h     ;设置将屏幕置为黑底白字
    mov ch,0        ;从(0,0)到(24,79)
    mov cl,0   
    mov dh,24  
    mov dl,79
    int 10h        ;调用中断
	popa
	ret

myinterrupt20h:
	pusha
	print_message message1, 24, 24, 3
	mov ah, 01h
	int 16h
	jz no_input		;没有按键，则跳转至no_input
	cmp al, 'q'
	jne no_input	;若没按q，跳转至no_input
	jmp 0000h:Start
no_input:
	popa
	iret

Start:
	mov ax, cs
	mov ds, ax
	
	;清屏
	call cls
	
	;显示信息
	print_message message2, 52, 0, 1
	print_message message3, 50, 1, 1
	
	;读取用户的输入
	mov ah, 00h
	int 16h
	cmp al, '1'
	je condition1
	cmp al, '2'
	je condition2
	cmp al, '3'
	je condition3
	cmp al, '4'
	je condition4
	cmp al, '5'
	je condition5
	jmp Start

condition1:
	mov word[choose_adress], OffSetOfUserPrg1
	jmp next
	
condition2:
	mov word[choose_adress], OffSetOfUserPrg2
	jmp next
	
condition3:
	mov word[choose_adress], OffSetOfUserPrg3
	jmp next

condition4:
	mov word[choose_adress], OffSetOfUserPrg4
	jmp next

condition5:
	mov word[choose_adress], OffSetOfUserPrg5
	jmp next
	
next:
	sub al, '0'
	inc al
	mov byte[choose_number], al
	
    ;读软盘或硬盘上的若干物理扇区到内存的ES:BX处：
	call cls
    mov ax,cs                	;段地址 ; 存放数据的内存基地址
    mov es,ax                	;设置段地址（不能直接mov es,段地址）
	mov bx,word[choose_adress]  ;偏移地址; 存放数据的内存偏移地址
    mov ah,2                 	; 功能号
    mov al,1                 	;扇区数
    mov dl,0                 	;驱动器号 ; 软盘为0，硬盘和U盘为80H
    mov dh,0                 	;磁头号 ; 起始编号为0
    mov ch,0                 	;柱面号 ; 起始编号为0
    mov cl,byte[choose_number]	;起始扇区号 ; 起始编号为1
    int 13H                  	;调用读磁盘BIOS的13h功能
    ; 用户程序a.com已加载到指定内存区域中
    jmp word[choose_adress]
AfterRun:
    jmp $                      ;无限循环
	
Data:
	message1 db 'Please input q to return'
	msglen1 dw $ - message1		;24
	
	message2 db 'Welcome to Myos by Jair Zhu (Zhu Zhiru -- 16337341)!'
	msglen2 dw $ - message2		;52
	
	message3 db 'Please input 1, 2, 3, 4 or 5 to choose the program'
	msglen3 dw $ - message3		;50
	
	choose_number db 0
	choose_adress dw 0
	
	times 510-($-$$) db 0
    db 0x55,0xaa


