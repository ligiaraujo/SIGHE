
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
<%@page import="banco.Refeicao"%>
<%@page import="banco.RefeicaoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

     <head>
 <link rel="shortcut icon" href="imagens/ico.png"/>
		<title> AGENDAR REFEIÇÃO </title>
	<style type="text/css">

	body{


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
 
 
 
 


   <img  width="100%" src="imagens/newbanner.png"> </p>

   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
  


<div id='cssmenu'>
<ul>
   <li class='active'><a href='#'> Home </a></li>
   <li><a href='#'> Usuarios </a></li>
   <li><a href='#'> Ajuda </a></li>
    <li><a href='#'> Sobre </a></li>
</ul>
</div>
	<link rel="stylesheet" href="styles.css">


			 
                  
                         <%
            String n = request.getParameter("nome");
            String m = request.getParameter("matricula");
            String tr = request.getParameter("tipoRefeicao");
            String j = request.getParameter("justificativa");
           
            Banco d = new Banco ();
        %>
          
        

<h1> CADASTRO DE USUARIO </h1>

<% if (n == null) {%>

<form action="refeicao.jsp" method="post">
    <fieldset class="login">

        <legend> Preencha o formulário abaixo</legend>

        <label> Nome </label> <br>
        <input type="text" name="nome" placeholder="Digite Seu Nome" maxlength="30">
        <br><br>

        <label> Matrícula </label> <br>
        <input type="text" name="matricula" placeholder="Digite Sua Matrícula"  maxlength="14">	
        <br><br>


        <label> Tipo De Refeicao: </label><br>
        <input type="radio" name="tipoRefeicao" value="Jantar" checked/>Jantar
        <input type="radio" name="tipoRefeicao" value="Almoco">Almoco
        <br/><br/> 
        
        <label> Justifivativa </label> <br>
<textarea name="justificativa" cols="50" rows="5" > </textarea>
<br> <br>

        <input type="submit" id="cadastrarAluno" name="cadastrarAluno" value="cadastrarAluno">
        <button type="reset"> Limpar Dados </button>	                     

    </fieldset>
</form>
       
<%} else {
            d.cadastrarRefeicao(n, m, tr, j);
        %>

<fieldset class="login1">
    <p style="text-align: center">CADASTRADO FEITO COM SUCESSO <br/><br/>
        <a class="ap" href="index.jsp">Entrar</a></p>
</fieldset>

<%}%>
				
				
			
		

<div id="body"> </div> 
    <div id="cabecalho">
</div>
<div id="rodape">
</div> 
    
</body>
               

 



