%macro endl 0
    save
    call endl_
    load
%endmacro
endl_:
    mov rax,1
    mov rdi,1
    mov rsi,tmp
    mov qword[rsi],10
    mov rdx,1
    syscall
    ret
