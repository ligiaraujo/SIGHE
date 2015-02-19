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

   public void cadastroAluno(String nome, String matricula, String dataNasc, String email, String telefone, String cpf, String sexo) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("insert into aluno (nome, matricula, dataNasc, email, telefone, cpf, sexo) values ('" + nome + "', '" + matricula + "', '" + dataNasc + "', '" + email + "', '" + telefone  + "',  '" + cpf  + "',  '" + sexo +"');");
        ps.execute();
        ps.close();
    
   }
    public void cadastrarRefeicao (String nome, String matricula, String tipoRefeicao, String justificativa) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("insert into refeicao (nome, matricula, tipoRefeicao, justificativa) values ('" + nome + "', '" + matricula + "', '" + tipoRefeicao + "',  '" +justificativa +"');");
        ps.execute();
        ps.close();
  
   }
       public void ReservaEsporte (String nome, String matricula, String horario, String tipoEsporte, String qtdBolas, String turno) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("insert into esporte (nome, matricula, horario, tipoEsporte, qtdBolas, turno) values ('" + nome + "', '" + matricula + "', '" + horario + "', '" + tipoEsporte + "', '" + qtdBolas  + "',  '" + turno +"');");
        ps.execute();
        ps.close();
  
}
         public void ReservarConsulta (String nome, String matricula, String curso, String espMed, String horario) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("insert into constmed (nome, matricula, curso, espMed, horario) values ('" + nome + "', '" + matricula + "', '" + curso + "', '" + espMed + "', '" + horario + "');");
        ps.execute();
        ps.close();
         }

}
  