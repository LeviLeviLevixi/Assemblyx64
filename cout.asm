%macro cout 1
    save
    mov r12,%1
    push r12
    call cout_
    load
%endmacro
cout_:
    mov r8,[rsp+8]
    coutloop_:
        push r8
        mov rax,1
        mov rdi,1
        mov rsi,r8
        mov rdx,1
        syscall
        pop r8
        add r8,8
        cmp byte[r8],10
        je coutloopend_
        jmp coutloop_
        coutloopend_:
    ret 8
