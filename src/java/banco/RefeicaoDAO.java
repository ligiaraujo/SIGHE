package banco;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Wisley
 */
public class RefeicaoDAO {
     private Connection conn;

    public RefeicaoDAO() {
        this.conn = new Banco().getConn();
    }

    public void Inserir(Refeicao cadastrar) throws SQLException {
        String sql = "INSERT INTO refeicao (matricula, tipo, justificativa, data) VALUES (?, ?, ?, ?);";
        int idRefeicao = 0;
        try {
            java.sql.PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, cadastrar.getMatricula());
            stmt.setString(2, cadastrar.getTipo());
            stmt.setString(3, cadastrar.getJustificativa());
            stmt.setString(4, cadastrar.getData());
            
            stmt.execute();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            
            idRefeicao = rs.getInt(1);

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
 

