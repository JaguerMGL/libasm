#include <stdio.h>
#include <string.h>

extern size_t _ft_strlen(const char *s);

int main() {
    char *test = "Hello World";
    printf("ft_strlen: %zu\n", _ft_strlen(test));
    printf("strlen:    %zu\n", strlen(test));
    return 0;
}