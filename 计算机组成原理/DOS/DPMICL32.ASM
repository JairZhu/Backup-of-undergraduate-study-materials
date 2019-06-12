	.386

_TEXT32 segment use32 para public 'CODE'
	assume	cs:_TEXT32,ds:_DATA
entry32:
	mov	ax,0400h		;Get DPMI version function
	int	31h			;Call DPMI
	or	version,ah		;Store major version
	cmp	al,90h			;Buggy minor version number ?
	jne	@f			;No
	mov	al,90			;Load corrected version
@@:	aam				;Split digits
	xchg	ah,al			;Swap digits
	or	word ptr version+2,ax	;Store minor version
	mov	esi,offset infostr	;Point to string
	call	print			;Print string
	mov	ax,4C00h		;Terminate function
	int	21h			;Return to DOS

print:	lodsb				;Get character
	cmp	al,0			;Null ?
	je	done			;Yes
	mov	dl,al
	mov	ah,02h			;Output character function
	int	21h			;Call DOS
	jmp	print
done:	ret
_TEXT32 ends

_TEXT	segment use16 para public 'CODE'
	assume	cs:_TEXT,ds:_DATA
entry:
	mov	ax,_DATA		;Load data segment
	mov	ds,ax			;Set DS
	mov	bx,ss			;Load SS
	mov	ax,es			;Load ES (PSP)
	sub	bx,ax			;Get difference (program size in paragraphs)
	add	bx,((sizeof stk)+15)/16 ;Add stack size in paragraphs
	mov	ah,4Ah			;Reallocate memory function
	int	21h			;Call DOS
	mov	ax,1687h		;DPMI installation check
	int	2Fh
	test	ax,ax			;DPMI present ?
	jnz	nohost			;No
	push	es			;Save DPMI entry address on stack for call
	push	di
	test	si,si			;Private data needed ?
	jz	@f			;No
	mov	bx,si			;Load BX with private data size
	mov	ah,48h			;Allocate memory function
	int	21h			;Call DOS
	jc	nomem
	mov	es,ax			;Load ES with private data segment
@@:	mov	bp,sp
	mov	ax,1			;Start a 32-bit client
	call	dword ptr [bp]		;Initial switch to protected-mode
	jc	initerr

; 16-bit protected-mode, create 32-bit code selector and jump to 32-bit code

	mov	cx,1			;Allocate 1 descriptor
	xor	ax,ax			;Allocate LDT descriptors function
	int	31h			;Call DPMI
	jc	exit
	mov	bx,ax			;Load BX with selector
	mov	cx,_TEXT32		;Load 32-bit code segment
	mov	dx,cx
	shl	dx,4			;Get linear address bits 0-15
	shr	cx,12			;Get linear address bits 16-19
	mov	ax,0007h		;Set segment base address function
	int	31h			;Call DPMI
	mov	dx,0FFFFh		;Load 64K segment limit
	xor	cx,cx
	mov	ax,0008h		;Set segment limit function
	int	31h			;Call DPMI
	mov	ax,cs			;Get CS
	lar	cx,ax			;Get code selector access rights
	mov	cl,ch			;Load CL with access rights
	mov	ch,40h			;Load extended access rights (default bit set)
	mov	ax,0009h		;Set descriptor access rights function
	int	31h			;Call DPMI
	push	ebx
	push	offset entry32
	retd				;Jump to 32-bit code

nohost: mov	dx,offset errmsg1
	jmp	dispmsg
nomem:	mov	dx,offset errmsg2
	jmp	dispmsg
initerr:mov	dx,offset errmsg3
dispmsg:mov	ah,09h			;Display string function
	int	21h			;Call DOS
exit:	mov	ax,4C01h		;Terminate function
	int	21h			;Return to DOS
_TEXT	ends

_DATA	segment use16 para public 'DATA'
errmsg1 db	'No DPMI host installed',13,10,'$'
errmsg2 db	'Not enough memory for initialization',13,10,'$'
errmsg3 db	'DPMI initialization failed',13,10,'$'
infostr db	'Now in 32-bit protected-mode, DPMI version '
version db	'0.00',13,10,0
_DATA	ends

STACK	segment para stack 'STACK'
stk	db	1024 dup(?)
STACK	ends
	end	entry
