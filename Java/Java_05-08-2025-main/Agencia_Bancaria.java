package aula_05_08_2025;
import java.util.Scanner;

public class Agencia_Bancaria {
	    public static void main(String[] args) {
	        Scanner scanner = new Scanner(System.in);
	        double saldo = 1000.00; 
	        int opcao;

	        System.out.println("Bem-vindo ao Simulador de Atendimento Bancário!");

	        while (true) { 
	            System.out.println("\n---------------------------------");
	            System.out.println("Selecione uma opção:");
	            System.out.println("1. Ver saldo");
	            System.out.println("2. Fazer depósito");
	            System.out.println("3. Realizar saque");
	            System.out.println("4. Sair do sistema");
	            System.out.println("---------------------------------");
	            System.out.print("Digite a opção desejada: ");

	            opcao = scanner.nextInt();

	            switch (opcao) {
	                case 1:
	                    System.out.printf("Seu saldo atual é: R$ %.2f\n", saldo);
	                    break;
	                case 2:
	                    System.out.print("Digite o valor a ser depositado: R$ ");
	                    double valorDeposito = scanner.nextDouble();
	                    if (valorDeposito > 0) {
	                        saldo += valorDeposito;
	                        System.out.printf("Depósito de R$ %.2f realizado com sucesso.\n", valorDeposito);
	                        System.out.printf("Novo saldo: R$ %.2f\n", saldo);
	                    } else {
	                        System.out.println("Valor de depósito inválido. Tente novamente.");
	                    }
	                    break;
	                case 3:
	                    System.out.print("Digite o valor a ser sacado: R$ ");
	                    double valorSaque = scanner.nextDouble();
	                    if (valorSaque > 0 && valorSaque <= saldo) {
	                        saldo -= valorSaque;
	                        System.out.printf("Saque de R$ %.2f realizado com sucesso.\n", valorSaque);
	                        System.out.printf("Novo saldo: R$ %.2f\n", saldo);
	                    } else if (valorSaque > saldo) {
	                        System.out.println("Saldo insuficiente para o saque.");
	                    } else {
	                        System.out.println("Valor de saque inválido. Tente novamente.");
	                    }
	                    break;
	                case 4:
	                    System.out.println("Obrigado por usar nosso sistema. Volte sempre!");
	                    scanner.close(); 
	                    return;
	                default:
	                    System.out.println("Opção inválida. Por favor, escolha uma opção de 1 a 4.");
	            }
	        }
	    }
	} 