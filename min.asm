%macro min 2
    save
    mov r12,%2
    push r12
    mov r12,%1
    push r12
    call min_
    load
%endmacro
min_:
    mov rax,[rsp+8]
    mov rax,[rax]
    mov rbx,[rsp+16]
    mov rbx,[rbx]
    cmp rax,rbx
    jl min_end_
    mov rax,rbx
    min_end_:
    mov rbx,[rsp+8]
    mov qword[rbx],rax
    ret 16
