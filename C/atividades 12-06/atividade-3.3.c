#include <stdio.h>
// Define o Valor de PI
#define PI 3.1415

int main() {
    int opcao;
    float raio, base, altura, area;

    // Exibe as opções ao usuário
    printf("Escolha uma figura bidimensional (1 para círculo, 2 para retângulo): ");
    scanf("%d", &opcao);

    // Processa a escolha do usuário
    switch (opcao) {
        case 1: // Círculo
            // Solicita o raio
            printf("Digite o raio do círculo: ");
            scanf("%f", &raio);

            // Calcula a área
            area = PI * raio * raio;

            // Exibe o resultado
            printf("A área do círculo é: %.2f\n", area);
            break;

        case 2: // Retângulo
            // Solicita a base e a altura
            printf("Digite a base do retângulo: ");
            scanf("%f", &base);
            printf("Digite a altura do retângulo: ");
            scanf("%f", &altura);

            // Calcula a área
            area = base * altura;

            // Exibe o resultado
            printf("A área do retângulo é: %.2f\n", area);
            break;

        default: // Opção inválida
            printf("Opção inválida.\n");
            break;
    }

    return 0;
}