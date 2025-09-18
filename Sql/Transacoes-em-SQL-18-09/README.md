
````markdown
# 🛒 Banco de Dados Ecommerce

Este projeto implementa um banco de dados relacional para um sistema de **E-commerce**, contemplando clientes, endereços, categorias, produtos, pedidos e itens de pedido.  
O objetivo é demonstrar desde a **criação do esquema**, **inserção de dados fictícios**, **consultas SQL úteis** até **transações com controle de integridade**.

---

## 📂 Estrutura do Projeto

- **01.BancoEcommerce.sql** → Criação do banco e tabelas, definição de chaves primárias e estrangeiras.  
- **02.BancoEcommerce.sql** → Inserção de dados iniciais (usuários, endereços, categorias, produtos, pedidos e itens de pedido).  
- **03.BancoEcommerce.sql** → Consultas SQL variadas (seleções, joins, agregações, filtros, ordenações).  
- **04.BancoEcommerce.sql** → Transações (INSERT, UPDATE, COMMIT, ROLLBACK) para manipulação de pedidos e estoque.  

---

## 🏗️ Modelo de Dados

As principais entidades do banco são:

- **Usuarios** → Clientes cadastrados com dados pessoais.  
- **Enderecos** → Endereços vinculados a usuários.  
- **Categorias** → Classificação dos produtos (ex: Eletrônicos, Livros, Roupas).  
- **Produtos** → Itens disponíveis para compra, associados a categorias.  
- **Pedidos** → Registro de compras feitas pelos clientes.  
- **Itens_Pedido** → Detalhamento dos produtos incluídos em cada pedido.  

🔗 Relacionamentos:  
- Um **usuário** pode ter vários **endereços**.  
- Um **produto** pertence a uma **categoria**.  
- Um **pedido** pertence a um **usuário** e contém vários **itens**.  
- Um **item de pedido** referencia **um produto** específico.  

---

## 📊 Exemplos de Consultas

Algumas queries implementadas em `03.BancoEcommerce.sql`:

- Listar todos os usuários:  
  ```sql
  SELECT * FROM usuarios;
````

* Produtos acima de R\$ 500,00:

  ```sql
  SELECT nome, preco FROM produtos WHERE preco > 500.00;
  ```
* Nome do cliente + status dos pedidos:

  ```sql
  SELECT u.nome, p.status
  FROM usuarios AS u
  JOIN pedidos AS p ON u.id = p.cliente_id;
  ```
* Produto mais barato:

  ```sql
  SELECT nome, preco FROM produtos ORDER BY preco ASC LIMIT 1;
  ```

---

## 🔄 Transações (Controle de Estoque)

Exemplo em `04.BancoEcommerce.sql`:

* Inserir um novo pedido ✅
* Atualizar o estoque do produto 🛠️
* Cancelar um pedido e **repor o estoque** ↩️
* Alterar preços de produtos com possibilidade de **ROLLBACK**

```sql
START TRANSACTION;

-- Inserir pedido
INSERT INTO pedidos (id, cliente_id, data_pedido, status, total)
VALUES (31, 1, NOW(), 'Pago', 360.00);

-- Inserir itens
INSERT INTO itens_pedido (id, pedido_id, produto_id, quantidade, preco_unitario)
VALUES (31, 31, 1, 2, 180.00);

-- Atualizar estoque
UPDATE produtos SET estoque = estoque - 2 WHERE id = 1;

COMMIT;
```

---

## 🚀 Como Usar

1. Crie o banco de dados e tabelas:

   ```sql
   SOURCE 01.BancoEcommerce.sql;
   ```
2. Popule com dados de exemplo:

   ```sql
   SOURCE 02.BancoEcommerce.sql;
   ```
3. Execute consultas para testar:

   ```sql
   SOURCE 03.BancoEcommerce.sql;
   ```
4. Rode transações:

   ```sql
   SOURCE 04.BancoEcommerce.sql;
   ```

---

## 📌 Objetivo

Este banco foi projetado para fins **didáticos**, servindo como base para estudos de:

* Criação de esquema relacional.
* Normalização e integridade referencial.
* Consultas SQL simples e avançadas.
* Controle transacional com COMMIT e ROLLBACK.

---

