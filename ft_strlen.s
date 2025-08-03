.intel_syntax noprefix

# Cross-platform symbol definition
# macOS needs double underscore, Linux needs single underscore
.global ft_strlen
.global _ft_strlen
.global __ft_strlen

# Define all possible symbol names pointing to the same function
ft_strlen:
_ft_strlen:
__ft_strlen:
    mov rcx, 0
    
loop:
    cmp BYTE PTR [rdi + rcx], 0
    je end
    inc rcx
    jmp loop
    
end:
    mov rax, rcx
    ret
