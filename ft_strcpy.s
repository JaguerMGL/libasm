section .text

global ft_strcpy

ft_strcpy:
    mov rcx, 0

loop:
    mov al, [rsi + rcx]
    mov [rdi + rcx], al
    inc rcx
    cmp al, 0
    je end
    jne loop

end:
    mov rax, rdi
    ret
