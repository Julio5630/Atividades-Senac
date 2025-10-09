#include<stdio.h>

int main(){
    //Variaveis 
    int valor, valorTotal = 0;
    int numeroProdutos = 1;

    while(valor != 0){
        printf("Digite o valor do produto %d \n", numeroProdutos);
        scanf(" %2d", &valor);
        numeroProdutos++;
        valorTotal += valor;
    }
    printf("A soma do valor de todos os produtos é R$ %d", valorTotal);
    
    return 0;
}