package LoginApp;

import java.util.Scanner;

public class LoginApp {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        System.out.print("Usuário: ");
        String nomeUsuario = sc.nextLine();

        System.out.print("Senha: ");
        String senhaUsuario = sc.nextLine();

        Usuario usuario = new Usuario(nomeUsuario, senhaUsuario);

        if (usuarioDAO.autenticar(usuario)) {
            System.out.println("Login realizado com sucesso!");
        } else {
            System.out.println("Usuário ou senha inválidos.");
        }
        sc.close();
    }
}
