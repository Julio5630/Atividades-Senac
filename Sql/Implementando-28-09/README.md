# 12. Implementando Automação e Auditoria com Gatilhos (Triggers)

## 🎯 Objetivo

Esta atividade foca na implementação de rotinas de banco de dados automáticas (Gatilhos/Triggers) no MySQL para reforçar a **integridade referencial**, garantir a **qualidade dos dados** e estabelecer a **rastreabilidade (auditoria)** das operações de e-commerce.

O script SQL (`07.BancoEcommerce.sql`) implementa três Gatilhos essenciais, cobrindo automação de processos, auditoria e validação de dados.

## ⚙️ Gatilhos Implementados

### Desafio 1: `trg_baixa_estoque` (Automação de Processos)

| Característica | Detalhes |
| :--- | :--- |
| **Ação** | `AFTER INSERT` na tabela `itens_pedido` |
| **Função** | Garante a **baixa automática** no campo `estoque` da tabela `produtos` sempre que um item é vendido. |
| **Variável Chave** | `NEW.quantidade` |

### Desafio 2: `trg_log_status_pedido` (Auditoria de Dados)

| Característica | Detalhes |
| :--- | :--- |
| **Pré-requisito** | Criação da tabela de log: `log_status_pedidos` |
| **Ação** | `BEFORE UPDATE` na tabela `pedidos` |
| **Função** | Cria um **histórico imutável** das mudanças de status de um pedido, inserindo o `status_antigo` (`OLD.status`) e o `status_novo` (`NEW.status`) na tabela de log. |
| **Variáveis Chave** | `OLD.status`, `NEW.status` |

### Desafio 3: `trg_validacao_cliente` (Qualidade e Padronização)

| Característica | Detalhes |
| :--- | :--- |
| **Ação** | `BEFORE INSERT` na tabela `usuarios` |
| **Função** | **Padroniza** o `nome` do cliente para letras maiúsculas e **bloqueia** a inserção se o campo `cpf` for `NULL` ou vazio, garantindo a qualidade dos dados essenciais. |
| **Comando de Bloqueio** | `SIGNAL SQLSTATE '45000'` com mensagem customizada. |

## 🛠️ Comandos de Manipulação

Para instalar, visualizar ou remover os gatilhos, utilize os comandos abaixo:

| Tarefa | Comando SQL |
| :--- | :--- |
| **Instalação** | Executar o script completo `07.BancoEcommerce.sql` |
| **Remoção** | `DROP TRIGGER IF EXISTS trg_nome_do_gatilho;` |
| **Listar Gatilhos** | `SHOW TRIGGERS;` |