<%-- 
    Document   : pagInicial
    Created on : 02/02/2015, 20:25:17
    Author     : Wisley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title> SIGHE - PÁGINA INICIAL </title>



        <style type="text/css">


            header {

                position: fixed;

            }



            .imagem1{
                position: absolute;
                top: 40%;
                left: 15%;
                border-radius:0px 20px 0px 20px;

            }


            .imagem2{
                position: absolute;
                left: 55%;
                top: 40%;
                border-radius:0px 20px 0px 20px;
            }


            .imagem3{
                position: absolute;
                left: 55%;
                top: 110%;
                border-radius:0px 20px 0px 20px;
            }


            .imagem4{
                position: absolute;
                top: 110%;
                left: 15%;
                border-radius:0px 20px 0px 20px;
            }

            .imagem5{
                position: absolute;
                top: 220%;
                left: 70%;

            }







        </style>



    <img  width="100%" src="imagens/newbanner.png" class="header"> </p>

<link rel="stylesheet" href="styles.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="script.js"></script>

</head>


<div id='cssmenu'>
    <ul>
        <li> <a href=pagInicial.jsp>Home</a></li>
        <li><a href=cadastroAluno.jsp> Usuarios </a></li>
        <li><a href='#'> Ajuda </a></li>
        <li><a href='#'> Sobre </a></li>
    </ul>
</div>
<link rel="stylesheet" href="styles.css">






<a href="consultaMed.jsp"><p> <img title="Marcar consulta" onmouseover="this.style.opacity = 1;
        this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.5;
                this.filters.alpha.opacity = 50" style="opacity: 0.5;" width="30%" src="imagens/cons.jpg" class="imagem1"   /> </a>
</p>
<a href="refeicao.jsp"><p> <img title="Agendar refeição" onmouseover="this.style.opacity = 1;
        this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.5;
                this.filters.alpha.opacity = 50" style="opacity: 0.5;" width="30%"  src="imagens/ref.jpg" class="imagem2"/> </p> </a>
<a href="lab.jsp"> <img title="Reservar laboratório" onmouseover="this.style.opacity = 1;
        this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.5;
                this.filters.alpha.opacity = 50" style="opacity: 0.5;" width="30%" src="imagens/lab.jpg" class="imagem3"/> </a>
<a href="esporte.jsp"> <img title="Fazer reserva do Ginásio de Esportes" onmouseover="this.style.opacity = 1;
        this.filters.alpha.opacity = 100" onmouseout="this.style.opacity = 0.5;
                this.filters.alpha.opacity = 50" style="opacity: 0.5;"  width="30%" src="imagens/sport.jpg" class="imagem4"/> </p> </a>

<div id="body">
</div>
<div id="cabecalho">
</div>
<div id="rodape">
    <p id="textoRodape">
        <img  width="20%" src="imagens/logoifrn.jpg" class="imagem5"/> </p>
</p>
</head>
</body>
</html>

