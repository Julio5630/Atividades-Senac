package br.com.sistemacomercial.view;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import br.com.sistemacomercial.dao.ProdutoDAO;
import br.com.sistemacomercial.model.Produto;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class TelaCadastroProduto extends JFrame {
    private JTextField txtNome, txtPreco;
    private JButton btnSalvar, btnEditar, btnExcluir;
    private JTable tabela;
    private DefaultTableModel modelo;
    private ProdutoDAO produtoDAO = new ProdutoDAO();

    public TelaCadastroProduto() {
        setTitle("Cadastro de Produtos");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        // Components
        JLabel lblNome = new JLabel("Nome:");
        txtNome = new JTextField(20);
        JLabel lblPreco = new JLabel("Preço:");
        txtPreco = new JTextField(10);
        btnSalvar = new JButton("Salvar");
        btnEditar = new JButton("Editar");
        btnExcluir = new JButton("Excluir");

        modelo = new DefaultTableModel(new Object[]{"Nome", "Preço"}, 0);
        tabela = new JTable(modelo);
        JScrollPane scroll = new JScrollPane(tabela);

        // Layout
        JPanel panelTopo = new JPanel();
        panelTopo.add(lblNome);
        panelTopo.add(txtNome);
        panelTopo.add(lblPreco);
        panelTopo.add(txtPreco);
        panelTopo.add(btnSalvar);
        panelTopo.add(btnEditar);
        panelTopo.add(btnExcluir);

        add(panelTopo, BorderLayout.NORTH);
        add(scroll, BorderLayout.CENTER);

        // Button actions
        btnSalvar.addActionListener(e -> salvarProduto());
        btnEditar.addActionListener(e -> editarProduto());
        btnExcluir.addActionListener(e -> excluirProduto());
    }

    private void salvarProduto() {
        String nome = txtNome.getText();
        String precoStr = txtPreco.getText();

        if (!nome.isEmpty() && !precoStr.isEmpty()) {
            double preco = Double.parseDouble(precoStr);
            Produto produto = new Produto(modelo.getRowCount() + 1, nome, preco);
            produtoDAO.adicionarProduto(produto);
            modelo.addRow(new Object[]{nome, preco});
            txtNome.setText("");
            txtPreco.setText("");
        } else {
            JOptionPane.showMessageDialog(this, "Preencha todos os campos!");
        }
    }

    private void editarProduto() {
        int linha = tabela.getSelectedRow();
        if (linha >= 0) {
            String novoNome = txtNome.getText();
            String novoPrecoStr = txtPreco.getText();
            if (!novoNome.isEmpty() && !novoPrecoStr.isEmpty()) {
                double novoPreco = Double.parseDouble(novoPrecoStr);
                modelo.setValueAt(novoNome, linha, 0);
                modelo.setValueAt(novoPreco, linha, 1);
                txtNome.setText("");
                txtPreco.setText("");
            } else {
                JOptionPane.showMessageDialog(this, "Preencha todos os campos!");
            }
        } else {
            JOptionPane.showMessageDialog(this, "Selecione um produto para editar!");
        }
    }

    private void excluirProduto() {
        int linha = tabela.getSelectedRow();
        if (linha >= 0) {
            modelo.removeRow(linha);
        } else {
            JOptionPane.showMessageDialog(this, "Selecione um produto para excluir!");
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new TelaCadastroProduto().setVisible(true));
    }
}
