.MODEL SMALL 
.STACK 100H
.DATA
MSG DB 'ENTER THE INPUT:','$' 
MSG2 DB 'RESULT:','$'
N DB ?
.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
  INPUT:
    MOV AH,1
    INT 21H
    
    MOV N,AL
    SUB N,48 
    CALL NEWLINE
    MOV AL,1
    
  FACTORIAL:
    CMP N,0
    JZ EXIT
    
    MUL N
    DEC N
    JMP FACTORIAL
    
  EXIT:
    
    MOV CX,AX  
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV AH,2
    MOV DX,CX 
    ADD DX,48
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP

NEWLINE PROC
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    RET
    NEWLINE ENDP

END MAIN
    
    