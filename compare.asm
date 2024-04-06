%macro compare 2
    save
    mov r12,%2
    mov r12,[r12]
    mov r11,%1
    mov r11,[r11]
    cmp r11,r12
    load
%endmacro
