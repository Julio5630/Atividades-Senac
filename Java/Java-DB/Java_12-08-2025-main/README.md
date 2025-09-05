# Sistema de Gerenciamento de Clientes

Bem-vindo ao **Sistema de Gerenciamento de Clientes**! Este projeto foi desenvolvido para facilitar o cadastro, listagem, atualização e remoção de clientes em um banco de dados. A seguir, você encontrará informações detalhadas sobre como usar o sistema, suas funcionalidades e como configurá-lo.

## Descrição do Projeto

O **Sistema de Gerenciamento de Clientes** é uma aplicação em Java que permite gerenciar informações de clientes em um banco de dados MySQL. O sistema oferece uma interface simples e intuitiva para realizar operações como cadastrar novos clientes, listar todos os clientes, atualizar informações de clientes existentes e deletar clientes do sistema.

## Requisitos para Execução

Antes de executar a aplicação, certifique-se de que você possui os seguintes requisitos:

- **Java JDK**: Versão 8 ou superior instalada em sua máquina.
- **MySQL**: Banco de dados MySQL instalado e em execução.
- **JDBC Driver**: O driver JDBC para MySQL deve estar disponível no classpath do seu projeto.
- **IDE**: Uma IDE como Eclipse, IntelliJ IDEA ou NetBeans para facilitar o desenvolvimento e execução do código.

## Passos para Instalar e Executar a Aplicação

1. **Clone o Repositório**:
   - Abra o terminal e execute o seguinte comando:
     ```bash
     git clone https://github.com/seu-usuario/nome-do-repositorio.git
     ```
   - Navegue até o diretório do projeto:
     ```bash
     cd nome-do-repositorio
     ```

2. **Configurar o Banco de Dados**:
   - Acesse o MySQL e crie um banco de dados chamado `sistema_clientes`:
     ```sql
     CREATE DATABASE sistema_clientes;
     ```
   - Crie a tabela `clientes` com a seguinte estrutura:
     ```sql
     CREATE TABLE clientes (
         id INT AUTO_INCREMENT PRIMARY KEY,
         nome VARCHAR(100) NOT NULL,
         email VARCHAR(100) NOT NULL
     );
     ```

3. **Configurar a Conexão**:
   - Abra o arquivo `Conexao.java` e verifique se as credenciais de acesso ao banco de dados estão corretas:
     ```java
     private static final String URL = "jdbc:mysql://localhost:3307/sistema_clientes";
     private static final String USER = "root"; // seu usuário do MySQL
     private static final String PASSWORD = "senac"; // sua senha do MySQL
     ```

4. **Importar o Projeto na IDE**:
   - Abra sua IDE e importe o projeto clonado como um projeto Java.

5. **Executar a Aplicação**:
   - Localize a classe `main` e execute-a. O menu do sistema será exibido no console.
   - Siga as instruções no console para interagir com o sistema.

---

Agradecemos por usar o **Sistema de Gerenciamento de Clientes**! Se você tiver alguma dúvida ou sugestão, sinta-se à vontade para entrar em contato.
