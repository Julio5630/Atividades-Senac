#include<stdio.h>

int main(){
    //Variaveis 
    int numero = 0;

    while(numero >= 0){
        printf("Digite um numero\n");
        scanf("%d", &numero);
    }
    printf("Numero Negativo inserido, programa finalizado!");
    
    return 0;
}