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
public class ReservaEsporteDAO {
      private Connection conn;

    public ReservaEsporteDAO() {
        this.conn = new Banco().getConn();
    }
   public ReservaEsporte Inserir(ReservaEsporte cadastrar) throws SQLException {
        String sql = "insert into esporte (nome, matricula, horario, tipoEsporte, qtdBolas, turno) values ( ?, ?, ?, ?, ?, ?);";
        int idEsporte = 0;
        try {
            java.sql.PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, cadastrar.getNome());
            stmt.setString(2, cadastrar.getMatricula());
            stmt.setString(3, cadastrar.getHorario());
            stmt.setString(4, cadastrar.getTipoEsporte());
            stmt.setString(5, cadastrar.getQtdBolas());
            stmt.setString(6, cadastrar.getTurno());
            
            stmt.execute();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            idEsporte = rs.getInt(1);

            rs.close();
            stmt.close();
            conn.close();
            return cadastrar;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}