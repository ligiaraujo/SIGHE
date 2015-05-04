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
public class LaboratorioDAO {
    
    private Connection conn;

    public LaboratorioDAO () {
        this.conn = new Banco().getConn();
    }

    public void Inserir(Laboratorio cadastrar) throws SQLException {
        String sql = "INSERT INTO laboratorio (matriculaAluno, matriculaProfessor, laboratorio, aprovacao, horario, data, turno) VALUES (?, ?, ?, ?, ?, ?, ?);";
        int idLaboratorio = 0;
        try {
            java.sql.PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, cadastrar.getMatriculaAluno());
            stmt.setString(2, cadastrar.getMatriculaProfessor());
            stmt.setString(3, cadastrar.getLaboratorio());
            stmt.setString(4, cadastrar.getAprovacao());
            stmt.setString(5, cadastrar.getHorario());
            stmt.setString(6, cadastrar.getData());
            stmt.setString(7, cadastrar.getTurno());
            stmt.execute();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            idLaboratorio = rs.getInt(1);

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

    

