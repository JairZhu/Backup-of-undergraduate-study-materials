data segment
source db 'sfefiaSDKFLKWGGWOQTCBML'
count equ $-source
dest db count dup (0)
data ends

code segment
    assume cs:code, ds:data, es:data
begin:
    mov ax, data
    mov ds, ax
    mov es, ax
    lea si, source
    lea di, dest
    mov cx, count
again:
    lodsb
    and al, 7fh
    jp next
    or al, 80h
next:
    stosb
    loop again
code ends
    end begin
