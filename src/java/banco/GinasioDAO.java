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
public class GinasioDAO {

    private Connection conn;

    public GinasioDAO() {
        this.conn = new Banco().getConn();
    }

    public boolean inserir(Ginasio ginasio) throws SQLException {
        String sql = "insert into ginasio (matricula, tipoEsporte, qtdBolas, horario, data) values (?, ?, ?, ?, ?);";
        int idEsporte = 0;
        try {
            java.sql.PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ginasio.getMatricula());
            stmt.setString(2, ginasio.getTipoEsporte());
            stmt.setString(3, ginasio.getQtdBolas());
            stmt.setString(4, ginasio.getHorario());
            stmt.setString(5, ginasio.getData());

            stmt.execute();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            idEsporte = rs.getInt(1);

            rs.close();
            stmt.close();
            conn.close();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
    }
}
