%macro stoll 2
    save
    mov r12,%2
    push r12
    mov r12,%1
    push r12
    call stoll_
    load
%endmacro
stoll_:
    mov rdx,0
    mov rax,[rsp+8]
    xor r8,r8
    mov r9,45
    dec_:
        movzx rbx,byte[rax]
        cmp r9,rbx
        jne stollnotminus1_
        add r8,1
        add rax,8
        jmp dec_
        stollnotminus1_:
        imul rdx,10
        add rdx,rbx
        sub rdx,48
        add rax,8
        cmp byte[rax],48
        jge dec_
    test r8,r8
    je stollnotminus2_
    sub rdx,1
    not rdx
    stollnotminus2_:
    mov rbx,[rsp+16]
    mov qword[rbx],rdx
    ret 16
