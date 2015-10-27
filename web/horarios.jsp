<%-- 
    Document   : horarios
    Created on : 02/05/2015, 23:18:59
    Author     : Wisley
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="banco.*"%>
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
            <p style="padding-right: 20px; text-align: right;"><%=usuLogado.getString("nome")%> (<%=usuLogado.getString("tipo")%>)</p>
        </div>

        <div id='corpo'>
            <%
                if (usuLogado.getString("tipo").equals("Aluno")) {
            %>
            <h2>Reservas de Refeição</h2>
            <table id="tbRes">
                <tr>
                    <th>Tipo</th>
                    <th>Justificativa</th>                         
                    <th>Data</th>   
                </tr> 
                <tr> 
                    <td></td>          
                    <td></td>          
                    <td></td>            
                </tr>
            </table>
            <h2>Reservas de Laboratório</h2>
            <table id="tbRes">
                <tr>
                    <th>Laboratório</th>
                    <th>Horários</th>                         
                    <th>Turno</th>   
                    <th>Data</th>   
                    <th>Professor Responsável</th>   
                    <th>Aprovação</th>   
                </tr> 
                <tr> 
                    <td></td>          
                    <td></td>          
                    <td></td>          
                    <td></td>          
                    <td></td>          
                    <td></td>            
                </tr>
            </table>
            <h2>Reservas de Ginásio</h2>
            <table id="tbRes">
                <tr>
                    <th>Esporte</th>
                    <th>Bolas</th>                         
                    <th>Horário</th>                         
                    <th>Data</th>   
                </tr> 
                <tr> 
                    <td></td>          
                    <td></td>          
                    <td></td>          
                    <td></td>            
                </tr>
            </table>
            <h2>Reservas de Consulta Médica</h2>
            <table id="tbRes">
                <tr>
                    <th>Médico</th>
                    <th>Hora</th>                             
                    <th>Data</th>   
                </tr> 
                <tr> 
                    <td></td>          
                    <td></td>          
                    <td></td>            
                </tr>
            </table>
            <%
            } else if (usuLogado.getString("tipo").equals("Professor")) {
            %>
            <h2>Reservas de Laboratório</h2>
            <table id="tbRes">
                <tr>
                    <th>Laboratório</th>
                    <th>Horários</th>                         
                    <th>Turno</th>   
                    <th>Data</th>   
                    <th>Professor Responsável</th>   
                    <th>Aprovação</th>   
                </tr> 
                <tr> 
                    <td></td>          
                    <td></td>          
                    <td></td>          
                    <td></td>          
                    <td></td>          
                    <td></td>            
                </tr>
            </table>
            <h2>Reservas de Ginásio</h2>
            <table id="tbRes">
                <tr>
                    <th>Esporte</th>
                    <th>Bolas</th>                         
                    <th>Horário</th>                         
                    <th>Data</th>   
                </tr> 
                <tr> 
                    <td></td>          
                    <td></td>          
                    <td></td>          
                    <td></td>            
                </tr>
            </table>       
            <%
            } else if (usuLogado.getString("tipo").equals("Funcionário")) {
            %>
            AREA FUNCIONARIO - EM DESEMVOLVIMENTO...
            <%
                }
            %>
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
