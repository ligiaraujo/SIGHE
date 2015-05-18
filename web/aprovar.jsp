<%-- 
    Document   : aprovar
    Created on : 06/05/2015, 22:35:22
    Author     : Wisley
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="banco.Banco"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Aprovand...</title>
    </head>
    <body>
        <%
            String resposta = request.getParameter("r");
            String id = request.getParameter("id");

            Banco b = new Banco();
            PreparedStatement ps = null;

            if (resposta.equals("sim")) {
                ps = b.conn.prepareStatement("UPDATE laboratorio SET aprovacao = 'Aprovado' WHERE idLaboratorio = " + id + ";");
                ps.executeUpdate();
            } else if (resposta.equals("nao")) {
                ps = b.conn.prepareStatement("UPDATE laboratorio SET aprovacao = 'Não aprovado' WHERE idLaboratorio = " + id + ";");
                ps.executeUpdate();
            }

            response.sendRedirect("horarios.jsp");
        %>
    </body>
</html>
