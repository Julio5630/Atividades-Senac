#include<stdio.h>

int main(){
    // Declaracao das variaveis
    int numero;

    // Entrada de dados
    printf("digite um numero: ");
    scanf("%d", &numero);
    
    //Comparador Logico
    if(numero >= 0){
        printf("numero positivo");
    }
    else {
        printf("numero negativo");
    }
    return 0;
}