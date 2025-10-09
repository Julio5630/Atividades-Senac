#include <stdio.h>

int main() {
    int idade;
    char sexo;
    float salario;

    int maiorIdade = 0;
    float somaSalarios = 0;
    int contadorHabitantes = 0;
    int quantidadeMulheres = 0;
    int salarioAbaixo500 = 0; 

    printf("--- Pesquisa de Moradores do Bairro ---\n");
    printf("Digite 0 para a idade para finalizar a entrada de dados.\n\n");

    while (1) { 
        printf("Idade do habitante (0 para sair): ");
        scanf("%d", &idade);

        if (idade == 0) {
            break; 
        }

        if (idade < 0) {
            printf("Idade inválida. Por favor, digite uma idade positiva.\n");
            continue; 
        }

        printf("Sexo do habitante (m/f): ");
        scanf(" %c", &sexo); 

        if (sexo != 'm' && sexo != 'M' && sexo != 'f' && sexo != 'F') {
            printf("Sexo inválido. Por favor, digite 'm' ou 'f'.\n");
            continue; 
        }

        printf("Salário do habitante: R$ ");
        scanf("%f", &salario);

        if (salario < 0) {
            printf("Salário inválido. Por favor, digite um salário positivo.\n");
            continue;
        }

        // a. A maior idade
        if (idade > maiorIdade) {
            maiorIdade = idade;
        }

        // b. A média salarial
        somaSalarios += salario;
        contadorHabitantes++;

        // c. A quantidade de mulheres
        if (sexo == 'f' || sexo == 'F') {
            quantidadeMulheres++;
        }

        // d. Existe salário abaixo de 500?
        if (salario < 500) {
            salarioAbaixo500 = 1; // Marca como verdadeiro se encontrar um salário abaixo de 500
        }
        printf("\n"); // Adiciona uma linha em branco para melhor legibilidade
    }

    printf("\n--- Resultados da Pesquisa ---\n");

    if (contadorHabitantes > 0) {
        printf("a. Maior idade: %d anos\n", maiorIdade);
        printf("b. Média salarial: R$ %.2f\n", somaSalarios / contadorHabitantes);
        printf("c. Quantidade de mulheres: %d\n", quantidadeMulheres);
        printf("d. Existe salário abaixo de R$ 500? %s\n", (salarioAbaixo500 ? "Sim" : "Não"));
    } else {
        printf("Nenhum dado de habitante foi inserido.\n");
    }

    printf("\nPesquisa finalizada.\n");

    return 0;
}