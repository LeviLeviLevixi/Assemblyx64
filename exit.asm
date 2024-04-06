%macro exit 0
    save
    call exit_
    load
%endmacro
exit_:
    mov rax,60
    xor rdi,rdi
    syscall
    ret
