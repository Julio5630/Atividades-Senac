package aula01_04_08_2025;

import java.util.Scanner;

public class lanche {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        String[] cliente = new String[3];
        String[] lanche = new String[3];
        int[] quantidades = new int[3];
        double[] valor = new double[3];
        double[] total = new double[3];

        for (int i = 0; i < 3; i++) {
        	
            System.out.print("Digite o nome do cliente " + (i + 1) + ": ");
            cliente[i] = input.nextLine();

            System.out.print("Digite o nome do lanche: ");
            lanche[i] = input.nextLine();

            System.out.print("Quantidade: ");
            quantidades[i] = input.nextInt();

            System.out.print("Valorju unitário: ");
            valor[i] = input.nextDouble();
            input.nextLine(); // Limpar buffer

            total[i] = quantidades[i] * valor[i];
            System.out.println();
        }

        System.out.println("TOTAL DOS PEDIDOS:");
        for (int i = 0; i < 3; i++) {
        	System.out.println("-------------------------------------------");
            System.out.printf("%s comprou %d %s(s) - Total: R$ %.2f%n",
                    cliente[i], quantidades[i], lanche[i], total[i]);
           
        }

        input.close();
    }
}

	
