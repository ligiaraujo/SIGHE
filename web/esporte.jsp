<%-- 
    Document   : esporte
    Created on : 02/02/2015, 20:04:49
    Author     : Wisley
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>

<%@page import="banco.Banco"%>
<%@page import="banco.ReservaEsporte"%>
<%@page import="banco.ReservaEsporteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title> RESERVAR AMBIENTE ESPORTIVO </title>
        <style type="text/css">


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

    <img  width="100%" src="imagens/newbanner.png"> </p>

<link rel="stylesheet" href="styles.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

<script src="script.js"></script>




<div id='cssmenu'>
    <ul>
        <li class='active'><a href='#'>Home</a></li>
        <li><a href='#'> Usuarios </a></li>
        <li><a href='#'> Ajuda </a></li>
        <li><a href='#'> Sobre </a></li>
    </ul>
</div>
<link rel="stylesheet" href="css/styles.css">

<br>



<%

    String n = request.getParameter("nome");
    String m = request.getParameter("matricula");
    String h = request.getParameter("horario");
    String te = request.getParameter("tipoEsporte");
    String qtd = request.getParameter("qtdBolas");
    String t = request.getParameter("turno");
    Banco b = new Banco();

%>



<h1> RESERVA GINASIO </h1>

<% if (n == null) {%>

<form action="esporte.jsp" method="post">
    <fieldset class="login">

        <legend> Preencha o formulário abaixo</legend>

        <label> Nome </label>
        <input type="text" name="nome" placeholder="Digite seu nome" required/>	

        <br> <br>

        <label> Matrícula </label>
        <input type="text" name="matricula" placeholder="Digite sua matrícula" required/>	
        <br><br>

        <label> Turno </label><br>
        <input type="radio" name="turno" value="Manha" required/>Manha<br>
        <input type="radio" name="turno" value="Tarde" required/>Tarde<br>
        <input type="radio" name="turno" value="Noite" required/>Noite<br>

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
        às: <input id="hora1" type="text" name="horario"  size="3" required/> *Máx. de 1h!
        <br>
        <br>
        <label> Prática esportiva </label>
        
        <select name="tipoEsporte" required/>
            <option >Futebol</option>
            <option >Futsal</option>
            <option >Handball</option>
            <option> Vôlei</option>
            <option >Basquete</option>
            <option>Beach Soccer</option>
        </select>
        <br>
        <br>
        
      

        <label for="Quantidade"> Quantidade de bolas </label>
        <input type="number" name="qtdBolas" min="1" max="2" required/>* Máximo de Duas *




        <br>
        <br>

        <button type="submit"> Agendar prática esportiva </button>
        <button type="reset"> Limpar campos</button>

    </fieldset>
</form>

<%} else {
    b.ReservaEsporte(n, m, h, te, qtd, t);
%>

<fieldset class="login1">
    <p style="text-align: center">CADASTRADO FEITO COM SUCESSO <br/><br/>
        <a class="ap" href="index.jsp">Entrar</a></p>
</fieldset>

<%}%>








    <div id="body">
    </div>
    <div id="cabecalho">
    </div>
    <div id="rodape">
        <div>
            </head>
            </body>
            </html>

