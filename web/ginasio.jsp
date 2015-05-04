<%-- 
    Document   : ginasio
    Created on : 02/02/2015, 20:04:49
    Author     : Wisley
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="banco.*"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title> SIGHE - GINÁSIO </title>
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
            <h1> RESERVAR GINÁSIO </h1>
            <%
                String rv = request.getParameter("reservar");
                if (rv == null) {
            %>
            <form action="ginasio.jsp" method="post">
                <fieldset class="login">

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
                    <script type="text/javascript">$(document).ready(function () {
                            $("#hora1").mask("99h99");
                        });
                    </script>

                    <label> Horário das: </label> 
                    <input id="hora" type="text" name="horario1" size="5" required/> 
                    <label> ás: </label>
                    <input id="hora1" type="text" name="horario2"  size="5" required/> *Máx. de 1h!
                    <br><br>

                    <label> Prática esportiva: </label>
                    <select name="tipoEsporte" required/>
                    <option>Futsal</option>
                    <option>Handball</option>
                    <option>Vôlei</option>
                    <option>Basquete</option>
                    </select>
                    <br><br>
                    <label> Quantidade de bolas: </label>
                    <input type="number" name="qtdBolas" min="1" max="2" required/> *Máx. 2!
                    <br><br>
                    <input type="submit" class="sub" name="reservar" value="Reservar">
                    <input type="reset" class="sub" value="Limpar">
                    <br>
                </fieldset>
            </form>
            <%} else {
                Ginasio ginasio = new Ginasio();

                ginasio.setMatricula(usuLogado.getString("matricula"));
                ginasio.setTipoEsporte(request.getParameter("tipoEsporte"));
                ginasio.setQtdBolas(request.getParameter("qtdBolas"));
                ginasio.setData(request.getParameter("data"));
                ginasio.setHorario(request.getParameter("horario1") + " às " + request.getParameter("horario2"));

                GinasioDAO ginasioDAO = new GinasioDAO();

                ginasioDAO.Inserir(ginasio);
            %>
            <fieldset class="login1">
                <p style="text-align: center">RESERVA FEITA COM SUCESSO. <br/><br/>
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