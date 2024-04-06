%macro prod 2
    save
    mov r12,%2
    push r12
    mov r12,%1
    push r12
    call prod_
    load
%endmacro
prod_:
    mov rax,[rsp+8]
    mov rax,[rax]
    mov rbx,[rsp+16]
    mov rbx,[rbx]
    imul rax,rbx
    mov rbx,[rsp+8]
    mov qword[rbx],rax
    ret 16
