#include<stdio.h>

int main(){
    //Variaveis 
    float tempo;
    float distancia;
    

    //Instrucoes
    printf("Informe o tempo(Kmh): ");
    scanf("%f", &tempo);
    printf("Informe a distancia(Em Horas): ");
    scanf("%f", &distancia);
    float velocidadeMedia = distancia/tempo;

    printf("A Velocidade Media e : %f", velocidadeMedia);

    return 0;
}