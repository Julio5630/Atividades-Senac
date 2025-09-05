# README.md

## Sistema de Login

Bem-vindo ao **Sistema de Login**! Este projeto é uma aplicação Java que permite a autenticação de usuários através de um sistema de login simples, utilizando um banco de dados MySQL para armazenar as credenciais dos usuários.

## Descrição do Projeto

O **Sistema de Login** é uma aplicação que permite que os usuários se autentiquem com um nome de usuário e senha. O sistema verifica as credenciais fornecidas em um banco de dados e informa se o login foi bem-sucedido ou não. É uma ótima maneira de aprender sobre manipulação de dados em Java e integração com bancos de dados.

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
   - Acesse o MySQL e crie um banco de dados chamado `sistema_login`:
     ```sql
     CREATE DATABASE sistema_login;
     ```
   - Crie a tabela `usuarios` com a seguinte estrutura:
     ```sql
     CREATE TABLE usuarios (
         id INT AUTO_INCREMENT PRIMARY KEY,
         usuario VARCHAR(100) NOT NULL,
         senha VARCHAR(100) NOT NULL
     );
     ```

3. **Configurar a Conexão**:
   - Abra o arquivo `Conexao.java` e verifique se as credenciais de acesso ao banco de dados estão corretas:
     ```java
     private static final String URL = "jdbc:mysql://localhost:3307/sistema_login";
     private static final String USUARIO = "root"; // seu usuário do MySQL
     private static final String SENHA = "senac"; // sua senha do MySQL
     ```

4. **Importar o Projeto na IDE**:
   - Abra sua IDE e importe o projeto clonado como um projeto Java.

5. **Executar a Aplicação**:
   - Localize a classe `LoginApp` e execute-a. O sistema solicitará que você insira seu nome de usuário e senha.
   - Siga as instruções no console para interagir com o sistema.

## Estrutura do Projeto

```
SistemaLogin/
│
├── LoginApp.java       # Classe principal que executa o sistema de login
├── Usuario.java        # Classe que representa um usuário
├── UsuarioDAO.java     # Classe responsável pela interação com o banco de dados
└── Conexao.java        # Classe que gerencia a conexão com o banco de dados
```

## Contribuição

Contribuições são bem-vindas! Se você deseja contribuir com melhorias ou correções, siga os passos abaixo:

1. Faça um fork deste repositório.
2. Crie uma nova branch (`git checkout -b feature/nome-da-sua-feature`).
3. Faça suas alterações e commit (`git commit -m 'Adicionando nova funcionalidade'`).
4. Envie para o repositório remoto (`git push origin feature/nome-da-sua-feature`).
5. Abra um Pull Request.



Agradecemos por usar o **Sistema de Login**! Se você tiver alguma dúvida ou sugestão, sinta-se à vontade para entrar em contato.
