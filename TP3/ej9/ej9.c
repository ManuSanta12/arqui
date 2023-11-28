#include <stdio.h>

void close(unsigned int a);
char* read_file(unsigned int fd);

int main(int argc, char *argv[]){
    printf("%s", read_file(0));
    close(0);
}