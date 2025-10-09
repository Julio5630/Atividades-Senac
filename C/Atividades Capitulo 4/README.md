
-----

# Projetos de Programação em C

Bem-vindo à coleção de projetos em C\! Este repositório reúne uma série de programas simples, porém educativos, desenvolvidos para explorar conceitos fundamentais da linguagem C, como controle de fluxo, interação com o usuário e manipulação de dados.

Cada programa foi projetado para ser direto e funcional, servindo como um excelente ponto de partida para quem está aprendendo C ou deseja revisar seus fundamentos.

-----

## Como Rodar os Programas

Para compilar e executar qualquer um desses programas, você precisará ter um compilador C instalado no seu sistema. O **GCC** (GNU Compiler Collection) é amplamente utilizado e recomendado.

Siga estes passos:

1.  **Salve o Código:** Salve o código de cada programa em um arquivo com a extensão `.c` (por exemplo: `entrada_numeros.c`, `contagem.c`, `soma_produtos.c`, etc.).
2.  **Abra o Terminal:** Navegue até o diretório onde você salvou os arquivos `.c` usando seu terminal ou prompt de comando.
3.  **Compile:** Utilize o comando `gcc` para compilar o programa. Por exemplo, para um arquivo chamado `meu_programa.c`:
    ```bash
    gcc meu_programa.c -o meu_programa.exe
    ```
    Isso criará um arquivo executável com o nome `meu_programa.exe` 
4.  **Execute:** Após a compilação, você pode rodar o programa executável:
    ```bash
    ./meu_programa.exe
    ```
    (No Windows, basta digitar `meu_programa.exe`)

-----

## Descrição dos Programas

Aqui está um breve resumo de cada programa incluído neste repositório:

### 1\. Leitura de Números Inteiros

Este programa demonstra o uso de **loops** para coletar entradas do usuário. Ele solicita que você digite números inteiros repetidamente e só para quando um **número negativo** é inserido, indicando o fim da entrada de dados.

### 2\. Contagem Simples

Um exemplo clássico de **loop**, este programa exibe sequencialmente os números de **10 a 20** no console, um por linha. É ideal para entender a estrutura básica de repetição.

### 3\. Soma de Valores de Produtos

Este programa interativo permite que você insira o **valor de diversos produtos**. Ele continua somando os valores até que você digite **zero**, sinalizando que todos os produtos foram inseridos. Ao final, ele mostra a **soma total** de todos os valores.

### 4\. Tabuada de Multiplicação

Com este programa, você pode gerar a **tabuada de multiplicação** de qualquer número inteiro. Basta digitar o número desejado e o programa apresentará sua tabuada de 1 a 10.

### 5\. Pesquisa de Dados Demográficos

Este é o programa mais abrangente da coleção. Ele simula uma **pesquisa de dados demográficos**, coletando informações como **idade**, **sexo** e **salário** de múltiplos indivíduos. Ele inclui **validações básicas** para as entradas e, ao final, calcula e exibe:

  * A **maior idade** registrada.
  * A **média salarial** dos participantes.
  * A **quantidade de mulheres** na pesquisa.
  * Se há algum habitante com **salário abaixo de R$ 500**.

Para finalizar a entrada de dados, basta digitar `0` para a idade.

-----

Sinta-se à vontade para explorar, compilar e rodar cada um desses programas para entender como eles funcionam\! Se tiver alguma dúvida ou sugestão, não hesite em perguntar.