package aula03_16_07_2025;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Pessoa pessoa1 = new Pessoa("Julio",19,1.70,'M',"32424242342");
		pessoa1.criarContaBancaria();
		pessoa1.apresentar();
		pessoa1.depositar(90.00);
		pessoa1.sacar(100);
		pessoa1.consultarSaldo();
		
		//Set
		pessoa1.setNome("Juliano");
		
		//get
		System.out.println(pessoa1.getNome());
	}

}
