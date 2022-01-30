.model small
.stack 100h
.data
msg db 'Enter the string: ',10,13,'$' 
msg2 db 'Reversed String: ',10,13,'$'
str db 60 dup(?)
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    mov ah,9
    lea dx,msg
    int 21h
        
    mov si,offset str
    mov cx,0h
    
    input: 
        mov ah,1
        int 21h 
        mov str[si],al
        cmp al,13
        je next 
        inc si
        inc cx
        jmp input
    
    next:
      
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
         
        mov ah,9
        lea dx,msg2
        int 21h
        
        
   
    display: 
    
        mov ah,2
        mov dl,str[si] 
        int 21h 
        cmp cx,0
        je exit
        dec si 
        dec cx
        jmp display 
    
    exit:
        mov ah,4ch
        int 21h
    
    main endp
end main
       
        