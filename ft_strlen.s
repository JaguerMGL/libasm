.intel_syntax noprefix

.global ft_strlen

ft_strlen:
    mov rcx, 0
    
loop:
    cmp BYTE PTR [rdi + rcx], 0
    je end
    inc rcx
    jmp loop
    
end:
    mov rax, rcx
    ret
