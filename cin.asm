%macro cin 1
    save
    mov r12,%1_size
    push r12
    mov r12,%1
    push r12
    call cin_
    load
%endmacro
cin_:
    mov rcx,[rsp+8]
    mov r8,-1
    cinread_:
        add r8,1
        push rcx
        push r8
        xor r8,r8
        mov rax,0
        xor rdi,rdi
        mov rsi,rcx
        mov rdx,1
        syscall
        pop r8
        pop rcx
        cmp byte[rsi],10
        je cinend_
        cmp byte[rsi],26
        je cinend_
        cmp byte[rsi],32
        je cinend_
        add rcx,8
        jmp cinread_
        cinend_:
    mov byte[rcx],10
    mov rcx,[rsp+16]
    mov [rcx],r8
    ret 16
