<%-- 
    Document   : aprovacao
    Created on : 07/05/2015, 12:55:58
    Author     : Wisley
--%>

<%-- 
    Document   : horarios
    Created on : 02/05/2015, 23:18:59
    Author     : Wisley
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="banco.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title> SIGHE - HORÁRIOS </title>
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
                String matricula = usuLogado.getString("matricula");
                LaboratorioDAO laboratorioDAO = new LaboratorioDAO();
                ResultSet laboratorio = laboratorioDAO.selecionarLabReservador(matricula);

                SimpleDateFormat formatarDate = new SimpleDateFormat("dd/MM/yyyy"); //ano
                SimpleDateFormat formatarDateDia = new SimpleDateFormat("EEE"); //dia da semana
                if (usuLogado.getString("tipo").equals("Professor")) {
                    ResultSet avaliar = laboratorioDAO.selecionarLabProfessorAvaliar(matricula);
                    boolean temLabAvaliar = laboratorioDAO.temLaboratorioProfessorAvaliar(matricula);
            %> 
            <h2>Aprovar Responsabilidade por Laboratório</h2>
            <% if (temLabAvaliar) { %>
            Aprovar solicitações da sua responsabilidade:
            <table class="tbl">
                <tr>
                    <th>Laboratório</th>
                    <th>Horários</th>                         
                    <th>Turno</th>   
                    <th>Data</th>   
                    <th>Solicitador</th>   
                    <th>Aprovação</th>   
                </tr> 
                <% while (avaliar.next()) {
                        Date data = avaliar.getDate("data");
                %>
                <tr> 
                    <td><%= avaliar.getString("laboratorio")%></td>          
                    <td><%= avaliar.getString("horario")%></td>          
                    <td><%= avaliar.getString("turno")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>  
                    <td><%= avaliar.getString("usuario.nome")%></td>          
                    <td style="text-align: center"><a href="aprovar.jsp?id=<%=avaliar.getString("idLaboratorio")%>&r=sim"><input type="button" class="sub" value="Sim"></a>
                        | <a href="aprovar.jsp?id=<%=avaliar.getString("idLaboratorio")%>&r=nao"><input type="button" class="sub" value="Não"></a></td> 
                </tr>
                <% } %>
            </table>
            <% } else { %>
            Sem laboratório solicitado.
            <%
                    }
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

