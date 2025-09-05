package aula04_17_07_2025atividade;

public class Bicicleta extends Veiculo {

	public Bicicleta(String combustivel, String movimento) {
		super(combustivel, movimento);
		// TODO Auto-generated constructor stub
	}
	
	public void statusVeiculo() {
		System.out.println(movimento+"|| Tipo Combustivel: "+combustivel);
	}
	
}
