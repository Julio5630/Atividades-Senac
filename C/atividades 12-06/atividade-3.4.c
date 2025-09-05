#include <stdio.h>

int main() {
    // Declaracao de variaveis 
    int numero;

    // Entrada de dados
    printf("Digite um número inteiro entre 1 e 4: ");
    scanf("%d", &numero);

    // Valida o numero digitado 
    while (numero < 1 || numero > 4) {
        printf("Número inválido. Digite um número entre 1 e 4: ");
        scanf("%d", &numero);
    }

    // Saida de dados
    switch (numero) {
        case 1:
        printf("Você digitou 1\n");
        break;
        case 2:
        printf("Você digitou 2\n");
        break;
        case 3:
        printf("Você digitou 3\n");
        break;
        case 4:
        printf("Você digitou 4\n");
        break;
    }

  return 0;
}