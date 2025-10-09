
-----

# Sistema de Registro de Vendas Diárias

Este é um programa simples em C que permite registrar as vendas de produtos em um determinado dia e calcular o total geral das vendas.

## Funcionalidades

  * **Registro de Múltiplos Produtos**: Permite inserir dados para vários produtos vendidos em um dia.
  * **Cálculo por Produto**: Calcula o valor total para cada produto individualmente (quantidade \* preço).
  * **Cálculo do Total Diário**: Soma os totais de todos os produtos para fornecer o valor total de vendas do dia.
  * **Validação Básica**: Verifica se a quantidade e o preço são valores válidos (não negativos ou zero para quantidade).
  * **Reuso**: Oferece a opção de registrar as vendas de outro dia após a conclusão do dia atual.

## Como Compilar e Executar

Para compilar este programa, você precisará de um compilador C (como o GCC).

1.  **Salve o Código**: Salve o código-fonte como `vendas.c` (ou qualquer outro nome com extensão `.c`).

2.  **Compile**: Abra um terminal ou prompt de comando e execute o seguinte comando:

    ```bash
    gcc vendas.c -o vendas.exe
    ```

    Isso criará um arquivo executável chamado `vendas` (ou `vendas.exe` no Windows).

3.  **Execute**: Para rodar o programa, digite:

    ```bash
    ./vendas.exe
    ```

    No Windows, você pode simplesmente digitar `vendas`.

## Como Usar

Ao executar o programa, siga as instruções no console:

1.  O programa pedirá o número de **produtos diferentes** vendidos no dia.
2.  Para cada produto, você deverá informar:
      * **Nome do produto**: O nome do item vendido.
      * **Quantidade vendida**: Quantas unidades desse produto foram vendidas.
      * **Preço unitário**: O preço de uma única unidade do produto.
3.  Após inserir os dados de todos os produtos, o programa exibirá o **total geral de vendas do dia**.
4.  Será perguntado se deseja **registrar outro dia de vendas**. Digite `s` para sim ou `n` para não.

## Exemplo de Interação

```
-- Registro de Vendas do Dia --
Quantos produtos diferentes foram vendidos hoje? 2

Produto 1:
Nome do produto: Camiseta
Quantidade vendida: 3
Preço unitário: R$ 25.50
Total do produto Camiseta: R$ 76.50

Produto 2:
Nome do produto: Calça Jeans
Quantidade vendida: 1
Preço unitário: R$ 80.00
Total do produto Calça Jeans: R$ 80.00

Total geral de vendas do dia: R$ 156.50

Deseja registrar outro dia de vendas? (s/n): n

Encerrando o sistema de vendas.
```

## Requisitos do Sistema

  * Um compilador C (ex: GCC)
  * Sistema operacional compatível (Linux, macOS, Windows)

-----
