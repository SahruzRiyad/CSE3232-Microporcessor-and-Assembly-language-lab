.model small
.stack 100h
.data
msg db 'Enter the string: ',10,13,'$'
msg1 db 'Enter the string: ',10,13,'$'
str db 80 dup(?) 
n dw ?
itr dw ?
tmp dw 80 dup(?)
.code
main proc
    mov ax,@data
    mov ds,ax 
    mov si,offset str
    
    mov ah,9
    lea dx,msg
    int 21h 
    
    mov cx,0
    
    begin:
        mov ah,1
        int 21h
        
        cmp al,13
        je endloop
        
        mov str[si],al
        inc si
        inc cx
        jmp begin 
        
    endloop:
        call Sort
        call NewLine 
        mov si,offset str 
        mov ah,9
        lea dx,msg1
        int 21h
        display: 
            mov ah,2
            mov dl,str[si]
            int 21h 
            
            cmp cx,00
            je exit
            dec cx
            inc si
            jmp display
    exit:
        mov ah,4ch
        int 21h
                
    main endp  

Sort proc 
    mov itr,cx 
    mov si,offset str
    for1:
        cmp cx,00
        je endfor1  
        
        mov di,si
        inc di 
        mov n,cx
        dec n
        for2: 
            cmp n,00
            je endfor2 
            
            mov bl,str[di]           
            cmp str[si],bl
            jl goLast 
            
            ;Swap
            mov bh,str[si]
            mov str[si],bl
            mov str[di],bh
            
            goLast:
                inc di
                dec n
                jmp for2
                         
        endfor2:
        inc si 
        dec cx
        jmp for1
    endfor1: 
        mov cx,itr
        ret           
    Sort endp

NewLine proc
    mov ah,2
    mov dl,10
    int 21h
    
    mov dl,13
    int 21h
    ret 
    
    NewLine endp  

end main