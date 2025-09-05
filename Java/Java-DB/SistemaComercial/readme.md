# 🚀Sistema Comercial Java: Descomplicando a Gestão de Produtos!🚀

## ✨ Destaques do Projeto

*   **Login Seguro:** Acesse o sistema com credenciais de administrador para garantir a segurança dos seus dados.
*   **Cadastro de Produtos Completo:** Adicione, edite, visualize e remova produtos com facilidade, mantendo seu catálogo sempre atualizado.
*   **Interface Moderna:** Desenvolvido com Swing e um toque de FlatLaf para uma experiência visual agradável e responsiva.
*   **Arquitetura Limpa:** Organizado em camadas (Model, View, Controller, DAO) para facilitar a manutenção e escalabilidade.

## 🛠️ Tecnologias Utilizadas

*   **Java:** A espinha dorsal do nosso sistema, garantindo robustez e portabilidade.
*   **Swing:** Para a construção da interface gráfica de usuário (GUI).
*   **MVC (Model-View-Controller):** Padrão de arquitetura que separa a lógica de negócios da interface do usuário, promovendo um código mais organizado e fácil de manter.

## 📂 Estrutura do Projeto

O projeto está organizado de forma clara e modular, seguindo as melhores práticas de desenvolvimento Java:

*   **`br.com.sistemacomercial.controller`**: Contém a lógica de controle da aplicação, intermediando a comunicação entre a View e o Model.
    *   `ProdutoController.java`: Gerencia as operações de CRUD para produtos.
*   **`br.com.sistemacomercial.dao`**: Responsável pela persistência e acesso aos dados.
    *   `ProdutoDAO.java`: Implementa as operações de adição e listagem de produtos (atualmente em memória).
*   **`br.com.sistemacomercial.model`**: Define as classes de modelo de dados.
    *   `Produto.java`: Representa a entidade "Produto" com seus atributos e métodos.
*   **`br.com.sistemacomercial.view`**: Contém as classes da interface gráfica do usuário.
    *   `LoginView.java`: Tela de login inicial do sistema.
    *   `NovaTela.java`: Uma tela adicional que replica a funcionalidade de login.
    *   `ProdutoView.java`: Interface para o cadastro e gerenciamento de produtos.
    *   `TelaCadastroProduto.java`: Outra interface para o cadastro e gerenciamento de produtos (similar à `ProdutoView`).
*   **`module-info.java`**: Define os módulos do projeto, garantindo a correta resolução de dependências.

## 🚀 Como Rodar o Projeto

Para colocar o Sistema Comercial em funcionamento, siga estes passos simples:

1.  **Clone o Repositório:**
    ```bash
    git clone <URL_DO_SEU_REPOSITORIO>
    cd SistemaComercialJava
    ```
2.  **Abra em sua IDE Favorita:**
    *   Importe o projeto como um projeto Maven ou Gradle (se configurado) ou um projeto Java existente no Eclipse, IntelliJ IDEA, VS Code, etc.
3.  **Compile e Execute:**
    *   Navegue até a classe `LoginView.java` ou `TelaCadastroProduto.java` (para testar diretamente a tela de produtos).
    *   Execute o método `main` da classe escolhida.

### Credenciais de Acesso (LoginView / NovaTela)

*   **Usuário:** `admin`
*   **Senha:** `123`

## 🎯 Próximos Passos e Melhorias

Este projeto é uma base sólida e pode ser expandido com diversas funcionalidades:

*   **Persistência de Dados Real:** Integrar com um banco de dados (MySQL, PostgreSQL, H2, etc.) para persistir os dados de produtos de forma permanente.
*   **Funcionalidades de Venda:** Adicionar módulos para registro de vendas, carrinho de compras, etc.
*   **Relatórios:** Gerar relatórios de estoque, vendas, produtos mais vendidos.
*   **Autenticação Avançada:** Implementar um sistema de autenticação mais robusto com diferentes níveis de usuário.
*   **Testes Unitários:** Escrever testes para garantir a integridade e o bom funcionamento das funcionalidades.

## 🤝 Contribuição

Sinta-se à vontade para contribuir com este projeto! Seja corrigindo bugs, adicionando novas funcionalidades ou melhorando a documentação. Toda ajuda é bem-vinda!

1.  Faça um Fork do projeto.
2.  Crie uma nova branch (`git checkout -b feature/MinhaNovaFuncionalidade`).
3.  Faça suas alterações e commit (`git commit -m 'Adiciona nova funcionalidade X'`).
4.  Envie para a branch (`git push origin feature/MinhaNovaFuncionalidade`).
5.  Abra um Pull Request.

---
