#include <stdio.h>

int main() {
  int a = 1;
  int b = 3;
  int temp; // Variável auxiliar

  printf("Valores antes da troca:\n");
  printf("a = %d\n", a);
  printf("b = %d\n", b);

  // Troca dos valores
  temp = a; // Armazena o valor de 'a' em 'temp'
  a = b;    // Atribui o valor de 'b' a 'a'
  b = temp; // Atribui o valor de 'temp'

  printf("\nValores depois da troca:\n");
  printf("a = %d\n", a);
  printf("b = %d\n", b);

  return 0;
}
