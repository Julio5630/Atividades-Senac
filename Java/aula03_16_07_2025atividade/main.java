package aula03_16_07_2025atividade;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Biblioteca biblioteca1 = new Biblioteca("Jogador Numero 1","Cline, Ernest",1954);
		
		//Print/Get
		System.out.println("Titulo: "+biblioteca1.getTitulo()+
						   "||Autor: "+biblioteca1.getautor()+
						   "||Ano: "+biblioteca1.getanoPublicacao());
		//Mensagem update
		System.out.println("Atualizando Dados do Livro");
		
		//Set
		biblioteca1.setTitulo("Luciana Jones");
		biblioteca1.setAutor("Luciana Barbosa");
		biblioteca1.setAnoPublicacao(1984);
		
		//Print/Get
		System.out.println("Titulo: "+biblioteca1.getTitulo()+
						   "||Autor: "+biblioteca1.getautor()+
						   "||Ano: "+biblioteca1.getanoPublicacao());		
	}
}
