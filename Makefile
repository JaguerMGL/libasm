NAME		= libasm.a
TEST_NAME	= test_libasm
ASM_SRCS	= ft_strlen.s \
                ft_strcpy.s \
                ft_strcmp.s \
                ft_write.s \
                ft_read.s \
                ft_strdup.s
OBJS_DIR	= objs
ASM_OBJS	= $(addprefix $(OBJS_DIR)/, $(ASM_SRCS:.s=.o))

# Compiler and assembler
AS			= nasm
AR			= ar

# Linux-specific flags
ASFLAGS		= -f elf64
CFLAGS		= -Wall -Wextra -Werror
ARFLAGS		= rcs

all: $(NAME)

$(NAME): $(ASM_OBJS)
	@echo "Creating library $(NAME)..."
	$(AR) $(ARFLAGS) $(NAME) $(ASM_OBJS)
	@echo "Library $(NAME) created successfully!"

$(OBJS_DIR)/%.o: %.s | $(OBJS_DIR)
	@echo "Assembling $<..."
	$(AS) $(ASFLAGS) $< -o $@

$(OBJS_DIR):
	@echo "Creating objects directory..."
	@mkdir -p $(OBJS_DIR)

clean:
	@echo "Cleaning object files..."
	@rm -rf $(OBJS_DIR)

fclean: clean
	@echo "Cleaning library..."
	@rm -f $(NAME)

re: fclean all

debug:
	@echo "Build information:"
	@echo "AS: $(AS)"
	@echo "ASFLAGS: $(ASFLAGS)"
	@echo "ASM_SRCS: $(ASM_SRCS)"
	@echo "ASM_OBJS: $(ASM_OBJS)"

help:
	@echo "Available targets:"
	@echo "  all     - Build the library"
	@echo "  clean   - Remove object files"
	@echo "  fclean  - Remove all generated files"
	@echo "  re      - Rebuild everything"
	@echo "  debug   - Show build information"
	@echo "  help    - Show this help message"

.PHONY: all clean fclean re debug help
