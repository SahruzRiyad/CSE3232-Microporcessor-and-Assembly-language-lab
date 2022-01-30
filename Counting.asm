.model small
.stack 100h
.data
msg db 'Enter the string ',10,13,'$' 
msg1 db 'Number of words: ',10,13,'$'
msg2 db 'Number of vowels: ',10,13,'$'
msg3 db 'Number of consonants: ',10,13,'$'
msg4 db 'Number of digits: ',10,13,'$'
vowel db ?
word db ?
consonant db ?
digit db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov bl,0 
    mov vowel,0
    mov digit,0
    mov consonant,0
    mov word,1
    
    begin:
        mov ah,1
        int 21h
        
        cmp al,13
        je endloop
        
        check_word:
            cmp al,32
            jne  check_digit
            cmp bl,32
            je last
            inc word
            jmp last
             
        check_digit: 
            cmp al,48
            jl last
            cmp al,57
            jg check_alphabet
            inc digit
            jmp last 
                    
        check_alphabet:
            cmp al,65
            jl last
            cmp al,122
            jg last 
            cmp al,97
            jge check_vowel
            
        conv_cap:
            cmp al,90
            jg last
            add al,32
                 
        check_vowel:
            cmp al,'a'
            je inc_vowel 
            cmp al,'e'
            je inc_vowel
            cmp al,'i'
            je inc_vowel
            cmp al,'o'
            je inc_vowel
            cmp al,'u'
            je inc_vowel 
            jmp inc_consonant
            
        inc_vowel:
            inc vowel
            jmp last
              
        inc_consonant:
            inc consonant
            
        last:
            mov bl,al
            jmp begin
        
    endloop:
        call NewLine
        
        mov ah,9
        lea dx,msg1
        int 21h
        
        mov ah,2 
        add word,48
        mov dl,word
        int 21h
        
        call NewLine 
        
        mov ah,9
        lea dx,msg2
        int 21h
        
        mov ah,2 
        add vowel,48
        mov dl,vowel
        int 21h
        
        call NewLine
        
        mov ah,9
        lea dx,msg3
        int 21h
        
        mov ah,2 
        add consonant,48
        mov dl,consonant
        int 21h
        
        call NewLine
        
        mov ah,9
        lea dx,msg4
        int 21h
        
        mov ah,2 
        add digit,48
        mov dl,digit
        int 21h
        
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
    Newline endp
    
end main
            