.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER THE INPUT(0 TO 9):$'
MSG2 DB 10,13,'BINARY FORM: $'
MSG3 DB 10,13,'HEXADECIMAL FORM: $' 
N DB ?
RES DB 20 DUP(?)
.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H 
    
    MOV SI,OFFSET RES  
    MOV DI,SI
    MOV BL,2  
    
  INPUT:
    MOV AH,1
    INT 21H 
    
    MOV N,AL
    SUB N,48
    MOV AH,00 
    MOV AL,N
  
  
  BINARY:
    DIV BL 
    MOV  RES[SI],AH
    INC SI 
    MOV AH,00 
    
    CMP AL,0
    JNZ BINARY
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H 
    
  OUTPUT_B:
    CMP SI,DI
    JZ NEXT
    
    DEC SI
    MOV AH,2
    MOV DL,RES[SI]
    ADD DL,48
    INT 21H
    JMP OUTPUT_B
    
  NEXT:
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    
    MOV AH,2
    MOV DL,N
    ADD DL,48
    INT 21H
    
  EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP

END MAIN