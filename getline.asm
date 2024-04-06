%macro getline 1
    save
    mov r12,%1_size
    push r12
    mov r12,%1
    push r12
    call getline_
    load
%endmacro
getline_:
    mov rcx,[rsp+8]
    mov r8,-1
    getlineloop_:
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
        add rcx,8
        mov rax,[rsi]
        cmp al,10
        je getlineend_
        cmp al,26
        je getlineend_
        jmp getlineloop_
        getlineend_:
    mov rcx,[rsp+16]
    mov [rcx],r8
    ret 16
