%macro putll 1
    save
    mov r12,%1
    push r12
    call putll_
    load
%endmacro
putll_:
    mov rax,[rsp+8]
    mov rax,[rax]
    xor r15,r15
    add r15,1
    shl r15,63
    test rax,r15
    je putllskip_
    save
    mov rax,1
    mov rdi,1
    mov rsi,tmp
    mov qword[rsi],45
    mov rdx,1
    syscall
    load
    not rax
    add rax,1
    putllskip_:
    mov rdi,ull
    add rdi,20
    mov rcx,10
    mov rbx,0
    putll_loop_:
        add rbx,1
        sub rdi,1
        xor rdx,rdx
        idiv rcx
        add dl,48
        mov byte[rdi],dl
        test rax,rax
        jnz putll_loop_
    mov rax,1
    mov rdi,1
    mov rsi,ull
    add rsi,20
    sub rsi,rbx
    mov rdx,rbx
    syscall
    ret 8
