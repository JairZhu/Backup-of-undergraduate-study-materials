	org 100h
	delay equ 50000
	ddelay equ 220

%macro rolling 8 ;(pos1, char2, color3, speed4, min_x5, min_y6, max_x7, max_y8)
	mov ax, word[%1]
	mov word[pos], ax
	mov ax, word[%4]
	mov word[speed], ax
	mov al, byte[%2]
	mov byte[char], al
	mov al, byte[%3]
	mov byte[color], al
	mov al, %5
	mov byte[min_x], al
	mov al, %6
	mov byte[min_y], al
	mov al, %7
	mov byte[max_x], al
	mov al, %8
	mov byte[max_y], al
	
	call have_fun
	
	mov ax, word[pos]
	mov word[%1], ax
	mov ax, word[speed]
	mov word[%4], ax
%endmacro

	jmp Start
	
position:
	xor ax, ax
	mov bx, word[pos]
	mov al, bl
	mov cx, 80
	mul cx
	xor cx, cx
	mov cl, bh
	add ax, cx
	mov cx, 2
	mul cx
	mov bp, ax
	ret

erase:
	call position
	mov ax, 0
	mov word[gs:bp], ax
	ret
	
show:
	call position
	mov al, byte[char]
	mov ah, byte[color]
	mov word[gs:bp], ax
	ret
	
change_position:
	mov ax, word[pos]
	mov bx, word[speed]
	
	add ah, bh
	cmp ah, byte[min_y]
	ja YA
	mov bh, 1
YA:	
	cmp ah, byte[max_y]
	jb YB
	mov bh, -1
YB:
	add al, bl
	cmp al, byte[min_x]
	ja XA
	mov bl, 1
XA:
	cmp al, byte[max_x]
	jb XB
	mov bl, -1
XB:
	mov word[pos], ax
	mov word[speed], bx
	ret

change_color_char:
	cmp byte[color], 0Fh
	jnz chage1
	mov byte[color], 0
chage1:
	add byte[color], 1

	cmp byte[char], 'Z'
	jnz chage2
	mov byte[char], 'A'
chage2:
	add byte[char], 1
	ret
	
have_fun:
	call erase
	call change_position
	call show
	ret
	
Start:
	mov ax,0600h     ;调用10号BIOS中断的6号功能, al=0代表清屏
    mov bh,07h     ;设置将屏幕置为黑底白字
    mov cx, 0h
	mov dx, 2479h
    int 10h        ;调用中断
	
	int 34
	int 35
	int 36
	int 37
	
	mov ax,cs
	mov ds,ax
	mov es,ax					; ES = CS
	mov ax,0B800h				; 文本窗口显存起始地址
	mov gs,ax					; GS = B800h

loop1:
	dec word[count]				; 递减计数变量
	jnz loop1					; !=0：跳转;
	mov word[count],delay
	dec word[dcount]				; 递减计数变量
    jnz loop1
	mov word[count],delay
	mov word[dcount],ddelay

	rolling pos4, char, color, speed4, 13, 40, 24, 79
	call change_color_char
	
	
	
	;int 20h
	jmp loop1                   ; 停止画框，无限循环 

	
data:
	count dw delay
	dcount dw ddelay
	color db 0Fh
	min_x db 0
	min_y db 0
	max_x db 0
	max_y db 0
	speed dw 0101h
	speed4 dw 0101h
	pos dw 0000h
	pos4 dw 4115h
	char db 'A'
	
times 510-($-$$) db 0  
dw  0xaa55