; 李新锐 2018-3

org 07c00h					;告知编译器代码将被加载到07c00h处

jmp main                    ;从main函数开始执行

;定义4个函数
;cls, print_id, change_color, sleep
cls:
    pusha           ;保存寄存器的值
    mov ah,0x06     ;调用10号BIOS中断的6号功能
    mov al,0        ;al=0代表清屏
    mov bh,0x07     ;设置将屏幕置为黑底白字
    mov ch,0        ;从(0,0)到(24,79)
    mov cl,0   
    mov dh,24  
    mov dl,79  
    int 0x10        ;调用中断
    popa            ;恢复寄存器的值
    ret             ;返回

print_id:
    pusha
    mov ax, myid 
    mov bp, ax      ;es:bp: 字符串首地址
    mov cx, 17      ;字符串长度
    mov ax, 01300h  ;调用Write string功能
    mov bx, 00F1h   ;白底蓝字，闪烁
    mov dx, 00920h  ;显示在屏幕中央
    int 10h
    popa
    ret

change_color:
    cmp byte[color],0Fh ;当前字符颜色是否为最后一种
    jnz no_rst          ;如果不是，选择下一种
    mov byte[color],0   ;如果是，重置
no_rst:
    inc byte[color]     ;选择下一种
    ret
    
sleep:
    pusha
    mov cx, ddelay      
    OUTER:
        mov bx, delay
        INNER:
            dec bx
            jg INNER
    loop OUTER
    popa
    ret

;数据段
data:
    count   dw delay
    dcount  dw ddelay
    rdul    db Dn_Rt         
    x       dw 7
    y       dw 0
    char    db 'A'
    color   db 01h
    myid db 'Lixinrui 15323032'
    Dn_Rt equ 1                  
    Up_Rt equ 2                  
    Up_Lt equ 3                 
    Dn_Lt equ 4                  
    delay equ 6000					
    ddelay equ 1000					


main:
    call cls                    ; 清除BIOS显示的信息
    mov ax,cs
	mov es,ax					; ES = 0
	mov ds,ax					; DS = CS
	mov es,ax					; ES = CS
	mov	ax,0B800h				; 文本窗口显存起始地址
	mov	gs,ax					; GS = B800h
    mov byte[char],'A'

move:
    call sleep
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
      jmp $	

DnRt:
	inc word[x]
	inc word[y]
	mov bx,word[x]
	mov ax,25
	sub ax,bx
      jz  dr2ur
	mov bx,word[y]
	mov ax,80
	sub ax,bx
      jz  dr2dl
	jmp show
dr2ur:
      mov word[x],23
      mov byte[rdul],Up_Rt	
    call change_color
      jmp show
dr2dl:
      mov word[y],78
      mov byte[rdul],Dn_Lt	
    call change_color
      jmp show

UpRt:
	dec word[x]
	inc word[y]
	mov bx,word[y]
	mov ax,80
	sub ax,bx
      jz  ur2ul
	mov bx,word[x]
	mov ax,-1
	sub ax,bx
      jz  ur2dr
	jmp show
ur2ul:
      mov word[y],78
      mov byte[rdul],Up_Lt	
    call change_color
      jmp show
ur2dr:
      mov word[x],1
      mov byte[rdul],Dn_Rt	
    call change_color
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
      call change_color
      jmp show
ul2ur:
      mov word[y],1
      mov byte[rdul],Up_Rt	
      call change_color
      jmp show

	
	
DnLt:
	inc word[x]
	dec word[y]
	mov bx,word[y]
	mov ax,-1
	sub ax,bx
      jz  dl2dr
	mov bx,word[x]
	mov ax,25
	sub ax,bx
      jz  dl2ul
	jmp show

dl2dr:
      mov word[y],1
      mov byte[rdul],Dn_Rt	
      call change_color
      jmp show
	
dl2ul:
      mov word[x],23
      mov byte[rdul],Up_Lt	
      call change_color
      jmp show
	
show:	
    xor ax,ax                 ; 计算显存地址
    mov ax,word[x]
	mov bx,80
	mul bx
	add ax,word[y]
	mov bx,2
	mul bx
	mov bp,ax
	mov ah,byte[color]			;  0000：黑底、1111：亮白字（默认值为07h）
	mov al,byte[char]			;  AL = 显示字符值（默认值为20h=空格符）
    call cls
	mov word[gs:bp],ax  		;  显示字符的ASCII码值
    call print_id
	jmp move
	
end:
    jmp $                   ; 停止画框，无限循环 
	


times 510 - ($ -$$)     db  0
dw    0xaa55
