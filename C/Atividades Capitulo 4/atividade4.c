#include<stdio.h>

int main(){
    int numero = 0;
    int multiplicador, i = 1;

    printf("Digite um numero\n");
    scanf("%d", &numero);

    while(i <= 10 ){
        multiplicador = numero*i;
        printf("%d x %d = %d \n",numero, i, multiplicador);
        i++;
    }
    
    return 0;
}