function App() {
  const nomeUsuario = "Júlio César";
  return (
    <main style={{ padding: '20px', fontFamily: 'sans-serif' }}>
      <header>
        <div class="container">
          <h1>AutoPrime</h1>
          <nav>
            <ul>
              <li><a href="#">Início</a></li>
              <li><a href="#">Modelos</a></li>
              <li><a href="#">Serviços</a></li>
              <li><a href="#">Contato</a></li>
            </ul>
          </nav>
        </div>
      </header>

      <section class="hero">
        <div class="container">
          <h2>Encontre o carro perfeito para você</h2>
          <p>Carros novos e seminovos com garantia e o melhor preço do mercado.</p>
          <a href="#" class="btn">Ver modelos</a>
        </div>
      </section>

      <section class="modelos">
        <div class="container">
          <h2>Nossos modelos</h2>
          <StatusCard/>
        </div>
      </section>
      <footer>
        <div class="container">
            <p>&copy; 2025 AutoPrime. Todos os direitos reservados.</p>
        </div>
    </footer>
    </main>
    
  );
}

function StatusCard() {
  return (
    <main>
    <div class="cards">
      <div class="card">
        <img src="https://github.com/Julio5630/Atividades-Senac/blob/main/HTML-CSS-JS/Desenvolvimento-Web-Responsivo-23-10/img/sedan.png?raw=true" alt="SUV"/>
          <h3>SUV Premium</h3>
          <p>Espaço, conforto e potência para toda a família.</p>
          <a href="#" class="btn">Detalhes</a>
      </div>
      <div class="card">
        <img src="https://github.com/Julio5630/Atividades-Senac/blob/main/HTML-CSS-JS/Desenvolvimento-Web-Responsivo-23-10/img/sport.png?raw=true" alt="Esportivo"/>
          <h3>Esportivo Turbo</h3>
          <p>Desempenho de alto nível com design marcante.</p>
          <a href="#" class="btn">Detalhes</a>
      </div>
      <div class="card">
        <img src="https://github.com/Julio5630/Atividades-Senac/blob/main/HTML-CSS-JS/Desenvolvimento-Web-Responsivo-23-10/img/suv.png?raw=true" alt="Sedan"/>
          <h3>Sedan Luxo</h3>
          <p>Elegância e tecnologia para seu dia a dia.</p>
          <a href="#" class="btn">Detalhes</a>
      </div>
    </div>
    </main>
  );
}





export default App;