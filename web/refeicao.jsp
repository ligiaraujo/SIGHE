<%-- 
    Document   : refeicao
    Created on : 02/02/2015, 20:04:49
    Author     : Wisley
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="banco.*"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title> SIGHE - REFEIÇÃO </title>
        <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="css/MasterPage.css"/>
        <link rel="stylesheet" type="text/css" href="css/Menu.css"/>
        <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
        <script src="js/script.js"></script>
    </head>
    <body>
    <center>
        <img src="imagens/newbanner.png" class="header"> 
        <%
            String idlogado = (String) session.getAttribute("idusuario");
            UsuarioDAO usuDAO = new UsuarioDAO();
            ResultSet usuLogado = null;
            if (idlogado == null) {
                response.sendRedirect("index.jsp");
            } else {
                usuLogado = usuDAO.pegarUsuario(idlogado);

                if (usuLogado.next()) {
        %>

        <div id='cssmenu'>
            <ul style="float: left;">
                <li> <a href=inicio.jsp>Início</a></li>
                <li><a href=usuarios.jsp> Usuários </a></li>
                <li><a href="horarios.jsp"> Horários </a></li>
                <li><a href='logar.jsp?acao=sair'> Sair </a></li>
            </ul>
            <p style="padding-right: 20px; text-align: right;"><%=usuLogado.getString("nome")%> (<%=usuLogado.getString("tipo")%>)</p>
        </div>

        <div id='corpo'>   
            <h1> RESERVAR REFEIÇÃO </h1>
            <%
                String rv = request.getParameter("reservar");
                if (rv == null) {
            %>
            <form action="refeicao.jsp" method="post">
                <fieldset>
                    <legend>Preencha o formulário abaixo</legend>
                    <br>
                    <label>Data: </label>
                    <input type="date" name="data" id="data" required="">
                    <br><br> 
                    <label> Tipo de refeição: </label>
                    <input type="radio" name="tipo" value="Almoço" checked/>Almoço
                    <input type="radio" name="tipo" value="Jantar"/>Janta                    
                    <br><br> 
                    <label> Justifivativa </label> <br>
                    <textarea name="justificativa" cols="50" rows="5" > </textarea>
                    <br><br>

                    <input type="submit" class="sub" name="reservar" value="Reservar">
                    <input type="reset" class="sub" value="Limpar">	                     
                    <br>
                </fieldset>
            </form>
            <%
            } else {
                Refeicao refeicao = new Refeicao();

                refeicao.setMatricula(usuLogado.getString("matricula"));
                refeicao.setData(request.getParameter("data"));
                refeicao.setTipo(request.getParameter("tipo"));
                refeicao.setJustificativa(request.getParameter("justificativa"));

                RefeicaoDAO refeicaoDAO = new RefeicaoDAO();

                refeicaoDAO.Inserir(refeicao);
            %>
            <fieldset class="login1">
                <p style="text-align: center">AGENDAMENTO FEITO COM SUCESSO.<br/><br/>
                    <a class="ap" href="inicio.jsp">Início</a></p>
            </fieldset>
            <%}%>
        </div>
        <%
                }
            }
        %>
    </center>
    <div id="rodape">
        <p id="textoRodape">
            @ IFRN Campus João Câmara
            <!-- <img src="imagens/logoifrn.jpg" width="150"/> -->
        </p>
    </div>
</body>
</html>




