#include <stdio.h>

int main() {
    // Declaracao de variaveis
    float valor_compra;
    int tipo_produto;

    // Entrada de dados
    printf("Digite o valor da compra: ");
    scanf("%f", &valor_compra);

    // Solicita ao usuário o tipo do produto
    printf("Digite o tipo do produto (0 para 10%, outro para 20%): ");
    scanf("%d", &tipo_produto);

    // Declaracao de variaveis
    float valor_taxa;

    // Calcula o valor da taxa
    if (tipo_produto == 0) {
        valor_taxa = valor_compra * 0.10; // 10%
    } else {
        valor_taxa = valor_compra * 0.20; // 20%
    }

    // Calcula o valor total
    float valor_total = valor_compra + valor_taxa;

    // Exibe o valor total
    printf("O valor total a ser pago é: %.2f\n", valor_total);

    return 0;
}