package aula03_16_07_2025atividade;

public class Biblioteca {
	String titulo;
	String autor;
	int anoPublicacao;
	
	public Biblioteca(String titulo, String autor, int anoPublicacao) {
		this.titulo = titulo;
		this.autor = autor;
		this.anoPublicacao = anoPublicacao;
	}
	//Get
	public  String getTitulo() {
		return this.titulo;
	}
	public  String getautor() {
		return this.autor;
	}
	public int getanoPublicacao() {
		return this.anoPublicacao;
	}
	//Set
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public void setAutor(String autor) {
		this.autor = autor;
	}
	public void setAnoPublicacao(int anoPublicacao) {
		this.anoPublicacao = anoPublicacao;
	}
	
	
}
