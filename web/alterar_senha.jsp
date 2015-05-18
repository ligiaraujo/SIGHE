<%-- 
    Document   : alterar_senha
    Created on : 05/05/2015, 12:24:52
    Author     : Wisley
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="banco.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGHE - ALTERAR SENHA</title>
        <link rel="stylesheet" type="text/css" href="css/MasterPage.css"/>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <script type="text/javascript">
            function validarSenha() {
                senha = document.getElementById("novaSenha").value;
                senhaRepetida = document.getElementById("confSenha").value;
                if (senha != senhaRepetida) {
                    alert("Repita a senha corretamente.");
                    document.getElementById("confSenha").focus();
                    return false;
                }
            }
        </script>
    </head>
    <body>
    <center>
        <h3 style="padding-top: 30px">ALTERAR SENHA</h3>
        <%
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            String id = request.getParameter("id");
            ResultSet usuario = usuarioDAO.pegarUsuario(id);
            
            if (usuario.next()) {
        %>

        <p id="titAS"><%= usuario.getString("nome")%> (<%= usuario.getString("matricula")%>)</p>
        <%
            String al = request.getParameter("aletrar");
            if (al == null) {
        %>
        <form action="alterar_senha.jsp?id=<%=id%>" method="post" onsubmit="return validarSenha()">
            <input type="password" id="novaSenha" name="novaSenha" placeholder="Nova senha" required=""><br><br>
            <input type="password" id="confSenha" name="confSenha" placeholder="Confirmar senha" required=""><br><br>
            <input type="submit" name="aletrar" value="Alterar" class="sub">
        </form>
        <%
        } else {
            String novaSenha = request.getParameter("novaSenha");
            usuarioDAO.alterarSenha(id, novaSenha);
        %>
        Senha alterada com sucesso.<br><br>
        <input type="button" value="Fechar" class="sub" onclick="javascript:window.close()"/>    
        <%            
                }
            }
        %>
    </center>
</body>
</html>
