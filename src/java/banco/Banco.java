
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package banco;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Edivania
 */
public class Banco {

    private Statement stmt;
    private ResultSet rs;
    public Connection conn;
    private static banco.Banco b = new banco.Banco();

    public Banco() {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/sighe";
        String user = "root";
        String pass = "wisleyh";

        try {
            Class.forName(driver);
            conn = (Connection) DriverManager.getConnection(url, user, pass);
            stmt = (Statement) conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    public Connection getConn() {
        return conn;
    }
}