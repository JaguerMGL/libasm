section .text

global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:
    cmp rdi, 0
    jz null_error
    push rdi
    call ft_strlen
    inc rax
    mov rdi, rax
    call malloc
    cmp rax, 0
    jz malloc_error
    mov rdi, rax
    pop rsi
    call ft_strcpy
    ret

null_error:
    xor rax, rax
    ret

malloc_error:
    pop rdi
    xor rax, rax
    ret
