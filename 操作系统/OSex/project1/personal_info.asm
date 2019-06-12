    mov ax,0xB800
    mov es,ax
    mov byte [es:00],'1'
    mov byte [es:01],0f0h
	mov byte [es:02],'6'
    mov byte [es:03],0f0h
	mov byte [es:04],'3'
    mov byte [es:05],0f0h
	mov byte [es:06],'3'
    mov byte [es:07],0f0h
	mov byte [es:08],'7'
    mov byte [es:09],0f0h
	mov byte [es:10],'3'
    mov byte [es:11],0f0h
	mov byte [es:12],'4'
    mov byte [es:13],0f0h
	mov byte [es:14],'1'
    mov byte [es:15],0f0h
	mov byte [es:16],' '
    mov byte [es:17],0f0h
	mov byte [es:18],'Z'
    mov byte [es:19],0f0h
	mov byte [es:20],'h'
    mov byte [es:21],0f0h
	mov byte [es:22],'u'
    mov byte [es:23],0f0h
	mov byte [es:24],' '
    mov byte [es:25],0f0h
	mov byte [es:26],'Z'
    mov byte [es:27],0f0h
	mov byte [es:28],'h'
    mov byte [es:29],0f0h
	mov byte [es:30],'i'
    mov byte [es:31],0f0h
	mov byte [es:32],'r'
    mov byte [es:33],0f0h
	mov byte [es:34],'u'
    mov byte [es:35],0f0h
	jmp $
	