package aula04_17_07_2025atividade;

public class Veiculo {
	String combustivel;
	String movimento;
	
	public Veiculo(String movimento, String combustivel) {
		super();
		this.combustivel = combustivel;
		this.movimento = movimento;
	}

	public void statusVeiculo() {
		System.out.println(movimento+"|| Tipo Combustivel: "+combustivel);
	}
	
	
	
	
	
}
