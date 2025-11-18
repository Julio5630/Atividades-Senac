# 🚀 API RESTful de Usuários com Node.js e MySQL

Uma API RESTful completa e robusta para gerenciar usuários, construída com **Express.js** e **MySQL2**, seguindo as melhores práticas de desenvolvimento de APIs.

---

## 📋 Índice

- [Visão Geral](#visão-geral)
- [Requisitos](#requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Como Usar](#como-usar)
- [Endpoints da API](#endpoints-da-api)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Tratamento de Erros](#tratamento-de-erros)
- [Segurança](#segurança)
- [Contribuições](#contribuições)

---

## 👁️ Visão Geral

Esta API fornece um conjunto completo de operações **CRUD (Create, Read, Update, Delete)** para gerenciar usuários em um banco de dados MySQL. É ideal para aprender os conceitos fundamentais de desenvolvimento de APIs RESTful com Node.js.

### ✨ Características Principais

- ✅ Operações CRUD completas (Criar, Listar, Atualizar, Deletar)
- ✅ Proteção contra **SQL Injection** com Prepared Statements
- ✅ Pool de conexões MySQL para melhor performance
- ✅ Respostas em JSON estruturadas
- ✅ Logs detalhados de operações
- ✅ Tratamento robusto de erros
- ✅ Validação de dados de entrada
- ✅ Health check da API

---

## 📦 Requisitos

Antes de começar, certifique-se de ter instalado:

- **Node.js** (versão 14+) - [Baixar aqui](https://nodejs.org/)
- **MySQL** (versão 5.7+) ou **XAMPP** (que inclui MySQL)
- **npm** (geralmente vem com Node.js)

### Verificar instalações

```bash
node --version
npm --version
mysql --version
```

---

## 💻 Instalação

### 1. Clonar o repositório

```bash
git clone https://github.com/HudsonNeves/api_bd.git
cd api_bd
```

### 2. Instalar dependências

```bash
npm install
```

Isso instalará as seguintes dependências:
- `express` ^5.1.0 - Framework web para Node.js
- `mysql2` ^3.15.3 - Driver MySQL com suporte a Promises

### 3. Criar o banco de dados

Abra o MySQL e execute os seguintes comandos:

```sql
-- Criar banco de dados
CREATE DATABASE api_usuarios;

-- Usar o banco de dados
USE api_usuarios;

-- Criar tabela de usuários
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Inserir alguns dados de exemplo (opcional)
INSERT INTO usuarios (nome, email) VALUES
('João Silva', 'joao@example.com'),
('Maria Santos', 'maria@example.com'),
('Pedro Oliveira', 'pedro@example.com');
```

---

## ⚙️ Configuração

### Arquivo `db.js`

Este arquivo contém a configuração da conexão com o banco de dados MySQL:

```javascript
const dbConfig = {
    host: 'localhost',              // Host do servidor MySQL
    user: 'root',                   // Usuário MySQL
    password: '123456',             // Senha MySQL
    database: 'api_usuarios',       // Nome do banco de dados
    port: 3306,                     // Porta padrão do MySQL
    waitForConnections: true,       // Aguardar conexão disponível
    connectionLimit: 10,            // Máximo de conexões simultâneas
    queueLimit: 0                   // Sem limite de fila
};
```

### ⚠️ Alterar Credenciais

Se suas credenciais MySQL são diferentes, edite o arquivo `db.js`:

```javascript
const dbConfig = {
    host: 'seu_host',
    user: 'seu_usuario',
    password: 'sua_senha',
    database: 'seu_banco',
    port: 3306
};
```

---

## 🚀 Como Usar

### Iniciar o servidor

```bash
node server.js
```

Você verá a saída:

```
🚀 Servidor rodando em http://localhost:3001
📚 Rotas de Usuários: /usuarios
Conexão com MySQL estabelecida com sucesso! 💾
```

### Testar a API

Use **Postman**, **Insomnia**, **Thunder Client** ou **curl** para testar os endpoints.

---

## 🔌 Endpoints da API

### 1. Health Check (Verificar se a API está viva)

**Endpoint:** `GET /`

**Descrição:** Verifica se o servidor está funcionando

**Requisição:**
```bash
curl http://localhost:3001/
```

**Resposta (200 OK):**
```json
{
  "mensagem": "API RESTful de Usuários está funcionando com MySQL! 🚀",
  "versao": "2.0.0",
  "timestamp": "2025-11-18T10:30:45.123Z"
}
```

---

### 2. Listar Todos os Usuários

**Endpoint:** `GET /usuarios`

**Descrição:** Retorna uma lista com todos os usuários cadastrados

**Requisição:**
```bash
curl http://localhost:3001/usuarios
```

**Resposta (200 OK):**
```json
{
  "mensagem": "Lista de usuários recuperada com sucesso",
  "data": [
    {
      "id": 1,
      "nome": "João Silva",
      "email": "joao@example.com",
      "created_at": "2025-11-18T10:00:00.000Z",
      "updated_at": "2025-11-18T10:00:00.000Z"
    },
    {
      "id": 2,
      "nome": "Maria Santos",
      "email": "maria@example.com",
      "created_at": "2025-11-18T10:05:00.000Z",
      "updated_at": "2025-11-18T10:05:00.000Z"
    }
  ],
  "total": 2
}
```

---

### 3. Buscar Usuário por ID

**Endpoint:** `GET /usuarios/:id`

**Descrição:** Retorna um usuário específico pelo ID

**Parâmetros:**
- `id` (path parameter) - ID do usuário

**Requisição:**
```bash
curl http://localhost:3001/usuarios/1
```

**Resposta (200 OK):**
```json
{
  "mensagem": "Usuário encontrado com sucesso",
  "data": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@example.com",
    "created_at": "2025-11-18T10:00:00.000Z",
    "updated_at": "2025-11-18T10:00:00.000Z"
  }
}
```

**Resposta (404 Not Found):**
```json
{
  "mensagem": "Usuário não encontrado",
  "error": true
}
```

---

### 4. Criar Novo Usuário

**Endpoint:** `POST /usuarios`

**Descrição:** Cria um novo usuário no banco de dados

**Headers:**
```
Content-Type: application/json
```

**Body (JSON):**
```json
{
  "nome": "Lucas Costa",
  "email": "lucas@example.com"
}
```

**Requisição com curl:**
```bash
curl -X POST http://localhost:3001/usuarios \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "Lucas Costa",
    "email": "lucas@example.com"
  }'
```

**Resposta (201 Created):**
```json
{
  "mensagem": "Usuário criado com sucesso",
  "data": {
    "id": 3,
    "nome": "Lucas Costa",
    "email": "lucas@example.com"
  }
}
```

**Resposta (400 Bad Request) - Dados faltando:**
```json
{
  "mensagem": "Nome e email são obrigatórios",
  "error": true
}
```

**Resposta (409 Conflict) - Email duplicado:**
```json
{
  "mensagem": "Email já cadastrado",
  "error": true
}
```

---

### 5. Atualizar Usuário

**Endpoint:** `PUT /usuarios/:id`

**Descrição:** Atualiza completamente os dados de um usuário

**Parâmetros:**
- `id` (path parameter) - ID do usuário

**Headers:**
```
Content-Type: application/json
```

**Body (JSON):**
```json
{
  "nome": "João Silva Atualizado",
  "email": "joao.novo@example.com"
}
```

**Requisição com curl:**
```bash
curl -X PUT http://localhost:3001/usuarios/1 \
  -H "Content-Type: application/json" \
  -d '{
    "nome": "João Silva Atualizado",
    "email": "joao.novo@example.com"
  }'
```

**Resposta (200 OK):**
```json
{
  "mensagem": "Usuário atualizado com sucesso",
  "data": {
    "id": 1,
    "nome": "João Silva Atualizado",
    "email": "joao.novo@example.com"
  }
}
```

**Resposta (404 Not Found):**
```json
{
  "mensagem": "Usuário não encontrado",
  "error": true
}
```

---

### 6. Deletar Usuário

**Endpoint:** `DELETE /usuarios/:id`

**Descrição:** Remove um usuário do banco de dados

**Parâmetros:**
- `id` (path parameter) - ID do usuário

**Requisição com curl:**
```bash
curl -X DELETE http://localhost:3001/usuarios/1
```

**Resposta (200 OK):**
```json
{
  "mensagem": "Usuário removido com sucesso",
  "data": {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@example.com"
  }
}
```

**Resposta (404 Not Found):**
```json
{
  "mensagem": "Usuário não encontrado",
  "error": true
}
```

---

## 📁 Estrutura do Projeto

```
api_bd/
├── server.js          # Arquivo principal - Define todas as rotas e inicia o servidor
├── db.js              # Configuração da conexão com MySQL
├── package.json       # Dependências e metadados do projeto
├── README.md          # Este arquivo - Documentação completa
└── node_modules/      # Diretório das dependências (gerado após npm install)
```

### Descrição dos Arquivos

#### `server.js`
Arquivo principal da aplicação que:
- Define o servidor Express
- Configura middlewares
- Define todas as rotas CRUD
- Implementa tratamento de erros
- Inicia o servidor na porta 3001

#### `db.js`
Gerencia a conexão com MySQL:
- Cria um pool de conexões
- Configura credenciais do banco
- Testa a conexão ao iniciar

#### `package.json`
Metadados do projeto e dependências instaladas

---

## 🛡️ Tratamento de Erros

A API implementa tratamento robusto de erros:

| Código HTTP | Situação | Exemplo |
|-------------|----------|---------|
| **200** | Sucesso na requisição GET/PUT/DELETE | Usuário encontrado e atualizado |
| **201** | Sucesso na criação (POST) | Novo usuário criado |
| **400** | Requisição inválida | Dados obrigatórios faltando |
| **404** | Recurso não encontrado | Usuário com ID inexistente |
| **409** | Conflito (email duplicado) | Email já cadastrado |
| **500** | Erro interno do servidor | Erro na conexão com MySQL |

### Exemplo de Tratamento

```javascript
try {
    // Operação com banco de dados
} catch (error) {
    // Erro de chave duplicada (email único)
    if (error.code === 'ER_DUP_ENTRY') {
        return res.status(409).json({ 
            mensagem: 'Email já cadastrado', 
            error: true 
        });
    }
    // Outro erro
    res.status(500).json({ 
        mensagem: 'Erro interno do servidor', 
        error: true 
    });
}
```

---

## 🔒 Segurança

### ✅ Proteção contra SQL Injection

A API utiliza **Prepared Statements** com placeholders (`?`) para prevenir SQL Injection:

```javascript
// ✅ SEGURO - Usando prepared statement
const [results] = await pool.query(
    'SELECT * FROM usuarios WHERE id = ?', 
    [id]
);

// ❌ INSEGURO - Concatenação direta (NÃO FAZER!)
const query = `SELECT * FROM usuarios WHERE id = ${id}`;
```

### ✅ Validação de Entrada

- Validação de campos obrigatórios
- Verificação de tipos de dados
- Tratamento de valores nulos/indefinidos

### ✅ Logging de Operações

Todas as requisições são logadas no console:

```
GET /usuarios - Buscando todos os usuários
POST /usuarios - Criando novo usuário
PUT /usuarios/1 - Atualizando usuário
DELETE /usuarios/1 - Removendo usuário
```

### 📋 Recomendações de Segurança para Produção

Para um ambiente de produção, considere:

1. **Variáveis de Ambiente** - Use `.env` para senhas e configurações sensíveis
2. **Autenticação** - Implemente JWT ou OAuth2
3. **Rate Limiting** - Limite requisições por IP
4. **HTTPS** - Use certificados SSL/TLS
5. **CORS** - Configure adequadamente quem pode acessar
6. **Validação com Schemas** - Use bibliotecas como `joi` ou `yup`
7. **Helmet.js** - Adicione headers de segurança
8. **Senhas Hash** - Se houver autenticação, nunca armazene senhas em texto plano

---

## 🤝 Contribuições

Contribuições são bem-vindas! Para contribuir:

1. Faça um Fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

---

## 📄 Licença

Este projeto está sob a licença ISC. Veja o arquivo `package.json` para mais detalhes.

---

## 📚 Recursos Adicionais

- [Documentação Express.js](https://expressjs.com/)
- [Documentação MySQL2](https://github.com/sidorares/node-mysql2)
- [Guia REST API](https://restfulapi.net/)
- [HTTP Status Codes](https://httpwg.org/specs/rfc7231.html#status.codes)

---

## 👨‍💼 Autor

**Hudson Neves**

- GitHub: [@HudsonNeves](https://github.com/HudsonNeves)
- Email: hudson@example.com

---

## 🎯 Próximos Passos

Ideias para melhorar e expandir o projeto:

- [ ] Adicionar autenticação com JWT
- [ ] Implementar validação com `joi` ou `yup`
- [ ] Adicionar testes unitários com Jest
- [ ] Configurar logging com Winston
- [ ] Adicionar paginação nos resultados
- [ ] Implementar filtros e busca avançada
- [ ] Adicionar CORS configurável
- [ ] Dockerizar a aplicação
- [ ] Implementar cache com Redis
- [ ] Adicionar documentação Swagger/OpenAPI

---

**Última atualização:** 18 de Novembro de 2025

**Versão:** 2.0.0