extern  macro %1    ;统一用extern导入外部标识符
	extrn %1
endm

;导入C中的全局函数或全局变量,本例中导入了3个
extern _pro:near
extern _input:near
extern _cmain:near

.8086
_TEXT segment byte public 'CODE'
assume cs:_TEXT
DGROUP group _TEXT,_DATA,_BSS
org 100h

start:
		xor ax, ax
		mov es, ax
		mov word ptr es:[20h], offset Timer
		mov word ptr es:[22h], cs
		
		mov word ptr es:[33*4], offset int_21h
		mov word ptr es:[33*4+2], cs
		
		mov word ptr es:[34*4], offset int_34
		mov word ptr es:[34*4+2], cs
		
		mov word ptr es:[35*4], offset int_35
		mov word ptr es:[35*4+2], cs
		
		mov word ptr es:[36*4], offset int_36
		mov word ptr es:[36*4+2], cs
		
		mov word ptr es:[37*4], offset int_37
		mov word ptr es:[37*4+2], cs
		
		mov word ptr es:[38*4], offset sleep
		mov word ptr es:[38*4+2], cs
		
		mov ax,cs;准备设置有关的段寄存器
		mov ds,ax; DS = CS
		mov es,ax; ES = CS
		mov ss,ax; SS = cs
		mov sp, 0FFF0h ;栈顶在段内高端，留空了16单元
		
		call near ptr _cmain
;汇编预处理安排在这里
    	jmp $	
;利用包含伪指令，将一些内核汇编语言过程文件纳入本程序，如本例中kliba.asm文件		
		include kliba.asm

_TEXT ends

_DATA segment word public 'DATA'

_DATA ends

_BSS	segment word public 'BSS'
_BSS ends

end start