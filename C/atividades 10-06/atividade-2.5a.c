#include <stdio.h>

int main()
{
    int a = 1 , float b = 3;

    printf("a = %d , b = %f \n", a , b);

    return 0;
}
/*
Correcao do Erro: A variável b é declarada como float mas recebe um valor inteiro (3)o ideal é atribuir
um valor float (ex: 3.0) para evitar possíveis comportamentos inesperados em cálculos futuros.
*/ 