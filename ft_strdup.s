.intel_syntax noprefix

.global ft_strdup
.global _ft_strdup
.global __ft_strdup

ft_strdup:
_ft_strdup:
__ft_strdup:
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
