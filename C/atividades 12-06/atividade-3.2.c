#include <stdio.h>

int main() {
    // Declaracao de variaveis
    float num1, num2, num3;

    // Entrada dos dados
    printf("Digite três números reais:\n");
    printf("Número 1: ");
    scanf("%f", &num1);
    printf("Número 2: ");
    scanf("%f", &num2);
    printf("Número 3: ");
    scanf("%f", &num3);

    // Encontra o maior 
    float maior = num1; 
    if (num2 > maior) {
        maior = num2;
    }
    if (num3 > maior) {
        maior = num3;
    }

    // Imprime 
    printf("O maior número é: %.2f\n", maior);

    return 0;
}