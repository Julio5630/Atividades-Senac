import { useState } from 'react'
import './App.css'

function App() {
  const [tarefas, setTarefas] = useState(["Aprender React", "Configurar Node 24"])
  const [inputTarefa, setInputTarefa] = useState("")

  const adicionarTarefa = (e) => {
    e.preventDefault()
    
    if (inputTarefa.trim() === "") return

    setTarefas([...tarefas, inputTarefa])
    setInputTarefa("")
  }

  const removerTarefa = (indexParaRemover) => {
    const novasTarefas = tarefas.filter((_, index) => index !== indexParaRemover)
    setTarefas(novasTarefas)
  }

  return (
    <div className="container">
      <h1>Minha Lista de Estudos</h1>

      <form onSubmit={adicionarTarefa}>
        <input 
          type="text" 
          placeholder="Digite uma nova tarefa..." 
          value={inputTarefa}
          onChange={(e) => setInputTarefa(e.target.value)} 
        />
        <button type="submit">Adicionar</button>
      </form>

      <ul>
        {tarefas.map((tarefa, index) => (
          <li key={index}>
            {tarefa}
            <button onClick={() => removerTarefa(index)}>❌</button>
          </li>
        ))}
      </ul>
      
      {tarefas.length === 0 && <p>Parabéns! Você concluiu tudo. 🚀</p>}
    </div>
  )
}

export default App
