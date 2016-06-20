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
public class ConsultaDAO {
       private Connection conn;

    public ConsultaDAO () {
        this.conn = new Banco().getConn();
    }

    public boolean inserir(Consulta consulta) throws SQLException {
        String sql = "INSERT INTO consulta (matricula, medico, hora, data) VALUES (?, ?, ?, ?);";
        int idCons = 0;
        try {
            java.sql.PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, consulta.getMatricula());
            stmt.setString(2, consulta.getMedico());
            stmt.setString(3, consulta.getHora());
            stmt.setString(4, consulta.getData());
            stmt.execute();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            idCons = rs.getInt(1);

            rs.close();
            stmt.close();
            conn.close();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
    }
}

    
