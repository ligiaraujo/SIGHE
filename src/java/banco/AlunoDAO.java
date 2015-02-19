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
public class AlunoDAO {

    private Connection conn;
    public AlunoDAO() {
        this.conn = new Banco().getConn();
    }
    public Aluno Inserir(Aluno cadastrar) throws SQLException {
        //Prepara o script de Inserção
        String sql = "INSERT INTO aluno (nome, matricula, dataNasc, email, telefone, cpf, sexo) "
                + "VALUES ( ?, ?, ?, ?, ?, ?, ?);"; 
        int idAluno = 0;
        try {
            java.sql.PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, cadastrar.getNome());
            stmt.setString(2, cadastrar.getMatricula());
            stmt.setString(3, cadastrar.getDataNasc()); 
            stmt.setString(4, cadastrar.getEmail());
            stmt.setString(5, cadastrar.getTelefone());
            stmt.setString(6, cadastrar.getCpf());
            stmt.setString(7, cadastrar.getSexo());
            stmt.execute();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            idAluno = rs.getInt(1);
            //Esecuta o script de Inserção
            rs.close();
            stmt.close();
            conn.close();
            return cadastrar;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
} // Fim do método de Inserção
