package aula04_17_07_2025atividade;

public class main {

	public static void main(String[] args) {
		//Criacao objetos
		Veiculo veiculo1 = new Veiculo("O veículo está se movendo.","Etanol");
		Bicicleta bike1 = new Bicicleta("A bicicleta está sendo pedalada.","Nenhum (movida a pedal)");
		Carro carro1 = new Carro("O carro está andando na estrada.","Gasolina");
		
		veiculo1.statusVeiculo();
		bike1.statusVeiculo();
		carro1.statusVeiculo();
	}
}
