package aula03_16_07_2025;

public class Pessoa {
	//Atributos
	public String nome;
	public int idade;
	public double altura;
	public char genero;
	private String cpf;
	private double contaBancaria;
	
	//Metodo construtor
	public Pessoa(String nome, int idade, double altura, char genero, String cpf) {
		this.nome = nome;
		this.idade = idade;
		this.altura = altura;
		this.genero = genero;
		this.cpf = cpf;
	}
	
	//Metodo set e get
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getNome() {
		return nome;
	}
		
	//Metodo
	public void apresentar() {
		System.out.println("Oi meu nome e "+nome+" e tenho "+idade+" anos de idade.");
	}
	
	public void criarContaBancaria() {
		if(idade>=18) {
			contaBancaria = 0.00;
			System.out.println("Sua conta bancaria foi criada com sucesso");
		}
		else {
			System.out.println("Menor de idade ;-;");
		}
	}
	
	public void depositar(double valor) {
		contaBancaria += valor;
		System.out.println("Valor depositado com sucesso");
	}
	
	public void sacar(double valor) {
		if(valor < contaBancaria) {
		contaBancaria -= valor;
		System.out.println("Valor sacado com sucesso ");
		}
		else {
			System.out.println("Saldo insufuciente para realizar o saque");
		}
	}
	
	public void consultarSaldo() {
		System.out.println(contaBancaria);
	}

}
