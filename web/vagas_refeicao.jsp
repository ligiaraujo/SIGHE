<%-- 
    Document   : vagas_refeicao
    Created on : 09/05/2015, 13:09:56
    Author     : Wisley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGHE - VAGAS DE REFEIÇÃO</title>
        <link rel="stylesheet" type="text/css" href="css/MasterPage.css"/>
        <link rel="shortcut icon" href="imagens/ico.png"/>
    </head>
    <body>
    <center>
        <h3 style="padding-top: 30px">INSERIR VAGAS DE REFEIÇÕES DO DIA</h3> 
 

        <p id="titAS">Almoço</p>
   
        <form action="vagas_refeicao.jsp" method="post">
            <input type="number" name="almoco" placeholder="Vagas hoje" required="">
            <input type="submit" name="inserir" value="Inserir" class="sub">
        </form>
        
        <p id="titAS">Janta</p>
   
        <form action="vagas_refeicao.jsp" method="post">
            <input type="number" name="almoco" placeholder="Vagas hoje" required="">
            <input type="submit" name="inserir" value="Inserir" class="sub">
        </form>
        
     <br><br><br><br>
        <input type="button" value="Fechar" class="sub" onclick="javascript:window.close()"/>    
       
    </center>
</html>
