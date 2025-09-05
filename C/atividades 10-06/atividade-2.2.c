#include<stdio.h>

int main(){
    //Variaveis 
    char caracter1; 
    char caracter2; 
    char caracter3; 

    //Instrucoes
    printf("Informe o caracter 1: \n");
    scanf(" %c", &caracter1);

    printf("Informe o caracter 2: \n");
    scanf(" %c", &caracter2);

    printf("Informe o caracter 3: \n");
    scanf(" %c", &caracter3);

    printf("Palavra Formada: %c,- %c,- %c", caracter3, caracter2, caracter1);

    return 0;
}