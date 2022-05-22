.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER THE STRING: $'
MSG2 DB 10,13,'SMALLEST CHARACTER: $'  
MSG3 DB 10,13,'LARGEST CHARACTER: $'
MAX DB 65
MIN DB 90
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
  INPUT:
    MOV AH,1
    INT 21H
    
    CMP AL,13
    JZ DISPLAY
    
    CMP AL,'A'
    JL NEXT
    
    CMP AL,'Z'
    JG NEXT
    
    CMP AL,MAX
    JGE MAXI
    
    CMP AL,MIN
    JLE MINI
    
    JMP NEXT
    
  MAXI:
    MOV MAX,AL
    CMP AL,MIN
    JG NEXT
    
  MINI:
    MOV MIN,AL 
    
  NEXT:
    JMP INPUT 
    
  DISPLAY:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV AH,2
    MOV DL,MIN
    INT 21H
    
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    
    MOV AH,2
    MOV DL,MAX
    INT 21H
    
  EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP  

END MAIN
