/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banco;

import java.sql.Connection;
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
            java.sql.PreparedStatement stmt1 = conn.prepareStatement("SELECT 1 FROM usuario WHERE matricula=" 
                    + usuario.getMatricula() + ";");
            ResultSet rs1 = stmt1.executeQuery();
            if (rs1.next()) {
                return false;
            } else {
                inserirAux(usuario);
                return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Exceção de banco de dados:", e);
        }catch(Exception e){
            throw new RuntimeException("Exceção inesperada:", e);
        }
    }

    public boolean excluir(String id) {
        try {
            java.sql.PreparedStatement stmt = conn.prepareStatement("DELETE FROM usuario WHERE idUsuario = " + id + ";");
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return true;
    }

    public boolean editar(Usuario usuario) {
        try {
        String sql = "UPDATE usuario SET nome = ?, curso = ?, funcao = ?, telefone = ?, email = ?" 
                      +" WHERE idUsuario = ?;";
        java.sql.PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        
        stmt.setString(1, usuario.getNome());
        stmt.setString(2, usuario.getCurso());
        stmt.setString(3, usuario.getFuncao());
        stmt.setString(4, usuario.getTelefone());
        stmt.setString(5, usuario.getEmail());
        stmt.setString(6, usuario.getIdUsuario());
        stmt.execute();                            
        stmt.close();
        
    } catch (SQLException ed){
        throw new RuntimeException (ed);
    }
        return true;
    }

<<<<<<< HEAD
    public boolean pegarUsuario(String id) {
        try {
        java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuario WHERE idUsuario=" + id + ";");
        ResultSet rs = stmt.executeQuery();
        } catch (SQLException pu){
        throw new RuntimeException (pu);
    }
        return true;
    
=======
    public Usuario pegarUsuario(String id) {    
        try {
            Usuario usuario = null;
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM usuario WHERE idUsuario=" + id + ";");
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()){
               usuario = new Usuario();
               usuario.setIdUsuario(rs.getString("id"));
               // outros campos....
            }
            
            return usuario;
        } catch (SQLException ex) {
           throw new RuntimeException (ex);
        }
>>>>>>> 21031fcc140f71b445b5ce80bca52c93026959f2
    }

    public Usuario pegarUsuarioPelaMatricula(String matricula){
        return new Usuario();
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
