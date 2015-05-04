/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Wisley
 */
public class UsuarioDAO {

    private Connection conn;

    public UsuarioDAO() {
        this.conn = new Banco().getConn();
    }

    public String Inserir(Usuario cadastrar) throws SQLException {  //verificar se matricula ja está cadastrada
        java.sql.PreparedStatement stmt1 = conn.prepareStatement("SELECT * FROM usuario WHERE matricula=" + cadastrar.getMatricula() + ";");
        ResultSet rs1 = stmt1.executeQuery();
        if (rs1.next()) {
            return "matricula ja cadastrada";
        } else {                               //Preparando o script de Inserção

            String sql = "INSERT INTO usuario (tipo, senha, nome, matricula, dataNasc, email, telefone, cpf, sexo, curso, funcao) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            int idUsuario = 0;
            try {
                java.sql.PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stmt.setString(1, cadastrar.getTipo());
                stmt.setString(2, cadastrar.getSenha());
                stmt.setString(3, cadastrar.getNome());
                stmt.setString(4, cadastrar.getMatricula());
                stmt.setString(5, cadastrar.getDataNasc());
                stmt.setString(6, cadastrar.getEmail());
                stmt.setString(7, cadastrar.getTelefone());
                stmt.setString(8, cadastrar.getCpf());
                stmt.setString(9, cadastrar.getSexo());
                stmt.setString(10, cadastrar.getCurso());
                stmt.setString(11, cadastrar.getFuncao());
                stmt.execute();                             //Executando o script de Inserção
                ResultSet rs = stmt.getGeneratedKeys();
                rs.next();
                idUsuario = rs.getInt(1);       
                rs.close();
                stmt.close();
                conn.close();
                //return cadastrar;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return "cadastro feito";
        }
    } // Fim do método de Inserção

    public void Excluir(String id) throws SQLException {
        java.sql.PreparedStatement stmt = conn.prepareStatement("DELETE FROM usuario WHERE idUsuario = " + id + ";");
        stmt.executeUpdate();
        stmt.close();
    }

    public void Editar(String id, String nome, String curso, String funcao, String tel, String email) throws SQLException {
        java.sql.PreparedStatement stmt = conn.prepareStatement("UPDATE usuario SET nome='" + nome + "', curso='" + curso + "',"
                + " funcao='" + funcao + "', telefone='" + tel + "', email='" + email + "' WHERE idUsuario = " + id + ";");
        stmt.executeUpdate();
        stmt.close();
    }

    public ResultSet pegarUsuario(String id) throws SQLException {
        java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuario WHERE idUsuario=" + id + ";");
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public ResultSet selecionarAlunos() throws SQLException {
        java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuario WHERE tipo = 'Aluno';");
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public ResultSet filtrarAlunos(String filtro) throws SQLException {
        java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuario WHERE tipo = 'Aluno'"
                + " AND nome LIKE '%" + filtro + "%' OR matricula LIKE '%" + filtro + "%' OR curso LIKE '%" + filtro + "%';");
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public ResultSet selecionarProfessores() throws SQLException {
        java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuario WHERE tipo = 'Professor';");
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public ResultSet filtrarProfessores(String filtro) throws SQLException {
        java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuario WHERE tipo = 'Professor'"
                + " AND nome LIKE '%" + filtro + "%' OR matricula LIKE '%" + filtro + "%' OR curso LIKE '%" + filtro + "%';");
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public ResultSet selecionarFuncionarios() throws SQLException {
        java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuario WHERE tipo = 'Funcionário';");
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public ResultSet filtrarFuncionarios(String filtro) throws SQLException {
        java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuario WHERE tipo = 'Funcionário'"
                + " AND nome LIKE '%" + filtro + "%' OR matricula LIKE '%" + filtro + "%' OR funcao LIKE '%" + filtro + "%';");
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

}
