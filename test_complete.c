#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>

extern size_t ft_strlen(const char *str);
extern int ft_strcmp(const char *str1, const char *str2);
extern char* ft_strcpy(char *dest, const char *src);
extern ssize_t ft_write(int fd, const void *buf, size_t count);
extern ssize_t ft_read(int fd, void *buf, size_t count);
extern char* ft_strdup(const char *str);

int main() {
    printf("=== Tests libasm ===\n\n");
    
    printf("--- Test ft_strlen ---\n");
    char *test = "Hello World";
    printf("ft_strlen: %zu\n", ft_strlen(test));
    printf("strlen:    %zu\n", strlen(test));
    printf("\n");
    
    printf("--- Test ft_strcmp ---\n");
    char *str1 = "abcde";
    char *str2 = "abcdef";
    printf("ft_strcmp('%s', '%s'): %d\n", str1, str2, ft_strcmp(str1, str2));
    printf("strcmp('%s', '%s'):    %d\n", str1, str2, strcmp(str1, str2));
    printf("\n");
    
    printf("--- Test ft_strcpy ---\n");
    char dest1[50] = "Initial content";
    char dest2[50] = "Initial content";
    char *src = "Copied string";
    printf("Before: dest = '%s'\n", dest1);
    printf("ft_strcpy result: '%s'\n", ft_strcpy(dest1, src));
    printf("strcpy result:    '%s'\n", strcpy(dest2, src));
    printf("\n");
    
    printf("--- Test ft_write ---\n");
    printf(" write: ");
    ssize_t write_result1 = write(1, test, strlen(test));
    printf(" (returned %zd)\n", write_result1);
    printf(" ft_write:     ");
    ssize_t write_result2 = ft_write(1, test, strlen(test));
    printf(" (returned %zd)\n", write_result2);
    printf("\n");
    
    printf("--- Test ft_read ---\n");
    printf("Testing ft_read with a file...\n");
    
    FILE *tmp = fopen("test.tmp", "w");
    if (tmp) {
        fputs("Je suis le contenu de mon fichier test, bonjour a toi !!", tmp);
        fclose(tmp);
        int fd = open("test.tmp", O_RDONLY);
        if (fd >= 0) {
            char buffer1[100] = {0};
            char buffer2[100] = {0};
            
            ssize_t read_result1 = ft_read(fd, buffer1, 20);
            close(fd);
            
            fd = open("test.tmp", O_RDONLY);
            ssize_t read_result2 = read(fd, buffer2, 20);
            close(fd);
            
            printf("ft_read: '%s' (returned %zd)\n", buffer1, read_result1);
            printf("read:    '%s' (returned %zd)\n", buffer2, read_result2);
            unlink("test_read.tmp");
        }
    }
    printf("\n");

    printf("--- Test ft_strdup ---\n");
    char *dup1 = ft_strdup(test);
    char *dup2 = strdup(test);
    printf("Original:  '%s' (addr: %p)\n", test, (void*)test);
    printf("ft_strdup: '%s' (addr: %p)\n", dup1, (void*)dup1);
    printf("strdup:    '%s' (addr: %p)\n", dup2, (void*)dup2);
    if (dup1) free(dup1);
    if (dup2) free(dup2);
    
    return 0;
}
