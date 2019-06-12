    org 8100h
	
	mov ax,0xB800
    mov es,ax
    mov byte [es:00],'@'
    mov byte [es:01],07h
	mov byte [es:02],'@'
    mov byte [es:03],07h
	mov byte [es:04],'@'
    mov byte [es:05],07h
	mov byte [es:06],'@'
    mov byte [es:07],07h
	mov byte [es:08],'@'
    mov byte [es:09],07h
	mov byte [es:10],'@'
    mov byte [es:11],07h
	mov byte [es:12],'@'
    mov byte [es:13],07h
	mov byte [es:14],'@'
    mov byte [es:15],07h
	mov byte [es:16],'@'
    mov byte [es:17],07h
	mov byte [es:18],'@'
    mov byte [es:19],07h
	;int 20h
    jmp $
