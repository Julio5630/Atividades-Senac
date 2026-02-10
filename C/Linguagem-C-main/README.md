# Entendendo o Código C

Este documento explica os conceitos fundamentais ilustrados em um código-fonte C de exemplo (`exemplo.c`).

---

## Estrutura e Componentes do Código

O código C típico é construído com base em alguns elementos essenciais:

### Inclusão de Bibliotecas

* **`#include <stdio.h>`**
    Esta linha é uma **diretiva de pré-processador** que inclui o arquivo de cabeçalho `stdio.h`. `stdio` significa "Standard Input/Output" (Entrada/Saída Padrão). Esta biblioteca é **fundamental** e fornece funções essenciais para lidar com a entrada e saída de dados em programas C, como a `printf()` (para imprimir na tela) e `scanf()` (para ler do teclado). Incluí-la permite que seu programa utilize essas funcionalidades padrão.

### Função Principal

* **`int main() { ... }`**
    A função `main()` é o **ponto de entrada** de qualquer programa em C. A execução do código sempre começa e termina dentro desta função.
    * O `int` antes de `main` indica que a função retornará um valor inteiro. Por convenção, um retorno de `0` (zero) indica que o programa foi executado com sucesso, enquanto outros valores geralmente indicam algum tipo de erro.

---

## Declaração e Inicialização de Variáveis

Variáveis são espaços na memória do computador usados para armazenar dados. Em C, você deve declarar o tipo de dado da variável antes de usá-la.

* **`int idade = 25;`**
    * **`int`**: Declara que a variável `idade` será do tipo **inteiro**. Variáveis `int` armazenam números sem casas decimais (ex: 1, 100, -5).
    * **`idade`**: É o **nome** da variável.
    * **`= 25`**: Atribui o valor `25` à variável `idade` no momento de sua declaração (inicialização).

* **`float altura = 1.75;`**
    * **`float`**: Declara que a variável `altura` será do tipo **ponto flutuante**. Variáveis `float` armazenam números com casas decimais (números reais, ex: 3.14, -0.5, 1.75).
    * **`altura`**: É o **nome** da variável.
    * **`= 1.75`**: Atribui o valor `1.75` à variável `altura`.

* **`char letra = 'A';`**
    * **`char`**: Declara que a variável `letra` será do tipo **caractere**. Variáveis `char` armazenam um único caractere (uma letra, número ou símbolo).
    * **`letra`**: É o **nome** da variável.
    * **`= 'A'`**: Atribui o caractere `'A'` à variável `letra`. É crucial usar **aspas simples (`' '`)** para valores do tipo `char`.

---

## Impressão de Saída: A Função `printf()`

A função `printf()` é uma das funções mais utilizadas em C para exibir informações na tela (saída padrão). Ela permite formatar a saída de texto e valores de variáveis.

* **`printf("Idade: %d\n", idade);`**
    * **`"Idade: %d\n"`**: Esta é a **string de formato**.
        * `"Idade: "` é texto literal que será impresso exatamente como está.
        * `%d`: É um **especificador de formato** para indicar que um valor **inteiro** será inserido naquele local. Ele atua como um "placeholder" para a variável `idade`.
        * `\n`: É um **caractere de escape** que representa uma **nova linha**. Ele faz com que o cursor vá para a próxima linha após a impressão, garantindo que a próxima saída apareça em uma nova linha.
    * **`, idade`**: É a variável cujo valor será substituído pelo especificador de formato (`%d`) na string.

* **`printf("Altura: %.2f\n", altura);`**
    * **`%.2f`**: É o especificador de formato para um número de **ponto flutuante**. O `.2` especifica que o número será formatado para exibir **duas casas decimais** após o ponto.

* **`printf("Letra inicial: %c\n", letra);`**
    * **`%c`**: É o especificador de formato para um **caractere**.

---

## Finalizando o Programa

* **`return 0;`**
    Esta linha marca o fim da execução da função `main()`. Conforme mencionado anteriormente, o `0` (zero) indica que o programa foi concluído com sucesso ao sistema operacional.