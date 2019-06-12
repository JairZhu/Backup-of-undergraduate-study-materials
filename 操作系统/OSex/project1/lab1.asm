; 本程序在文本方式显示器上从左边射出一个*号,以45度向右下运动，撞到边框后反射,如此类推.
	Dn_Rt equ 1                  ;D-Down,U-Up,R-right,L-Left
    Up_Rt equ 2                  ;
    Up_Lt equ 3                  ;
    Dn_Lt equ 4                  ;
    delay equ 1200					; 计时器延迟计数,用于控制画框的速度
    ddelay equ 120				; 计时器延迟计数,用于控制画框的速度
    org 7c00h

start:
	;清屏操作
	mov ah,06h     ;调用10号BIOS中断的6号功能
    mov al,0        ;al=0代表清屏
    mov bh,07h     ;设置将屏幕置为黑底白字
    mov ch,0        ;从(0,0)到(24,79)
    mov cl,0   
    mov dh,24  
    mov dl,79  
    int 10h        ;调用中断

    mov ax,cs
	mov ds,ax
	mov es,ax					; ES = CS
	mov ax,0B800h				; 文本窗口显存起始地址
	mov gs,ax					; GS = B800h
    mov byte[char],'A'
	
loop1:
	dec word[count]				; 递减计数变量
	jnz loop1					; !=0：跳转;
	mov word[count],delay
	dec word[dcount]				; 递减计数变量
    jnz loop1
	mov word[count],delay
	mov word[dcount],ddelay

    mov al,1
    cmp al,byte[rdul]
	jz  DnRt
    mov al,2
    cmp al,byte[rdul]
	jz  UpRt
    mov al,3
    cmp al,byte[rdul]
	jz  UpLt
    mov al,4
    cmp al,byte[rdul]
	jz  DnLt

DnRt:
	inc word[x]
	inc word[y]
	mov bx,word[x]
	mov ax,13
	sub ax,bx
    jz  dr2ur
	mov bx,word[y]
	mov ax,41
	sub ax,bx
    jz  dr2dl
	jmp show
	
dr2ur:
    mov word[x],11
    mov byte[rdul],Up_Rt
    jmp show
	
dr2dl:
    mov word[y],39
    mov byte[rdul],Dn_Lt
    jmp show

UpRt:
	dec word[x]
	inc word[y]
	mov bx,word[y]
	mov ax,41
	sub ax,bx
    jz  ur2ul
	mov bx,word[x]
	mov ax,-1
	sub ax,bx
    jz  ur2dr
	jmp show
	
ur2ul:
    mov word[y],39
    mov byte[rdul],Up_Lt
    jmp show
	
ur2dr:
    mov word[x],1
    mov byte[rdul],Dn_Rt
    jmp show
	
UpLt:
	dec word[x]
	dec word[y]
	mov bx,word[x]
	mov ax,-1
	sub ax,bx
    jz  ul2dl
	mov bx,word[y]
	mov ax,-1
	sub ax,bx
	jz  ul2ur
	jmp show

ul2dl:
    mov word[x],1
    mov byte[rdul],Dn_Lt
    jmp show
	
ul2ur:
    mov word[y],1
    mov byte[rdul],Up_Rt
    jmp show
	
DnLt:
	inc word[x]
	dec word[y]
	mov bx,word[y]
	mov ax,-1
	sub ax,bx
    jz  dl2dr
	mov bx,word[x]
	mov ax,13
	sub ax,bx
    jz  dl2ul
	jmp show

dl2dr:
    mov word[y],1
    mov byte[rdul],Dn_Rt
    jmp show
	
dl2ul:
    mov word[x],11
    mov byte[rdul],Up_Lt
    jmp show
	
show:	
	mov ax, word[tmp]
	mov bp, ax
	mov ah, 07h
	mov al, ' '
	mov word[gs:bp],ax
	
    xor ax,ax                 ; 计算显存地址
    mov ax,word[x]
	mov bx,80
	mul bx
	add ax,word[y]
	mov bx,2
	mul bx
	mov bp,ax
	mov word[tmp],ax
	mov ah,byte[color1]				;  0000：黑底、1111：亮白字（默认值为07h）
	
	cmp byte[color1], 0Fh					;改颜色
	jnz change
	mov byte[color1], 0
change:
	add byte[color1], 1
	
	mov al,byte[char]			;  AL = 显示字符值（默认值为20h=空格符）
	mov word[gs:bp],ax  		;  显示字符的ASCII码值
	
	;显示名字
	mov cx, 17
	mov si, myname
	mov di, 2
dis:
	mov al, byte[ds:si]
	inc si
	mov ah, 07h
	mov word [gs:di],ax
	add di,2
	loop dis
	
	jmp loop1
	
    jmp $                   ; 停止画框，无限循环 

data:
	myname db '16337341 ZhuZhiru'
	tmp dw 0
	color1 db 0Fh
    count dw delay
    dcount dw ddelay
    rdul db Dn_Lt         ; 向右下运动
    x    dw 7 
    y    dw 0
    char db 'A'
	
times 510 - ($ -$$)     db  0
dw   0xaa55