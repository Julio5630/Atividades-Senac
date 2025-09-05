package br.com.sistemacomercial.view;

import br.com.sistemacomercial.controller.*;
import br.com.sistemacomercial.model.Produto;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;

public class TelaCadastroProduto extends JFrame {
    private final ProdutoController controller = new ProdutoController();

    private JTextField txtNome;
    private JTextField txtPreco;
    private JLabel lblIdAtual;

    private JTable tabela;
    private DefaultTableModel modelo;

    private int idEmEdicao = -1;

    public TelaCadastroProduto() {

        setTitle("Cadastro de Produtos");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(800, 600);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());

        // Definindo um tema moderno
        try {
            UIManager.setLookAndFeel("com.formdev.flatlaf.FlatLightLaf");
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Cabeçalho
        JLabel titulo = new JLabel("Cadastro de Produtos", SwingConstants.CENTER);
        titulo.setFont(new Font("Segoe UI", Font.BOLD, 24));
        titulo.setBorder(BorderFactory.createEmptyBorder(20, 0, 20, 0));
        add(titulo, BorderLayout.NORTH);

        // Formulário
        JPanel form = new JPanel();
        form.setLayout(new GridBagLayout());
        form.setBorder(BorderFactory.createTitledBorder("Informações do Produto"));
        GridBagConstraints gc = new GridBagConstraints();
        gc.insets = new Insets(10, 10, 10, 10);
        gc.fill = GridBagConstraints.HORIZONTAL;

        lblIdAtual = new JLabel("ID: novo");
        lblIdAtual.setFont(new Font("Segoe UI", Font.PLAIN, 12));

        JLabel lblNome = new JLabel("Nome:");
        txtNome = new JTextField(20);

        JLabel lblPreco = new JLabel("Preço (R$):");
        txtPreco = new JTextField(20);

        JButton btnSalvar = new JButton("Salvar");
        JButton btnLimpar = new JButton("Limpar");

        // Adicionando componentes ao formulário
        gc.gridx = 0; gc.gridy = 0; gc.gridwidth = 1;
        form.add(lblIdAtual, gc);

        gc.gridx = 0; gc.gridy = 1; form.add(lblNome, gc);
        gc.gridx = 1; form.add(txtNome, gc);

        gc.gridx = 0; gc.gridy = 2; form.add(lblPreco, gc);
        gc.gridx = 1; form.add(txtPreco, gc);

        JPanel botoesForm = new JPanel(new FlowLayout(FlowLayout.LEFT));
        botoesForm.add(btnSalvar);
        botoesForm.add(btnLimpar);

        gc.gridx = 1; gc.gridy = 3; gc.weightx = 0; form.add(botoesForm, gc);

        // Tabela
        modelo = new DefaultTableModel(new Object[]{"ID", "Nome", "Preço"}, 0) {
            @Override public boolean isCellEditable(int row, int column) { return false; }
        };
        tabela = new JTable(modelo);
        tabela.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        JScrollPane scroll = new JScrollPane(tabela);

        // Botões de ação da lista
        JButton btnCarregar = new JButton("Editar");
        JButton btnExcluir = new JButton("Excluir");
        JButton btnAtualizar = new JButton("Atualizar");

        JPanel acoesTabela = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        acoesTabela.add(btnAtualizar);
        acoesTabela.add(btnCarregar);
        acoesTabela.add(btnExcluir);

        // Layout principal
        JPanel centro = new JPanel(new BorderLayout());
        centro.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        centro.add(form, BorderLayout.NORTH);
        centro.add(scroll, BorderLayout.CENTER);
        centro.add(acoesTabela, BorderLayout.SOUTH);
        add(centro, BorderLayout.CENTER);

        // Eventos
        btnSalvar.addActionListener(this::onSalvar);
        btnLimpar.addActionListener(e -> limparFormulario());
        btnAtualizar.addActionListener(e -> carregarTabela());
        btnCarregar.addActionListener(e -> carregarSelecionadoParaEdicao());
        btnExcluir.addActionListener(e -> excluirSelecionado());

        // Estado inicial
        carregarTabela();
    }

    private void onSalvar(ActionEvent e) {
        String nome = txtNome.getText().trim();
        String precoStr = txtPreco.getText().trim();

        if (nome.isEmpty() || precoStr.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Preencha nome e preço.", "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }

        double preco;
        try {
            preco = Double.parseDouble(precoStr.replace(",", "."));
        } catch (NumberFormatException ex) {
            JOptionPane.showMessageDialog(this, "Preço inválido. Use formato 99.99", "Erro", JOptionPane.ERROR_MESSAGE);
            return;
        }

        if (idEmEdicao == -1) {
            Produto p = controller.adicionar(nome, preco);
            if (p != null) {
                JOptionPane.showMessageDialog(this, "Produto cadastrado (ID " + p.getId() + ").");
            } else {
                JOptionPane.showMessageDialog(this, "Erro ao cadastrar produto.", "Erro", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            boolean ok = controller.atualizar(idEmEdicao, nome, preco);
            if (ok) {
                JOptionPane.showMessageDialog(this, "Produto atualizado (ID " + idEmEdicao + ").");
            } else {
                JOptionPane.showMessageDialog(this, "Produto não encontrado ou erro ao atualizar.", "Erro", JOptionPane.ERROR_MESSAGE);
            }
        }

        limparFormulario();
        carregarTabela();
    }

    private void carregarTabela() {
        modelo.setRowCount(0);
        for (Produto p : controller.listar()) {
            modelo.addRow(new Object[]{ p.getId(), p.getNome(), String.format("%.2f", p.getPreco()) });
        }
    }

    private void carregarSelecionadoParaEdicao() {
        int linha = tabela.getSelectedRow();
        if (linha == -1) {
            JOptionPane.showMessageDialog(this, "Selecione um produto na tabela.", "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        int id = (int) tabela.getValueAt(linha, 0);
        Produto p = controller.buscarPorId(id);
        if (p != null) {
            idEmEdicao = p.getId();
            lblIdAtual.setText("ID: " + idEmEdicao);
            txtNome.setText(p.getNome());
            txtPreco.setText(String.valueOf(p.getPreco()));
        } else {
            JOptionPane.showMessageDialog(this, "Produto não encontrado.", "Erro", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void excluirSelecionado() {
        int linha = tabela.getSelectedRow();
        if (linha == -1) {
            JOptionPane.showMessageDialog(this, "Selecione um produto na tabela.", "Aviso", JOptionPane.WARNING_MESSAGE);
            return;
        }
        int id = (int) tabela.getValueAt(linha, 0);
        int confirma = JOptionPane.showConfirmDialog(this,
                "Confirma excluir o produto ID " + id + "?", "Confirmar exclusão",
                JOptionPane.YES_NO_OPTION);
        if (confirma == JOptionPane.YES_OPTION) {
            boolean ok = controller.remover(id);
            if (ok) {
                if (idEmEdicao == id) limparFormulario();
                carregarTabela();
                JOptionPane.showMessageDialog(this, "Produto excluído com sucesso.");
            } else {
                JOptionPane.showMessageDialog(this, "Erro ao excluir produto.", "Erro", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    private void limparFormulario() {
        idEmEdicao = -1;
        lblIdAtual.setText("ID: novo");
        txtNome.setText("");
        txtPreco.setText("");
        tabela.clearSelection();
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new TelaCadastroProduto().setVisible(true);
        });
    }
}
