%macro swap 2
    save
    mov r12,%2
    push r12
    mov r12,%1
    push r12
    call swap_
    load
%endmacro
swap_:
    mov rax,[rsp+8]
    mov rax,[rax]
    mov rbx,[rsp+16]
    mov rbx,[rbx]
    mov rcx,rax
    mov rax,rbx
    mov rbx,rcx
    mov rdx,[rsp+8]
    mov qword[rdx],rax
    mov rdx,[rsp+16]
    mov qword[rdx],rbx
    ret 16
