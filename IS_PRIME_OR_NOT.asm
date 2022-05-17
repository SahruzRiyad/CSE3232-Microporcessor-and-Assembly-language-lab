.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'ENTER THE INPUT: ','$'
PRIME DB 10,13,'PRIME NUMBER','$'
NOT_PRIME DB 10,13,'NOT PRIME NUMBER$'
N DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV CL,2
    SUB AL,48 
    MOV N,AL
    
  REPEAT:
    CMP CL,N
    JGE IS_PRIME 
    
    MOV AH,0
    
    DIV CL
    CMP AH,0
    JE IS_NOT_PRIME
    
    MOV AL,N
    INC CL
    JMP REPEAT
    
  IS_PRIME:
    MOV AH,9
    LEA DX,PRIME
    INT 21H
    JMP EXIT
    
  IS_NOT_PRIME:
    MOV AH,9
    LEA DX,NOT_PRIME
    INT 21H
    
  EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP

END MAIN
    
    