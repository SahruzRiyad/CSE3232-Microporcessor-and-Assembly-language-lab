.MODEL SMALL
.STACK 100H
.DATA
NUM1 DB ?
NUM2 DB ?
MSG DB 'ENTER TWO INTEGER:',10,13,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H