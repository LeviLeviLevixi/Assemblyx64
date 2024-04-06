%macro init 2
    mov r12,%1
    mov qword[r12],%2
%endmacro
