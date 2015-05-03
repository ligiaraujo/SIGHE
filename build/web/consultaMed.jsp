<%-- 
    Document   : consultaMed
    Created on : 02/02/2015, 20:03:53
    Author     : Wisley
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="javax.swing.text.Document"%>
<%-- 
    Document   : esporte
    Created on : 02/02/2015, 20:04:49
    Author     : Wisley
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>

<%@page import="banco.Banco"%>
<%@page import="banco.ConsultaMedica"%>
<%@page import="banco.ConsultaMedicaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title> AGENDAR CONSULTA MÉDICA </title>
        <style type="text/css">

            body{

                background-image: url(imagens/bg.gif);
                background-repeat: repeat;
                margin-top: 90px;
                margin-left:70px;
                margin-right:70px;
                margin-bottom:80px;
                border-bottom: 35px solid green;
                border-left: 35px solid green;
                border-right: 35px solid green;
                border-top: 35px solid green;

            }  

            #rodape {	height: 260%;
            }

            .imagem1{
                position: absolute;
                top: 60%;
                left: 15%;

            }


            .imagem2{
                position: absolute;
                left: 55%;
                top: 60%;
            }


            .imagem3{
                position: absolute;
                left: 55%;
                top: 140%;
            }


            .imagem4{
                position: absolute;
                top: 140%;
                left: 15%;
            }

            .imagem5{
                position: absolute;
                top: 225%;
                left: 70%;

            }



            #cabecalho {
                top: 10px;
                margin-left: 127px;
                width: 1347px;
                height: 198px;	
                background-repeat: no-repeat;
                background-position: fixed;

            }		
        </style>


        <link rel="stylesheet" href="styles.css">
    <div id='cssmenu'>
        <img  width="100%" src="imagens/newbanner.png" class=""/> </p>
    <ul>
        <li class='active'><a href='pagInicial.jsp'>Home</a></li>
        <li><a href='#'> Sobre </a></li>
        <li><a href='#'> Contato </a></li>
        <li><a href='#'> Ajuda </a></li>
    </ul>
</div>

<h2 align="center"> AGENDAR CONSULTA MEDICA </h2>
<table border="1" align="center">
    <tr>
        <td> Médico Clínico Geral </td>
        <td> Dr. Thomas Lopes </td>

    </tr>
    <tr>
        <td> Psicólogo </td>
        <td> Dr. Wisley Hudson </td>

    </tr>

    <tr>
        <td> Dentista </td>
        <td> Dra. Samita Raquel </td>

    </tr>
</table>
<br>	

<%

    String n = request.getParameter("nome");
    String m = request.getParameter("matricula");
    String c = request.getParameter("curso");
    String em = request.getParameter("espMed");
    String h = request.getParameter("horario");
    Banco b = new Banco();

%>

<h1> REALIZAR AGENDAMENTO DE CONSULTA </h1>

<% if (n == null) {%>
<form>
    <fieldset>
        <legend> Preencha o formulário abaixo</legend>

        <label> Nome </label>
        <input type="text" name="nome" required placeholder="Digite seu nome" >	


        <label> Matrícula </label>
        <input type="text" name="matricula" required placeholder="Digite sua matrícula" maxlength="14">	
        <br><br>

        <label> Curso </label><br>
        <input type="radio" name="curso" value="Informatica"> Informática <br>
        <input type="radio" name="curso" value="Administracao"> Administração<br>
        <input type="radio" name="curso" value="Eletrotécnica"> Eletrotécnica<br>
        <input type="radio" name="curso" value="Física"> Física <br>
        <input type="radio" name="curso" value="Energias"> Energias <br>

        <br>

        <label> Especialista Médico </label>
       
        <select name="espMed">
            <option>Médico Clínico Geral</option>
            <option>Psicólogo</option>
            <option>Dentista</option>
        </select>

        <br>
        <br>

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

        <label> Horario </label><br> 
        Das: <input id="hora" type="text" name="horario" size="3" required/> 
        às: <input id="hora1" type="text" name="horario"  size="3" required/> 
        <br>
        <br>
        <button type="submit"> Agendar consulta </button>
        <button type="reset"> Limpar campos</button>

    </fieldset>
</form>
<%} else {
    b.ReservarConsulta(n, m, c, em, h);
%>

<fieldset class="login1">
    <p style="text-align: center">CADASTRADO FEITO COM SUCESSO <br/><br/>
        <a class="ap" href="index.jsp">Entrar</a></p>
</fieldset>

<%}%>



<tr>



<div id="body">
</div>
<div id="cabecalho">
</div>
<div id="rodape">
    <div>
        </head>
        </body>
        </html>

