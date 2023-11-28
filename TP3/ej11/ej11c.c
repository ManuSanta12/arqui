#include <stdio.h>

unsigned int fibonacci(unsigned int n);

int main(int argc, char*argv[]){
    unsigned int n=6;
    printf("%d\n", fibonacci(n));
    return 0;
}

unsigned int fibonacci(unsigned int n){
    if(n==0||n==1)
        return n;
    return fibonacci(n-1)+fibonacci(n-2);
}