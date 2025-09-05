// operadores logicos em C
#include<stdio.h>

int main(){
    
    int a = 10, b = 20;
    _Bool condicao1 = ( a > 5 && b < 30);// Verdadeira
    _Bool condicao2 = (a > 15 || b < 10);// Falso
    printf("Condicao 1: %d\n", condicao1);
    printf("Condicao 2: %d\n", condicao2);
    return 0;
}