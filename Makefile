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
CC			= gcc
AS			= as
AR			= ar

# Cross-platform configuration
UNAME_S := $(shell uname -s)
UNAME_M := $(shell uname -m)

# Platform-specific flags
ifeq ($(UNAME_S), Darwin)
    # macOS
    ifeq ($(UNAME_M), arm64)
        # Mac ARM -> compile for x86_64
        LDFLAGS = -ld_classic --target=x86_64-apple-darwin
        ASFLAGS = -arch x86_64
        CFLAGS_ARCH = --target=x86_64-apple-darwin
        PLATFORM_MSG = macOS ARM (cross-compiling to x86_64)
    else
        # Mac Intel
        LDFLAGS = 
        ASFLAGS = 
        CFLAGS_ARCH = 
        PLATFORM_MSG = macOS Intel
    endif
else ifeq ($(UNAME_S), Linux)
    # Linux
    LDFLAGS = 
    ASFLAGS = --64
    CFLAGS_ARCH = 
    PLATFORM_MSG = Linux
else
    # Other Unix systems
    LDFLAGS = 
    ASFLAGS = 
    CFLAGS_ARCH = 
    PLATFORM_MSG = Other Unix system
endif

CFLAGS		= -Wall -Wextra -Werror
ARFLAGS		= rcs

all: $(NAME)

$(NAME): $(ASM_OBJS)
	@echo "Creating library $(NAME)..."
	$(AR) $(ARFLAGS) $(NAME) $(ASM_OBJS)
	@echo "Library $(NAME) created successfully!"

$(OBJS_DIR)/%.o: %.s | $(OBJS_DIR)
	@echo "Assembling $< for $(PLATFORM_MSG)..."
	$(AS) $(ASFLAGS) $< -o $@

$(OBJS_DIR):
	@echo "Creating objects directory..."
	@mkdir -p $(OBJS_DIR)


clean:
	@echo "Cleaning object files..."
	@rm -rf $(OBJS_DIR)

fclean: clean
	@echo "Cleaning library and executable..."
	@rm -f $(NAME)

re: fclean all

debug:
	@echo "System information:"
	@echo "Operating System: $(UNAME_S)"
	@echo "Architecture: $(UNAME_M)"
	@echo "Platform: $(PLATFORM_MSG)"
	@echo "CC: $(CC)"
	@echo "AS: $(AS)"
	@echo "ASFLAGS: $(ASFLAGS)"
	@echo "LDFLAGS: $(LDFLAGS)"
	@echo "ASM_SRCS: $(ASM_SRCS)"
	@echo "ASM_OBJS: $(ASM_OBJS)"

# Show help
help:
	@echo "Available targets:"
	@echo "  all     - Build the library"
	@echo "  clean   - Remove object files"
	@echo "  fclean  - Remove all generated files"
	@echo "  re      - Rebuild everything"
	@echo "  debug   - Show system and build information"
	@echo "  help    - Show this help message"

.PHONY: all clean fclean re debug help
