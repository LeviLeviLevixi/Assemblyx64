%macro sort 1
    save
    mov r12,%1_size
    push r12
    mov r12,%1
    push r12
    call sort_
    load
%endmacro
sort_:
    mov rbx,[rsp+8]
    mov r8,[rsp+16]
    mov r8,[r8]
    mov rcx,1
    sub rbx,8
    cmp r8,1
    je sortloop2end_
    sortloop1_:
        cmp rcx,r8
        je sortloop1end_
        add rcx,1
        mov rax,rcx
        sortwhile1_:
            cmp rax,1
            je sortwhile1end_
            at r12,rbx,rax
            mov r10,[r12]
            shr rax,1
            at r11,rbx,rax
            mov r9,[r11]
            cmp r9,r10
            jge sortwhile1end_
            mov qword[r12],r9
            mov qword[r11],r10
            jmp sortwhile1_
            sortwhile1end_:
        jmp sortloop1_
        sortloop1end_:
    mov rcx,r8
    sortloop2_:
        at r9,rbx,rcx
        at r11,rbx,1
        mov rax,1
        swap r11,r9
        sortwhile2_:
            mov r15,rax
            shl r15,1
            mov r10,r15
            add r10,1
            at r13,rbx,r15
            at r14,rbx,r10
            mov r13,[r13]
            mov r14,[r14]
            cmp r15,rcx
            jge sortwhile2end_
            cmp r10,rcx
            jge swapl_
            cmp r13,r14
            jge swapl_
            jmp swapr_
            swapl_:
                at r9,rbx,rax
                mov r9,[r9]
                cmp r9,r13
                jge sortwhile2end_
                at r14,rbx,rax
                at r13,rbx,r15
                swap r14,r13
                shl rax,1
                jmp sortwhile2_
            swapr_:
                at r9,rbx,rax
                mov r9,[r9]
                cmp r9,r14
                jge sortwhile2end_
                at r14,rbx,rax
                at r13,rbx,r10
                swap r14,r13
                shl rax,1
                add rax,1
                jmp sortwhile2_
            sortwhile2end_:
        sub rcx,1
        cmp rcx,1
        je sortloop2end_
        jmp sortloop2_
        sortloop2end_:
    ret 16
