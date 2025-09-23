# 🚚 **Sistema de Logística Integrado** - README 🚛

Bem-vindo ao **Sistema de Logística Dinâmico**! Este banco de dados é o coração pulsante de uma operação logística moderna, projetado para gerenciar entregas eficientes, frotas ágeis e clientes satisfeitos. Imagine um hub central onde rotas se entrelaçam como estradas digitais, veículos zumbem como abelhas operárias e pagamentos fluem como rios de eficiência. Desenvolvido em SQL, este sistema é escalável, robusto e pronto para impulsionar sua logística para o próximo nível! 🌟

## 📋 **Visão Geral do Projeto**
- **Objetivo Principal**: Automatizar e otimizar processos logísticos, desde o cadastro de clientes até o rastreamento de entregas em tempo real.
- **Tecnologias Utilizadas**:
  - Banco de Dados: MySQL/PostgreSQL (compatível com SQL padrão).
  - Estrutura: Tabelas normalizadas com relacionamentos via chaves estrangeiras para integridade de dados.
  - Recursos Avançados: Procedimentos armazenados (stored procedures) para operações complexas e consultas otimizadas.
- **Por Que Criativo?** Pense nisso como um "GPS para Negócios": cada tabela é um nó em uma rede de rotas, guiando dados de forma inteligente e visualizando fluxos como um mapa interativo! 🗺️

## 🏗️ **Estrutura do Banco de Dados**
O sistema é dividido em módulos modulares, como peças de um quebra-cabeça logístico. Cada arquivo SQL representa um componente chave. Aqui vai um **mapa visual** das tabelas principais:

<div align="center">
  <img src="img/Fluxograma.png" alt="Banner mostrando um sistema de gestão de CNH com interface" />
  <br>

</div>


- **Tabelas Principais** (resumidas com emojis para visual flair):


 | Tabela | Emoji | Descrição Rápida | Relações Chave |
|--------|-------|------------------|---------------|
| **Clientes** | 👥 | Dados pessoais, endereços e histórico de pedidos – o "quem" da logística. | Liga a Entregas e Pagamentos. |
| **Funcionários/Admin** | 👔 | Equipe ADM com permissões e acessos – os guardiões do sistema. | Integra com Ocorrências e Rotas. |
| **Entregas** | 📦 | Status, prazos e rastreamento – o "o quê" e "quando" das missões. | Conecta a Rotas, Motoristas e Clientes. |
| **Veículos** | 🚗 | Frota com manutenção e disponibilidade – os cavalos de ferro! | Parte de Frotas e liga a Entregas. |
| **Ocorrências** | ⚠️ | Logs de incidentes e atrasos – o "detetive" de problemas. | Reporta de Entregas e Motoristas. |
| **Frotas** | 🚌 | Grupos de veículos por região – a organização em escala. | Agrupa Veículos e Rotas. |
| **Motoristas** | 🚙 | Perfis, licenças e horários – os pilotos heróicos. | Atribui a Entregas e Veículos. |
| **Pagamentos** | 💰 | Faturamento e recibos – o fluxo de riqueza. | Vincula a Clientes e Entregas. |
| **Rotas** | 🛣️ | Caminhos otimizados com distâncias – o cérebro estratégico. | Guia Entregas e Frotas. |

## 🔧 **Como Instalar e Usar**
Siga estes passos para "ligar o motor" do seu sistema logístico! ⛽

1. **Pré-requisitos**:
   - Instale um SGBD como MySQL (versão 8.0+) ou PostgreSQL.
   - Ferramentas: MySQL Workbench ou pgAdmin para visualização gráfica.

2. **Instalação**:
   - Clone ou baixe os arquivos SQL do repositório.
   - Execute os scripts na ordem recomendada:
     - **Primeiro**: `criacao-consultas.sql` – Cria tabelas base e consultas iniciais.
     - **Em Seguida**: Arquivos modulares (ex: `sistema_logistica_clientes.sql` para clientes).
     - **Por Último**: `Procedures.sql` – Adiciona procedimentos armazenados para automações.

3. **Testando o Sistema**:
   - Insira dados de amostra via INSERTs nos scripts.
   - Rode uma consulta exemplo: `SELECT * FROM entregas WHERE status = 'Em Rota';` para ver entregas ativas! 📊

