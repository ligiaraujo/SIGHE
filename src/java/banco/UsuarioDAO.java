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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Wisley
 */
public class UsuarioDAO {

    private Connection conn;

    public UsuarioDAO() {
        this.conn = new Banco().getConn();
    }

    private void inserirAux(Usuario usuario) throws SQLException{
        String sql = "INSERT INTO usuario (tipo, senha, nome, matricula, " + 
                                            "dataNasc, email, telefone, cpf, " + 
                                            "sexo, curso, funcao) "
                                    + "VALUES (?, ?, ?, ?, " + 
                                                "?, ?, ?, ?, " + 
                                                "?, ?, ?);";
        java.sql.PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        stmt.setString(1, usuario.getTipo());
        stmt.setString(2, usuario.getSenha());
        stmt.setString(3, usuario.getNome());
        stmt.setString(4, usuario.getMatricula());
        stmt.setString(5, usuario.getDataNasc());
        stmt.setString(6, usuario.getEmail());
        stmt.setString(7, usuario.getTelefone());
        stmt.setString(8, usuario.getCpf());
        stmt.setString(9, usuario.getSexo());
        stmt.setString(10, usuario.getCurso());
        stmt.setString(11, usuario.getFuncao());
        stmt.execute();                            
        ResultSet rs = stmt.getGeneratedKeys();
        rs.next();
        rs.close();
        stmt.close();
        conn.close();
    }
    
    public boolean inserir(Usuario usuario) {
        try {
            java.sql.PreparedStatement stmt1 = conn.prepareStatement("SELECT 1 FROM usuario WHERE matricula=" + usuario.getMatricula() + ";");
            ResultSet rs1 = stmt1.executeQuery();
            if (rs1.next()) {
                return false;
            } else {
                inserirAux(usuario);
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

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
