<%-- 
    Document   : pagInicial
    Created on : 02/02/2015, 20:25:17
    Author     : Wisley
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="banco.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title> SIGHE - PÁGINA INICIAL </title>
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
            <%
                if (usuLogado.getString("tipo").equals("Funcionário")) {
            %>
            <p style="padding-right: 20px; text-align: right;"><%=usuLogado.getString("nome")%> (<%=usuLogado.getString("funcao")%>)</p>
            <%
            } else {
            %>
            <p style="padding-right: 20px; text-align: right;"><%=usuLogado.getString("nome")%> (<%=usuLogado.getString("tipo")%>)</p>
            <%
                }
            %>
        </div>

        <div id='corpo'>  
            <table style="text-align: center" class="tbIni">
                <%
                    if (usuLogado.getString("tipo").equals("Aluno")) {
                %>
                <tr>
                    <td><a href="refeicao.jsp"><img title="Reservar refeição" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/ref.jpg" class="imgSetor"/></a></td>
                    <td><a href="laboratorios.jsp"><img title="Reservar laboratório" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/lab.jpg" class="imgSetor"/></a></td>
                    <td><a href="ginasio.jsp"><img title="Reservar ginásio" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/sport.jpg" class="imgSetor"/></a></td>
                    <td><a href="consulta-medica.jsp"><img title="Reservar consulta médica" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/cons.jpg" class="imgSetor"/></a></td>
                </tr>
                <%
                } else if (usuLogado.getString("tipo").equals("Professor")) {
                %>
                <tr>
                    <td><img title="Indisponível para professores" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/refPB.jpg" class="imgSetor"/></td>
                    <td><a href="laboratorios.jsp"><img title="Reservar laboratório" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/lab.jpg" class="imgSetor"/></a></td>
                    <td><a href="ginasio.jsp"><img title="Reservar ginásio" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/sport.jpg" class="imgSetor"/></a></td>
                    <td><img title="Indisponível para professores" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/consPB.jpg" class="imgSetor"/></td>
                </tr>      
                <%
                } else if (usuLogado.getString("tipo").equals("Funcionário")) {
                %>
                <tr>
                    <td><img title="Indisponível para funcionários" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/refPB.jpg" class="imgSetor"/></td>
                    <td><img title="Indisponível para funcionários" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/labPB.jpg" class="imgSetor"/></td>
                    <td><img title="Indisponível para funcionários" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/sportPB.jpg" class="imgSetor"/></td>
                    <td><img title="Indisponível para funcionários" onmouseover="this.style.opacity = 1;
                            this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.7;
                                    this.filters.alpha.opacity = 50" style="opacity: 0.7;"  src="imagens/consPB.jpg" class="imgSetor"/></td>
                </tr>  
                <%
                    }
                %>               
                <tr>
                    <th>REFEIÇÃO</th>
                    <th>LABORATÓRIO</th>
                    <th>GINÁSIO</th>
                    <th>CONSULTA MÉDICA</th>
                </tr>
            </table>









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


