#include<stdio.h>

int main(){
    //Variaveis
    int idade = 20;
    float valorDoPgto = 12.42;
    double velParticula = 2.92817029837;
    char tipoHabMotor = 'A';

    //instruções
    printf("Informe a idade");
    scanf("%d", &idade);
    printf("Informe o valor do Pagamento");
    scanf("%d", &valorDoPgto);
    printf("Informe a velocidade da particula");
    scanf("%d", &velParticula);
    printf("Informe o tipo de habilitação");
    scanf("%d", &tipoHabMotor);

    printf("Dados Informados: %d, %f, %lf, %c\n", idade, valorDoPgto, velParticula, tipoHabMotor);

    return 0;

}