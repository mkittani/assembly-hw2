.model small
org 100h
.data
.stack 1000
arr db 10 dup(0)
msg0 db 0ah,0dh,"the sum of array = $"
even_msg db 0ah,0dh,"the sum of array is even$"
odd_msg db 0ah,0dh,"the sum of array is odd$"
endl db 0dh, 0dh, '$'
occur_arr db 10 dup(0)
count db 0

print macro var
    push ax
    push dx
    push si
    lea si,var
    mov dx,si
    mov ah,09h
    int 21h
    pop si
    pop dx
    pop ax
endm

.code
main:
    mov ax,@data
    mov ds,ax
    start:
        mov bx,0
        mov cx,10
        lea si,arr
        mov ah,1
    read:
        ; mov ah,2
        ; mov dl,count
        ; int 21h
        ; inc count
        
        int 21h
        cmp al,'0'              ;check if valid
        jb read
        cmp al,'9'
        ja read
        sub al,'0'
        mov [si+bx],al          ;arr[bx]=input()
        inc bx                  ;bx++

        ; cmp al,0
        ; je L0
        ; cmp al,1
        ; je L1
        ; cmp al,2
        ; je L2
        ; cmp al,3
        ; je L3
        ; cmp al,4
        ; je L4
        ; cmp al,5
        ; je L5
        ; cmp al,6
        ; je L6
        ; cmp al,7
        ; je L7
        ; cmp al,8
        ; je L8
        ; cmp al,9
        ; je L9
        ; jmp end_loop
        
        ; L0:
        ;     inc [occur_arr+0]
        ;     jmp end_loop
        ; L1:
        ;     inc [occur_arr+1]
        ;     jmp end_loop
        ; L2:
        ;     inc [occur_arr+2]
        ;     jmp end_loop
        ; L3:
        ;     inc [occur_arr+3]
        ;     jmp end_loop
        ; L4:
        ;     inc [occur_arr+4]
        ;     jmp end_loop
        ; L5:
        ;     inc [occur_arr+5]
        ;     jmp end_loop
        ; L6:
        ;     inc [occur_arr+6]
        ;     jmp end_loop
        ; L7:
        ;     inc [occur_arr+7]
        ;     jmp end_loop
        ; L8:
        ;     inc [occur_arr+8]
        ;     jmp end_loop
        ; L9:
        ;     inc [occur_arr + 9]
        ; end_loop:
        ;     print endl
        loop read
        
        mov bx, 0 
        mov cx,10
        mov al,0               ;int al(sum)=0
    sum:
        add al,[si+bx]          ;sum+=al
        inc bx
        loop sum                ;while(cx>0)

        print msg0
        mov bl,al
        mov dl,al
        push dx
        shr dl,4
        mov ah,2

        add dl,30h
        int 21h
        pop dx

        and dl,0fh
        mov ah,2

        cmp dl,9
        ja digit
        add dl,30h
        int 21h
    digit:
        add dl,57h
        int 21h
    testing:
        mov al,bl
        cbw
        mov bl,2
        div bl
        cmp ah,0
        jz evenL
        jmp odd
    evenL:
        print even_msg
        jmp exit
    odd:
        print odd_msg
    mov ah, 4Ch             ;return 0
    int 21h
exit:
    end main