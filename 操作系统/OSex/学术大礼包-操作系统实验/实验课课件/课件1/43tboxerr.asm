;;**********************************************************************************
;;*   本程序利用时钟中断,在文本方式显示终端上,沿四边用大字字母反复画框.
;;*   程序设计:凌应标
;;*   最新日期:2013/3/27
;;*
;;*
;;*
;;**********************************************************************************

        org 100h					; 程序加载到100h，可用于生成COM

; 设置时钟中断向量（08h），初始化段寄存器
	xor ax,ax						; AX = 0
	mov es,ax					; ES = 0
	mov word[es:20h],Timer		; 设置时钟中断向量的偏移地址
	mov ax,cs 
	mov [es:22h],ax				; 设置时钟中断向量的段地址=CS
	mov ds,ax					; DS = CS
	mov es,ax					; ES = CS

	mov	ax,0B800h				; 文本窗口显存起始地址
	mov	gs,ax					; GS = B800h
	jmp $						; 死循环


; 时钟中断处理程序
	delay equ 1					; 计时器延迟计数,用于控制画框的速度
	count db delay				; 计时器计数变量，初值=delay
	x dw 13                      ; 当前字符显示位置的行号,0~24
	y dw 0                      ; 当前字符显示位置的列号,0~79
	rdlu db 1                   ; 当前画框的方向, 1-向右,2-向下,3-向左,4-向上
	char db 'A'                 ; 当前显示字符
	
Timer:
	dec byte[count]				; 递减计数变量
	jnz end						; >0：跳转
	
right:
    mov al,byte[rdlu]           ;左-->右 
	cmp al,1
	jnz down
	mov ax,word[y]               ;最后一列?
	cmp ax, 39
	jz r2d
	inc byte[y]
	jmp show
r2d:
    mov byte[rdlu],2           ;改为向下
	inc byte[x]
	jmp show
	
down:
    mov al,byte[rdlu]           ;向下 
	cmp al,2
	jnz left
	mov ax,word[x]               ;最后一行?
	cmp ax, 24
	jz d2l
	inc byte[x]
	jmp show
d2l:
    mov byte[rdlu],3           ;改为向左
	dec byte[y]
	jmp show

left:
    mov al,byte[rdlu]           ;向左 
	cmp al,3
	jnz up
	mov ax,word[y]               ;最左一列?
	cmp ax, 0
	jz l2u
	dec byte[y]
	jmp show
l2u:
    mov byte[rdlu],4           ;改为向 上
	dec byte[x]
	jmp show
	
up:
    mov al,byte[rdlu]           ;向上 
	cmp al,4
	jnz end
	mov ax,word[x]               ;最上一行?
	cmp ax, 0
	jz u2r
	dec byte[x]
	jmp show
u2r:
    mov byte[rdlu],1           ;改为向右
	inc byte[y]
	mov al,byte[char]
	cmp al,'Z'
	jz returntoa
	inc byte[char]
	jmp show
	
returntoa:
    mov byte[char],'A' 
	jmp show

show:	
    xor ax,ax                      ; 计算当前字符的显存地址 gs:((80*x+y)*2)
    mov ax,word[x]
	mov bx,80                  ; (80*x
	mul bx
	add ax,word[y]             ; (80*x+y)
	mov bx,2
	mul bx                     ; ((80*x+y)*2)
	mov bp,ax
	mov ah,0Fh		   ; 0000：黑底、1111：亮白字（默认值为07h）
	mov al,byte[char]	   ; AL = 显示字符值（默认值为20h=空格符）
	mov word[gs:bp],ax  	   ;   显示字符的ASCII码值
	mov byte[count],delay	   ; 重置计数变量=初值delay

	
end:
	mov al,20h					; AL = EOI
	out 20h,al						; 发送EOI到主8529A
	out 0A0h,al					; 发送EOI到从8529A
	iret							; 从中断返回
	
	

	
;********************************************************************************************************
;*  修改一: 本程序画框是顺时针的,请把方向改为逆时间
;*  修改二: 本程序画框重复画最大的框,请改为先画最大的框,之后在所画的框内画最大的框,如此反复,直到画满屏幕
;*
;********************************************************************************************************