<%-- 
    Document   : logar
    Created on : 11/03/2015, 16:38:01
    Author     : Wisley
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="banco.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logando...</title>
    </head>
    <body>
        <%
            Banco b = new Banco();

            PreparedStatement ps = null;
            ResultSet rs = null;

            String matricula = request.getParameter("matricula");
            String senha = request.getParameter("senha");
            String acao = request.getParameter("acao");
            if (acao == null) {
                try {
                    ps = b.conn.prepareStatement("SELECT * FROM usuario WHERE matricula=" + matricula + " AND senha='" + senha + "';");
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        session.setAttribute("idusuario", rs.getString("idUsuario")); //abrindo sessao
                        session.setMaxInactiveInterval(-1); //limite da sessão infinito
                        response.sendRedirect("inicio.jsp");
                    } else {
                        response.sendRedirect("erro.jsp");
                    }
                } catch (SQLException e) {
                    out.println("Error: " + e + "<br>");
                    out.println("<a href='index.jsp'>Voltar</a>");
                }
            } else if (acao.equals("sair")) {
                session.invalidate();
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
