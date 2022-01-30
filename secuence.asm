.model small
.stack 100h
.data
msg db 'Enter the string: ',10,13,'$'
msg1 db 'Longest sequence of alphabet: ',10,13,'$'
str db 80 dup(?)
r dw ?
max dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov si,offset str
    mov bl,0
    mov cx,0
    mov r,si
    mov max,0
    
    loop1:
        mov ah,1
        int 21h
        
        cmp al,13
        je endloop1 
        
        mov str[si],al
        
        cmp al,bl
        je inc_cx
        
        mov cx,1
        jmp check_max
        
        inc_cx:
            inc cx
           
        check_max:
            cmp max,cx
            jge last
            mov max,cx
            mov r,si 
            
        last:
            mov bl,al
            inc si
            jmp loop1
                
    endloop1:
    call NewLine 
    mov ah,9
    lea dx,msg1
    int 21h
    mov cx,max
    mov si,r
    output:
        mov ah,2
        mov dl,str[si]
        int 21h
        dec r
        loop output
    exit:
    mov ah,4ch
    int 21h
    
    main endp

NewLine proc
    mov ah,2
    mov dl,10
    int 21h
    
    mov dl,13
    int 21h
    ret
    NewLine endp

end main
    
        
        
        