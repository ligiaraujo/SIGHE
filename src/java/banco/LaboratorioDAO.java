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

    public Laboratorio Inserir(Laboratorio cadastrar) throws SQLException {
        String sql = "INSERT INTO laboratorio (nome, matricula, tipoLaboratorio, horario) VALUES ( ?, ?, ?, ?);";
        int idLaboratorio = 0;
        try {
            java.sql.PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, cadastrar.getNome());
            stmt.setString(2, cadastrar.getMatricula());
            stmt.setString(3, cadastrar.getTipoLaboratorio());
            stmt.setString(4, cadastrar.getHorario());
            stmt.execute();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            idLaboratorio = rs.getInt(1);

            rs.close();
            stmt.close();
            conn.close();
            return cadastrar;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

    

