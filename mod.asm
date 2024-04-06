%macro mod 2
    save
    mov r12,%2
    push r12
    mov r12,%1
    push r12
    call mod_
    load
%endmacro
mod_:
    mov rax,[rsp+8]
    mov rax,[rax]
    mov rcx,[rsp+16]
    mov rcx,[rcx]
    xor rdx,rdx
    idiv rcx
    mov rbx,[rsp+8]
    mov qword[rbx],rdx
    ret 16
