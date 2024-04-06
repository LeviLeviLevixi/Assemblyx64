%macro space 0
    save
    call space_
    load
%endmacro
space_:
    mov rax,1
    mov rdi,1
    mov rsi,tmp
    mov qword[rsi],32
    mov rdx,1
    syscall
    ret
