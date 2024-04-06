%macro quot 2
    save
    mov r12,%2
    push r12
    mov r12,%1
    push r12
    call quot_
    load
%endmacro
quot_:
    mov rax,[rsp+8]
    mov rax,[rax]
    mov rbx,[rsp+16]
    mov rbx,[rbx]
    xor rdx,rdx
    idiv rbx
    mov rbx,[rsp+8]
    mov qword[rbx],rax
    ret 16
