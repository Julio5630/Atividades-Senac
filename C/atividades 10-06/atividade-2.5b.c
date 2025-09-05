#include <stdio.h>

int main( )
{
    int a = 1;

    printf("Digite o valor:");

    scanf("%d", a);

    printf("a = %d\n", a);

    return 0;
}
/*
Correcao do Erro: Na função scanf, o segundo argumento deve ser o endereço da variável onde o valor lido será armazenado.
 Neste caso, está sendo passado o valor de a em vez do endereço. O correto seria scanf("%d", &a);.
 */