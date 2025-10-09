# Explorando Arrays e Matrizes em C

-----

Este repositório contém exemplos básicos de manipulação de arrays (vetores) e matrizes em C. Os códigos demonstram como declarar, inicializar, acessar e manipular dados armazenados nessas estruturas de dados fundamentais.

## Conteúdo

  * `pontuacoes_clientes.c`: Este programa demonstra o uso de um **array unidimensional** para armazenar e processar pontuações de clientes. Ele ilustra a declaração, atribuição de valores, acesso a elementos individuais e o cálculo da média das pontuações.

  * `precos_produtos.c`: Este exemplo foca na inicialização direta de um **array de floats** e na iteração sobre seus elementos usando um loop `for`. O código também mostra como modificar valores específicos dentro do array, como ajustar o preço de um produto.

  * `vendas_filiais.c`: Este programa apresenta o conceito de **matrizes bidimensionais** (arrays de arrays). Ele simula o registro de vendas mensais por filial, demonstrando como declarar e inicializar uma matriz, além de como usar loops aninhados para acessar e processar dados por linha (filial) e por coluna (mês). O exemplo também inclui o cálculo do total de vendas para uma filial específica e o total de vendas de um determinado mês em todas as filiais.

## Como Compilar e Rodar

Para compilar e executar qualquer um dos programas, você precisará de um compilador C (como o GCC). Siga os passos abaixo:

1.  **Salve o código:** Salve o conteúdo de um dos exemplos em um arquivo `.c` (ex: `pontuacoes_clientes.c`).
2.  **Abra o terminal:** Navegue até o diretório onde você salvou o arquivo.
3.  **Compile o código:** Use o seguinte comando para compilar:
    ```bash
    gcc pontuacoes_clientes.c -o pontuacoes_clientes.exe
    ```
4.  **Execute o programa:** Após a compilação, execute o programa com:
    ```bash
    ./pontuacoes_clientes.exe
    ```

-----
