extrn _cmain:near

.8086
_TEXT segment byte public 'CODE'
assume cs:_TEXT
DGROUP group _TEXT,_DATA,_BSS
org 100h

start:
	mov ax,cs;准备设置有关的段寄存器
	mov ds,ax; DS = CS
	mov es,ax; ES = CS
	mov ss,ax; SS = cs
	
	call cls
	int 34
	int 38
	int 35
	int 38
	int 36
	int 38
	int 37
	int 38
	call cls
	mov ah, 1
	int 21h
	mov ah, 2
	int 21h
	mov ah, 3
	int 21h
	int 38
	int 38
	
	call near ptr _cmain
	
return:
	int 20h
	jmp return
	
cls:				;清屏操作
	mov ah,06h     ;调用10h号BIOS中断的6号功能
    mov al,0        ;al=0代表清屏
    mov bh,07h     ;设置将屏幕置为黑底白字
    mov ch,0        ;从(0,0)到(24,79)
    mov cl,0   
    mov dh,24  
    mov dl,79
    int 10h        ;调用中断
	ret 
	
_TEXT ends

_DATA segment word public 'DATA'

_DATA ends

_BSS	segment word public 'BSS'
_BSS ends

end start