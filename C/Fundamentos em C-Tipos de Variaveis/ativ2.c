#include<stdio.h>

int main(){
    int idade = 20;
    float altura = 1.75;
    char genero = 'M';
    double preco = 10.99;

    printf("Idade: %d\n", idade);
    printf("Altura: %.2f\n", altura);
    printf("Genero: %c\n", genero);
    printf("Preco:%.2lf\n", preco);

    return 0;
}