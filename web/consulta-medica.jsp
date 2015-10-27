<%-- 
    Document   : consulta-medica
    Created on : 14/04/2015, 19:00:48
    Author     : Wisley
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="banco.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title> SIGHE - CONSULTA MÉDICA </title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
            <h1> RESERVAR CONSULTA MÉDICA</h1>
            <%
                String rv = request.getParameter("reservar");
                if (rv == null) {
            %>
            <form>
                <fieldset>
                    <legend> Preencha o formulário abaixo</legend>
                    <br>                    
                    <label>Data: </label>
                    <input type="date" name="data" id="data" required="">
                    <br><br>
                    <script type="text/javascript" src="js/jquery-1.2.6.pack.js">
                    </script>

                    <script type="text/javascript" src="js/jquery.maskedinput-1.1.4.pack.js"/>
                    </script>

                    <script type="text/javascript">$(document).ready(function () {
                            $("#hora").mask("99h99");
                        });
                    </script>
                    <label> Hora: </label> 
                    <input id="hora" type="text" name="hora" size="5" required/> 
                    <br><br>
                    <label> Médico: </label>
                    <select name="medico">
                        <option>Médico Clínico Geral</option>
                        <option>Psicólogo</option>
                        <option>Dentista</option>
                    </select>
                    <br><br>
                    <input type="submit" class="sub" name="reservar" value="Reservar">
                    <input type="reset" class="sub" value="Limpar">
                </fieldset>
            </form>
            <%} else {
                Consulta consulta = new Consulta();

                consulta.setMatricula(usuLogado.getString("matricula"));
                consulta.setMedico(request.getParameter("medico"));
                consulta.setHora(request.getParameter("hora"));
                consulta.setData(request.getParameter("data"));

                ConsultaDAO consultaDAO = new ConsultaDAO();

                consultaDAO.Inserir(consulta);
            %>
            <fieldset class="login1">
                <p style="text-align: center">AGENDAMENTO FEITO COM SUCESSO. <br/><br/>
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
