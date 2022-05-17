.MODEL SMALL
.STACK 100H
.DATA
NUM1 DB ?
NUM2 DB ?
MSG DB 'ENTER TWO INTEGER:',10,13,'$'
ADDITION DB 'RESULT OF ADDITION(NUM2+NUM1):','$'
SUBTRACTION DB 'RESULT OF SUBTRACTION(NUM2-NUM1):','$'
MULTIPLICATION DB 'RESULT OF MULTIPLICATION(NUM2*NUM1):','$'
DIVISION DB 'RESULT OF DIVISION(NUM2/NUM1):','$'
REM DB 'REMAINDER:','$'
QUO DB 'QUOTIENT:','$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    CALL PRINT_MSG 
    
  INPUT:
    MOV AH,1
    INT 21H
    
    MOV NUM1,AL
    SUB NUM1,48
    
    MOV AH,1
    INT 21H
    
    MOV NUM2,AL
    SUB NUM2,48
    
    MOV BH,NUM2
    MOV BL,NUM1
    
  ADDI:
    CALL NEWLINE
    
    ADD BH,BL
          
    LEA DX,ADDITION
    CALL PRINT_MSG
  
    CALL RESULT
    
  SUBT:
    CALL NEWLINE 
    
    MOV BH,NUM2
    SUB BH,BL
    
    LEA DX,SUBTRACTION
    CALL PRINT_MSG
    
    CALL RESULT
    
  MULTI: 
    CALL NEWLINE
    LEA DX,MULTIPLICATION
    CALL PRINT_MSG
    
    MOV BH,NUM2
    MOV AL,NUM1
    MUL BH
    
    MOV DX,AX
    ADD DX,'0'
    MOV AH,2
    INT 21H
    
    
     
  DIVI:
    CALL NEWLINE 
    
    LEA DX,DIVISION
    CALL PRINT_MSG
    
    MOV BH,NUM1
    MOV AH,00
    MOV AL,NUM2
    DIV BH
    MOV BL,AL
    MOV BH,AH
    
    CALL NEWLINE
    
    LEA DX,QUO
    CALL PRINT_MSG
    MOV DL,BL
    ADD DL,48
    MOV AH,2
    INT 21H
    
    
    CALL NEWLINE
    
    LEA DX,REM
    CALL PRINT_MSG
    MOV DL,BH
    ADD DL,48
    MOV AH,2
    INT 21H
     
      
  EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP

PRINT_MSG PROC
    MOV AH,9
    INT 21H
    RET
    PRINT_MSG ENDP

RESULT PROC
    MOV DL,BH
    ADD DL,48
    MOV AH,2
    INT 21H
    RET
    RESULT ENDP 

NEWLINE PROC
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13 
    INT 21H
    RET
    NEWLINE ENDP 

END MAIN
    
    