
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
<%@page import="banco.Aluno"%>
<%@page import="banco.AlunoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <link rel="shortcut icon" href="imagens/ico.png"/>
    <title> Cadastro de Alunos </title>

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

</head>


<div id='cssmenu'>
    <ul>
        <li class='active'><a href=pagInicial.jsp>Home</a></li>
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
    String dt = request.getParameter("dataNasc");
    String e = request.getParameter("email");
    String tel = request.getParameter("telefone");
    String cpf = request.getParameter("cpf");
    String s = request.getParameter("sexo");
    Banco b = new Banco();

%>



<h1> CADASTRO DE USUARIO </h1>

<% if (n == null) {%>
<form action="cadastroAluno.jsp" method="post">
    <fieldset class="login">

        <legend> Preencha o formulário abaixo</legend>

        <label> Nome </label> <br>
        <input type="text" name="nome" placeholder="Digite Seu Nome" maxlength="30" required/>
        <br><br>

        
        
        <label> Matrícula </label> <br>
        <input type="text" name="matricula" placeholder="Digite Sua Matrícula"  maxlength="14" required/>	
        <br><br>

        <label> Data de nascimento  </label> <br>
        <input type="date" name="dataNasc" size="30"  maxlength="48" required/> 
        <br><br>

        <label> Email </label> <br>
        <input type="email" name="email" placeholder="Digite seu emal" maxlength="30" required/>	
        <br><br>
        
        <script type="text/javascript" src="js/jquery-1.2.6.pack.js">
        </script>

        <script type="text/javascript" src="js/jquery.maskedinput-1.1.4.pack.js"/>
        </script>

        <script type="text/javascript">$(document).ready(function () {
                $("#telefone").mask("(99) 9999-9999");
            });</script>

        <label> Telefone </label> <br>
        <input  type="tel" id="telefone" name="telefone"  size=30 maxlength="2" placeholder="DDD" required/> 
        <span class="obrigatorio"></span>   
        <br><br>

        <label> CPF </label> <br>
        <input name="cpf" type="text" id="cpf" required placeholder="xxx.xxx.xxx-xx" required/>
        <br><br>

        <script type="text/javascript" src="js/jquery-1.2.6.pack.js">
        </script>

        <script type="text/javascript" src="js/jquery.maskedinput-1.1.4.pack.js"/>
        </script>

        <script type="text/javascript">$(document).ready(function () {
                $("#cpf").mask("999.999.999-99");
            });
        </script>


        <label> Sexo: </label><br>
        <input type="radio" name="sexo" value="Feminino" size="30" maxlength="2048" checked/>Feminino
        <input type="radio" name="sexo" value="Masculino">Masculino
        <br/><br/> 
        <input type="submit" id="cadastrarAluno" name="cadastrarAluno" value="cadastrarAluno">
        <button type="reset"> Limpar Dados </button>	                     

    </fieldset>
</form>
<%} else {
    b.cadastroAluno(n, m, dt, e, tel, cpf, s);
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
</div>
</head>
</body>


