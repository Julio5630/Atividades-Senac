# Curso React SPA

Um projeto React moderno construído com Vite, oferecendo uma excelente experiência de desenvolvimento e performance otimizada.

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado em sua máquina:

- **Node.js** (versão 16.0 ou superior)
- **npm** (vem automaticamente com o Node.js)
- **Git** (para clonar o repositório)

Para verificar se você tem esses itens instalados, execute:
```bash
node --version
npm --version
git --version
```

## 🚀 Como Iniciar o Projeto do Zero

### Passo 1: Clonar o Repositório

```bash
git clone https://github.com/2025-08-53/curso-react.git
cd curso-react
```

### Passo 2: Instalar as Dependências

Na raiz do projeto, execute:

```bash
npm install
```

Isso irá:
- Baixar todas as dependências do projeto
- Instalar o React, Vite e todas as ferramentas necessárias
- Criar a pasta `node_modules`

### Passo 3: Iniciar o Servidor de Desenvolvimento

```bash
npm run dev
```

Você verá uma saída similar a:
```
VITE v4.x.x ready in xxx ms

➜  Local:   http://localhost:5173/
➜  press h to show help
```

### Passo 4: Abrir no Navegador

- Abra seu navegador
- Acesse: http://localhost:5173/
- O projeto será carregado automaticamente

## 📦 Estrutura do Projeto

```
curso-react/
├── src/
│   ├── App.jsx          # Componente principal
│   ├── App.css          # Estilos do App
│   ├── main.jsx         # Ponto de entrada do React
│   ├── index.css        # Estilos globais
│   └── assets/          # Imagens e arquivos estáticos
├── public/              # Arquivos públicos
├── package.json         # Dependências do projeto
├── vite.config.js       # Configuração do Vite
├── eslint.config.js     # Configuração do ESLint
└── README.md            # Este arquivo
```

## 🛠️ Scripts Disponíveis

### Desenvolvimento
```bash
npm run dev
```
Inicia o servidor de desenvolvimento com Hot Module Replacement (HMR)

### Build para Produção
```bash
npm run build
```
Compila o projeto para produção na pasta `dist/`

### Preview do Build
```bash
npm run preview
```
Visualiza o build de produção localmente antes de fazer deploy

## 🎨 Características

- ✅ **Vite**: Build rápido e HMR configurado
- ✅ **React 18**: Última versão do React
- ✅ **ESLint**: Linting de código para melhor qualidade
- ✅ **Hot Module Replacement**: Atualização instantânea durante desenvolvimento
- ✅ **CSS Moderno**: Suporte completo a CSS3

## 🔧 Tecnologias Utilizadas

- **React** - Biblioteca JavaScript para interfaces
- **Vite** - Build tool e dev server ultrarrápido
- **Node.js & npm** - Ambiente de execução e gerenciador de pacotes
- **ESLint** - Ferramenta de análise de código

## 📝 Primeiros Passos após Iniciar

1. Toda a aplicação está no arquivo `src/App.jsx`
2. Modifique-o para criar seus componentes
3. Adicione estilos em `src/App.css` ou crie arquivos CSS separados
4. Os estilos globais estão em `src/index.css`

## ❓ Troubleshooting

### Porta 5173 já está em uso

Se a porta 5173 estiver ocupada, você pode:
- Esperar o processo anterior terminar
- Usar uma porta diferente: `npm run dev -- --port 3000`
- Fechar o aplicativo que está usando a porta

### npm install não funciona

Tente limpar o cache:
```bash
npm cache clean --force
rm -rf node_modules package-lock.json
npm install
```

### Erros de ESLint

Se receber erros de linting, corrija os problemas apontados ou desative a regra no arquivo ESLint

## 📚 Referências Úteis

- [Documentação React](https://react.dev)
- [Documentação Vite](https://vitejs.dev)
- [Node.js Guide](https://nodejs.org/en/docs/)

## 📄 Licença

Este projeto está disponível sob a licença MIT.

---

**Dúvidas?** Abra uma issue no repositório GitHub.
