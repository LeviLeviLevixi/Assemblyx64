%macro max 2
    save
    mov r12,%2
    push r12
    mov r12,%1
    push r12
    call max_
    load
%endmacro
max_:
    mov rax,[rsp+8]
    mov rax,[rax]
    mov rbx,[rsp+16]
    mov rbx,[rbx]
    cmp rax,rbx
    jg max_end_
    mov rax,rbx
    max_end_:
    mov rbx,[rsp+8]
    mov qword[rbx],rax
    ret 16
