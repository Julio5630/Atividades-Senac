
---

# 📦 Banco de Dados - Ecommerce

Este repositório contém a modelagem e implementação de um banco de dados para um sistema de **E-commerce**, cobrindo desde a criação das tabelas até consultas avançadas, procedures, views e triggers.

---

## 📑 Sumário

1. [Visão Geral](#visão-geral)
2. [Modelagem e Estrutura](#modelagem-e-estrutura)
3. [Scripts do Projeto](#scripts-do-projeto)

   * [01 - Criação do Banco e Tabelas](#01---criação-do-banco-e-tabelas)
   * [02 - Inserção de Dados](#02---inserção-de-dados)
   * [03 - Consultas SQL](#03---consultas-sql)
   * [04 - Transações](#04---transações)
   * [05 - Procedures](#05---procedures)
   * [06 - Views](#06---views)
   * [07 - Triggers](#07---triggers)
4. [Como Executar](#como-executar)
---

## 📖 Visão Geral

O banco **Ecommerce** foi projetado para simular um sistema de vendas online, contemplando:

* Cadastro de clientes e endereços;
* Produtos, categorias e controle de estoque;
* Registro de pedidos e seus itens;
* Regras de negócio aplicadas com **transações**, **procedures**, **views** e **triggers**.

---

## 🏗️ Modelagem e Estrutura

As principais entidades e seus relacionamentos:

* **Usuários (clientes)**: informações pessoais, contato e CPF.
* **Endereços**: vinculados a usuários.
* **Categorias**: organização de produtos.
* **Produtos**: possuem preço, estoque e categoria.
* **Pedidos**: vinculados a clientes, com status e valor total.
* **Itens do Pedido**: produtos comprados em cada pedido.

**Integridade referencial** garantida por chaves estrangeiras.
**Índices** criados para otimizar buscas e junções. 

---

## 💾 Scripts do Projeto

### 01 - Criação do Banco e Tabelas

Arquivo: **01.BancoEcommerce.sql**

* Criação do banco `ecommerce`.
* Definição das tabelas e constraints.
* Criação de **índices** e **foreign keys**. 

---

### 02 - Inserção de Dados

Arquivo: **02.BancoEcommerce.sql**

* Popula o banco com **30 usuários, endereços, categorias, produtos, pedidos e itens**.
* Estrutura pensada para simular cenários reais de e-commerce. 

---

### 03 - Consultas SQL

Arquivo: **03.BancoEcommerce.sql**

* Consultas de nível básico a avançado:

  * Seleção de clientes, produtos e pedidos.
  * Consultas com **JOINs**, **agregações** e **filtros**.
  * Relatórios como: clientes com pedidos enviados, produtos mais caros, valor total de vendas. 

---

### 04 - Transações

Arquivo: **04.BancoEcommerce.sql**

* Exemplos de **uso de transações**:

  * Inserção de pedido e atualização de estoque.
  * Cancelamento de pedido com reposição de estoque.
  * Uso de `ROLLBACK` e `COMMIT`. 

---

### 05 - Procedures

Arquivo: **05.BancoEcommerce.sql**

* Procedures para automação de operações:

  * `listar_produtos_por_categoria` → lista produtos de uma categoria.
  * `atualizar_preco_categoria` → altera preços de produtos de uma categoria. 

---

### 06 - Views

Arquivo: **06.BancoEcommerce.sql**

* Views para simplificar relatórios:

  * `v_pedidos_detalhados` → detalha pedidos com cliente e produtos.
  * `v_clientes_sem_senha` → lista clientes sem dados sensíveis.
  * `v_resumo_estoque_baixo` → identifica produtos com estoque crítico. 

---

### 07 - Triggers

Arquivo: **07.BancoEcommerce.sql**

* Regras automáticas no banco:

  * `trg_baixa_estoque` → reduz estoque após novo item de pedido.
  * `trg_log_status_pedido` → registra mudanças de status em tabela de auditoria.
  * `trg_validacao_cliente` → valida CPF e padroniza nomes em maiúsculo. 

---


## 🚀 Como Executar

1. Clone este repositório:

   ```bash
   git clone https://github.com/seuusuario/ecommerce-db.git
   cd ecommerce-db
   ```
2. Execute os scripts na ordem:

   ```sql
   source 01.BancoEcommerce.sql;
   source 02.BancoEcommerce.sql;
   source 03.BancoEcommerce.sql;
   source 04.BancoEcommerce.sql;
   source 05.BancoEcommerce.sql;
   source 06.BancoEcommerce.sql;
   source 07.BancoEcommerce.sql;
   ```

---

