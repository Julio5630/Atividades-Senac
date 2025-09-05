#include <stdio.h>
#include <math.h>

int main() {
  float a, b, c, delta, x1, x2;

  // entrada dos coeficientes
  printf("Digite o coeficiente a: ");
  scanf("%f", &a);
  printf("Digite o coeficiente b: ");
  scanf("%f", &b);
  printf("Digite o coeficiente c: ");
  scanf("%f", &c);

  // calculo do delta
  delta = b * b - 4 * a * c;

  // verificação se as raízes são reais
  if (delta < 0) {
    printf("A equação não possui raízes reais.\n");
  } else {
    // calculo das raízes
    x1 = (-b + sqrt(delta)) / (2 * a);
    x2 = (-b - sqrt(delta)) / (2 * a);

    // saida dos resultados
    printf("As raízes da equação são:\n");
    printf("x1 = %.2f\n", x1);
    printf("x2 = %.2f\n", x2);
  }
  

  return 0;
}
