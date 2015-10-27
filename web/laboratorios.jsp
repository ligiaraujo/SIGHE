<%-- 
    Document   : laboratorios
    Created on : 02/02/2015, 20:03:53
    Author     : Wisley
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="banco.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title> SIGHE - LABORATÓRIOS </title>
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
            <h1> RESERVAR LABORATÓRIO </h1>
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
                    <label> Turno: </label>
                    <input type="radio" name="turno" value="Manhã" required checked/>Manhã
                    <input type="radio" name="turno" value="Tarde" required/>Tarde
                    <input type="radio" name="turno" value="Noite" required/>Noite
                    <br><br>
                    <label> Horário: </label> 
                    <input type="checkbox" name="horario" value="1º"/>1º
                    <input type="checkbox" name="horario" value="2º"/>2º
                    <input type="checkbox" name="horario" value="3º"/>3º
                    <input type="checkbox" name="horario" value="4º"/>4º
                    <input type="checkbox" name="horario" value="5º"/>5º
                    <input type="checkbox" name="horario" value="6º"/>6º
                    <br><br>

                    <label> Laboratório: </label>
                    <select name="laboratorio">                       
                        <option>Biologia</option>
                        <option>Informática I</option>
                        <option>Informática II</option>
                        <option>Informática III</option>
                        <option>Línguas</option>                       
                        <option>Manutenção</option>
                        <option>Química</option>
                        <option>Redes</option>
                    </select>
                    <br><br>
                    <label> Professor responsável: </label>
                    <select name="professor">
                        <%
                            ResultSet prof = usuDAO.selecionarProfessores();
                            while (prof.next()) {
                        %>
                        <option value="<%=prof.getString("matricula")%>"><%=prof.getString("nome")%></option>
                        <%}%>
                    </select>
                    <br><br>
                    <input type="submit" class="sub" name="reservar" value="Reservar">
                    <input type="reset" class="sub" value="Limpar">
                    <br>
                </fieldset>
            </form>
            <%} else {
                Laboratorio laboratorio = new Laboratorio();

                laboratorio.setMatriculaAluno(usuLogado.getString("matricula"));
                laboratorio.setMatriculaProfessor(request.getParameter("professor"));
                laboratorio.setAprovacao("-");
                laboratorio.setLaboratorio(request.getParameter("laboratorio"));
                laboratorio.setData(request.getParameter("data"));
                laboratorio.setTurno(request.getParameter("turno"));

                String horarios[] = request.getParameterValues("horario");
                String horario = "";
                if (horarios != null) {
                    for (int i = 0; i < horarios.length; i++) {

                        horario += horarios[i] + ", ";
                    }
                    horario = horario.substring(0, horario.length() - 2);
                }
                laboratorio.setHorario(horario);
                
                LaboratorioDAO laboratorioDAO = new LaboratorioDAO();

                laboratorioDAO.Inserir(laboratorio);
            %>
            <fieldset class="login1">
                <p style="text-align: center">RESERVA FEITA COM SUCESSO.<br/><br/>
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
