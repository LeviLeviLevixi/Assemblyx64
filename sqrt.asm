%macro sqrt 1
    save
    mov r12,%1
    push r12
    call sqrt_
    load
%endmacro
sqrt_:
    mov r8,[rsp+8]
    mov r8,[r8]
    mov r9,0
    mov r10,1
    shl r10,31
    sqrtwhile_:
        mov r12,r9
        add r12,r10
        mov rax,r12
        xor rdx,rdx
        mov rcx,2
        idiv rcx
        mov r12,rax
        mov r13,r12
        imul r13,r12
        cmp r13,r8
        jle sqrtok_
        mov r10,r12
        jmp sqrtskip_
        sqrtok_:
        mov r9,r12
        sqrtskip_:
        mov r11,r10
        sub r11,r9
        cmp r11,1
        jne sqrtwhile_
    mov r10,[rsp+8]
    mov qword[r10],r9
    ret 8
