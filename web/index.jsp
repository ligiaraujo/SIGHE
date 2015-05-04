<%-- 
    Document   : index
    Created on : 11/03/2015, 16:30:11
    Author     : Wisley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title>SIGHE - LOGIN</title>
        <link rel="stylesheet" type="text/css" href="css/MasterPage.css" />
        <style type="text/css">
            body{
                background-image: url(imagens/bg.gif);
                background-repeat: repeat;
                margin-top: 100px;
            }  
        </style>
        <script language='JavaScript'>
            function SomenteNumero(e) {
                var tecla = (window.event) ? event.keyCode : e.which;
                if ((tecla > 47 && tecla < 58))
                    return true;
                else {
                    if (tecla == 8 || tecla == 0)
                        return true;
                    else
                        return false;
                }
            }
        </script>
    </head>
    <body>
        <div class="wrapper"> 
            <div class="content">
                <div id="form_wrapper" class="form_wrapper">

                    <form class="login active" action="logar.jsp" method="post">
                        <img src="imagens/banner.jpg" width="350" id="user"/> 
                        <label>Matrícula</label>
                        <input type="text" name="matricula" size="30" maxlength="20" required="" onkeypress="return SomenteNumero(event)"/>
                        <label>Senha</label>
                        <input type="password" name="senha" size="30" maxlength="10" required="">
                        <input type="submit" value="Entrar" class="btnPositivo" > 
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>






