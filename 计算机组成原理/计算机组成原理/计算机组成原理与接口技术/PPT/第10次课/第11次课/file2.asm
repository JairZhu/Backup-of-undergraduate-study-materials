; The  File operate
      .MODEL SMALL
      .STACK 64
      .DATA

DATA1     DB   'e:\jk\exam.txt'
DATA2     DB   '0123456789ABCDEFGHIJKL'
DATA3     DB   'XXXXYYYYZZZ'
Handle    DW   ?

        
     .CODE
    

MAIN    PROC  FAR
        MOV  AX, @DATA
        MOV  DS, AX
    

       
       

      mov dx,offset data1
      mov ah,3DH
      mov al,01H
      int 21h

      mov handle,ax

      mov dx,offset data2
      mov bx,handle
      mov cx,22
      mov ah,40H
      int 21H


     
      MOV BX, handle
      MOV AL, 01
      MOV AH, 42H
      MOV DX, 30
      MOV CX, 00H
      INT 21H


      mov dx,offset data3
      mov bx,handle
      mov cx,10
      mov ah,40H
      int 21H
      

   

      mov bx,handle
      mov ah,3eH
      int 21H  
   

  

       MOV AH,4CH      
       int 21H
      
MAIN    ENDP
       
        END MAIN