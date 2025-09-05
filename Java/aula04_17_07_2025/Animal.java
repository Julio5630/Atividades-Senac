package aula04_17_07_2025;

public class Animal {
	String nome;
	int idade;
	double peso;
	
	//Construtor
	public Animal(String nome, int idade, double peso) {
		super();
		this.nome = nome;
		this.idade = idade;
		this.peso = peso;
	}

	//Get/Set
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public double getPeso() {
		return peso;
	}

	public void setPeso(double peso) {
		this.peso = peso;
	}
	public void emitirSom() {
		System.out.println("Som.....");
	}

}
