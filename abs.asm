%macro abs 1
    save
    mov r12,%1
    push r12
    call abs_
    load
%endmacro
abs_:
    mov r8,[rsp+8]
    mov r8,[r8]
    mov r9,1
    shl r9,63
    test r8,r9
    je absskip_
    not r8
    add r8,1
    absskip_:
    mov r10,[rsp+8]
    mov qword[r10],r8
    ret 8
