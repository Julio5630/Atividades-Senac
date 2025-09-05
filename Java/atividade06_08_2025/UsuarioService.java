package atividade06_08_2025;

import java.util.ArrayList;
import java.util.List;

public class UsuarioService {
	
	private List<String> usuarios;
	
	public UsuarioService() {
		usuarios = new ArrayList<>();
	}
	
	public void cadastrarUsuario(String nome) {
		if (nome == null || nome.trim().isEmpty()) {
			System.out.println("Nome invalido! Nao foi possivel cadastrar.");
			return;
		}
		usuarios.add(nome);
		System.out.println("Usuario "+nome+"Nao foi possivel cadastrar.");
		return;
	}
	
	public void listarUsuarios() {
		if (usuarios.isEmpty()) {
			System.out.println("");
		}
	}
}
