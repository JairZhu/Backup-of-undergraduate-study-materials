; The   Form of an assembly language program
; Note: Using simplified segment definition
      .MODEL SMALL
      .STACK 64
      .DATA

DATA1     DB   52H,34H,54H,67H
DATA2     DB   29H,35H,67H,0ffH
DATA3     DB   0DEH,34H,26H,98H,98H

DATA4     dw   3456H,2376H,7898H,9876H

DATA5     DW   2345H,5678H




      .CODE

MAIN    PROC  FAR
        MOV  AX, @DATA
        MOV  DS, AX

        mov bx,0002H
        mov si,0000H
        mov di,0H

        mov al,data1[si]
        mov ah,data2[di]

        mov al, data1[bx]
        mov ah, data1+1[bx]

        mov bh, data2[bx]
        mov bl, data2+1[bx]

        
   

       MOV AH,4CH      
       int 21H
      
MAIN    ENDP
        END MAIN