.8086
_TEXT segment byte public 'CODE'
assume cs:_TEXT
DGROUP group _TEXT,_DATA,_BSS
org 100h

start:
		xor ax, ax
		mov es, ax
		
		mov word ptr es:[33*4], offset int_21h
		mov word ptr es:[33*4+2], cs
		
		mov word ptr es:[38*4], offset sleep
		mov word ptr es:[38*4+2], cs	
		
		call _set_clock
		
		mov ax,cs;准备设置有关的段寄存器
		mov ds,ax; DS = CS
		mov es,ax; ES = CS
		mov ss,ax; SS = cs
		mov sp,100h

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