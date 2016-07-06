
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.swing.text.Document"%>
<%-- 
    Document   : usuarios
    Created on : 02/02/2015, 20:04:49
    Author     : Wisley
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>

<%@page import="banco.Banco"%>
<%@page import="banco.Usuario"%>
<%@page import="banco.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<head>  
    <link rel="shortcut icon" href="imagens/ico.png"/>
    <title>SIGHE - USUÁRIOS</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link rel="stylesheet" type="text/css" href="css/MasterPage.css"/>
    <link rel="stylesheet" type="text/css" href="css/Menu.css"/>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="js/script.js"></script>
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
        function submeter() {
            document.getElementById('formOpcao').submit();
        }
        function verificarAcao() {
            if (confirm('Tem certeza que deseja fazer isso?')) {
                return true;
            } else {
                return false;
            }
        }
    </script>
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
        <form action="usuarios.jsp" id="formOpcao" method="post">
            <label>Escolha um tipo de usuário: </label>
            <input type="radio" name="opcao" value="Aluno" onchange="submeter()">Aluno
            <input type="radio" name="opcao" value="Professor" onchange="submeter()">Professor
            <input type="radio" name="opcao" value="Funcionário" onchange="submeter()">Funcionário
        </form>

        <%
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            try {
                String opcao = request.getParameter("opcao");
                String acao = request.getParameter("acao");
                String filtro = request.getParameter("filtro");
        %>
        <h1> <%=opcao.toUpperCase()%></h1>        
        <%
            if (usuLogado.getString("funcao").equals("Administrador")) {
                if (acao == null) {%>
        <form id="send" action="usuarios.jsp" method="post"> 
            <table style="border-top: 1px solid #C9C9C9; padding-top: 5px;" class="formCad">
                <tr>
                    <td style="border-right: 1px solid #C9C9C9; padding-right: 5px;">
                        <input width="14%" type="text" name="nome" placeholder="Nome" maxlength="30" required/>
                        <br><br>
                        <input type="text" name="matricula" placeholder="Matrícula"  maxlength="14" onkeypress="return SomenteNumero(event)" required/>	
                        <br><br>
                        <input type="password" name="senha" placeholder="Senha" maxlength="30" required/>
                        <br><br>                
                        <input type="email" name="email" placeholder="E-mail" maxlength="30" required/>	
                        <br><br>
                        <input name="cpf" type="text" id="cpf" required placeholder="CPF" required/>
                        <script type="text/javascript" src="js/jquery-1.2.6.pack.js">
                        </script>
                        <script type="text/javascript" src="js/jquery.maskedinput-1.1.4.pack.js"/>
                        </script>
                        <script type="text/javascript">$(document).ready(function () {
                                $("#cpf").mask("999.999.999-99");
                            });
                        </script>
                    </td>          
                    <td style="padding-left: 5px; text-align: right;">          
                        <%if (opcao.equals("Funcionário")) {%>
                        <select name="funcao">
                            <option value="" style="color: gray">Função</option>                                
                            <option value="Administrador">Administrador</option>                                
                            <option value="Gerente de Refeição">Gerente de Refeição</option>                                
                            <option value="Gerente de Laboratório">Gerente de Laboratório</option>                                
                            <option value="Gerente de Ginásio">Gerente de Ginásio</option>                                
                            <option value="Gerente de Consulta Médica">Gerente de Consulta Médica</option>                                   
                        </select>
                        <%} else {%> 
                        <select name="curso">
                            <option value="" style="color: gray">Curso</option>                                
                            <option value="Administração">Administração</option>                                
                            <option value="Eletrotécnica">Eletrotécnica</option>                                
                            <option value="Energias Renováveis">Energias Renováveis</option>                                
                            <option value="Física">Física</option>                                
                            <option value="Informática">Informática</option>                                
                        </select>
                        <%}%>
                        <br><br>
                        <select name="sexo">
                            <option value="" style="color: gray">Sexo</option>                                
                            <option value="Feminino">Feminino</option>                                                         
                            <option value="Masculino">Masculino</option>                                     
                        </select>
                        <br/><br/> 
                        <input type="date" name="dataNasc" required/> 
                        <br><br>
                        <input  type="text" id="telefone" name="telefone" placeholder="Telefone" required/>            
                        <br><br>                
                        <script type="text/javascript">$(document).ready(function () {
                                $("#telefone").mask("(99) 9999-9999");
                            });</script>
                        <input type="submit" name="acao" value="Cadastrar" style="width: auto" class="sub">
                        <input type="hidden" name="opcao" value="<%=opcao%>">                
                    </td>
                </tr>
            </table>
        </form>        
        <%} else if (acao.equals("Cadastrar")) {
            Usuario usuario = new Usuario();
            usuario.setTipo(opcao);
            usuario.setMatricula(request.getParameter("matricula"));
            usuario.setSenha(request.getParameter("senha"));
            usuario.setNome(request.getParameter("nome"));
            usuario.setEmail(request.getParameter("email"));
            usuario.setDataNasc(request.getParameter("dataNasc"));
            usuario.setTelefone(request.getParameter("telefone"));
            usuario.setCpf(request.getParameter("cpf"));
            usuario.setSexo(request.getParameter("sexo"));
            if (opcao.equals("Funcionário")) {
                usuario.setCurso("-");
                usuario.setFuncao(request.getParameter("funcao"));
            } else {
                usuario.setCurso(request.getParameter("curso"));
                usuario.setFuncao("-");
            }

            UsuarioDAO usuarioDAO2 = new UsuarioDAO();
            boolean resultCadastro = usuarioDAO2.inserir(usuario);

            if (!resultCadastro) {
        %>
        <p style="text-align: center">
            DESCULPE, MATRÍCULA JÁ CADASTRADA. <br/><br/>
        </p>
        <form action="usuarios.jsp" method="post">
            <input type="hidden" name="opcao" value="<%=opcao%>">
            <input type="submit" value="Tentar novamente">
        </form>
        <br/>
        <%
        } else {
        %>
        <p style="text-align: center">
            <%=opcao.toUpperCase()%> CADASTRADO COM SUCESSO. <br/><br/>
        </p>
        <form action="usuarios.jsp" method="post">
            <input type="hidden" name="opcao" value="<%=opcao%>">
            <input type="submit" value="Cadastrar novo">
        </form>
        <br/>
        <%}%>        
        <%} else if (acao.equals("editar")) {
            String id = request.getParameter("id");
            String n = request.getParameter("nome");
            String e = request.getParameter("email");
            String tel = request.getParameter("telefone");
            String c = request.getParameter("curso");
            String fc = request.getParameter("funcao");
            if (opcao.equals("Funcionário")) {
                c = "-";
            } else {
                fc = "-";
            }

            UsuarioDAO usuarioDAO2 = new UsuarioDAO();

            Usuario u = new Usuario();
            u.setNome(n);
            u.setCurso(c);
            u.setFuncao(fc);
            u.setTelefone(tel);
            u.setEmail(e);
            u.setIdUsuario(id);
            usuarioDAO2.editar(u);

        %>
        <p style="text-align: center">
            <%=opcao.toUpperCase()%> EDITADO COM SUCESSO. <br/><br/>
        </p>
        <form action="usuarios.jsp" method="post">
            <input type="hidden" name="opcao" value="<%=opcao%>">
            <input type="submit" value="OK">
        </form>
        <br/>
        <%} else if (acao.equals("excluir")) {
            String id = request.getParameter("id");
            UsuarioDAO usuarioDAO2 = new UsuarioDAO();
            usuarioDAO2.excluir(id);
        %>
        <p style="text-align: center">
            <%=opcao.toUpperCase()%> EXCLUÍDO COM SUCESSO. <br/><br/>
        </p>
        <form action="usuarios.jsp" method="post">
            <input type="hidden" name="opcao" value="<%=opcao%>">
            <input type="submit" value="OK">
        </form>
        <br/>
        <%}
            }%>        
        <br>
        <hr>
        <br>
        <form action="usuarios.jsp" id="formFiltro" method="post">
            <%if (opcao.equals("Funcionário")) {%>
            <%if (filtro == null) { %>
            <input type="text" name="filtro" placeholder="Filtrar por nome, matrícula ou função" style="width: 300px;" onkeypress="submeterFiltro()">
            <%} else {%>
            <input type="text" name="filtro" value="<%=filtro%>" placeholder="Filtrar por nome, matrícula ou setor" style="width: 300px;" onkeypress="submeterFiltro()">
            <%}
            } else {%> 

            <%if (filtro == null) { %>
            <input type="text" name="filtro" placeholder="Filtrar por nome, matrícula ou curso" style="width: 300px;" onkeypress="submeterFiltro()">
            <%} else {%>
            <input type="text" name="filtro" value="<%=filtro%>" placeholder="Filtrar por nome, matrícula ou curso" style="width: 300px;" onkeypress="submeterFiltro()">
            <%}
                }%>
            <input type="hidden" name="opcao" value="<%=opcao%>">
            <input type="submit" value="Filtrar" class="sub">
        </form>
        <%
            ResultSet lista = null;
            if (opcao.equals("Aluno")) {
                if (filtro == null) {
                    lista = usuarioDAO.selecionarAlunos();
                } else {
                    lista = usuarioDAO.filtrarAlunos(filtro);
                }
            } else if (opcao.equals("Professor")) {
                if (filtro == null) {
                    lista = usuarioDAO.selecionarProfessores();
                } else {
                    lista = usuarioDAO.filtrarProfessores(filtro);
                }
            } else if (opcao.equals("Funcionário")) {
                if (filtro == null) {
                    lista = usuarioDAO.selecionarFuncionarios();
                } else {
                    lista = usuarioDAO.filtrarFuncionarios(filtro);
                }
            }

            if (usuLogado.getString("funcao").equals("Administrador")) {
        %>
        <table id="tbUsers1">
            <tr>
                <th style="width: 160px;">Matrícula</th>
                <th>Nome</th>
                    <%if (opcao.equals("Funcionário")) {%>
                <th>Função</th>
                    <%} else {%>                         
                <th>Curso</th>
                    <%}%>               
                <th>E-mail</th>
                <th>Telefone</th>
                <th style="padding-left: 10px; padding-right: 10px;">Editar</th>
                <th style="padding-left: 10px; padding-right: 10px;">Excluir</th>
            </tr> 
            <%
                int k = 0;
                while (lista.next()) {
                    k++;
            %>
            <form action="usuarios.jsp" method="post" onsubmit="return verificarAcao()">
                <tr>  
                <input type="hidden" name="opcao" value="<%=opcao%>">
                <input type="hidden" name="id" value="<%=lista.getString("idUsuario")%>">
                <td><%=lista.getString("matricula")%></td>
                <td><input type="text" name="nome" value="<%=lista.getString("nome")%>"></td>
                    <%if (opcao.equals("Funcionário")) {%>
                <td>
                    <select name="funcao">
                        <option value="<%=lista.getString("funcao")%>" style="color: gray"><%=lista.getString("funcao")%></option>                                
                        <option value="Administrador">Administrador</option>                                
                        <option value="Gerente de Refeição">Gerente de Refeição</option>                                
                        <option value="Gerente de Laboratório">Gerente de Laboratório</option>                                
                        <option value="Gerente de Ginásio">Gerente de Ginásio</option>                                
                        <option value="Gerente de Consulta Médica">Gerente de Consulta Médica</option>                                   
                    </select>
                </td>
                <%} else {%>                         
                <td>
                    <select name="curso">
                        <option value="<%=lista.getString("curso")%>" style="color: gray"><%=lista.getString("curso")%></option>                                
                        <option value="Administração">Administração</option>                                
                        <option value="Eletrotécnica">Eletrotécnica</option>                                
                        <option value="Energias Renováveis">Energias Renováveis</option>                                
                        <option value="Física">Física</option>                                
                        <option value="Informática">Informática</option>                                
                    </select>
                </td>
                <%}%>
                <td><input type="email" name="email" value="<%=lista.getString("email")%>"></td>
                <td>
                    <input type="text" id="tel<%=k%>" name="telefone" value="<%=lista.getString("telefone")%>">
                    <script type="text/javascript">$(document).ready(function () {
                            $("#tel<%=k%>").mask("(99) 9999-9999");
                        });</script>
                </td>
                <td style="text-align: center"><input type="submit" name="acao" value="Editar" class="sub"></td>
                <td style="text-align: center"><input type="submit" name="acao" value="Excluir" class="sub"></td>           
                </tr>
            </form>
            <%}%>
        </table>
        <%} else {%>
        <table id="tbUsers2">
            <tr>
                <th>Matrícula</th>
                <th>Nome</th>
                    <%if (opcao.equals("Funcionário")) {%>
                <th>Função</th>
                    <%} else {%>                         
                <th>Curso</th>
                    <%}%>               
                <th>E-mail</th>
                <th>Telefone</th>
            </tr> 
            <%   while (lista.next()) {%>
            <tr>  
                <td><%=lista.getString("matricula")%></td>
                <td><%=lista.getString("nome")%></td>
                <%if (opcao.equals("Funcionário")) {%>
                <td><%=lista.getString("funcao")%></td>
                <%} else {%>                         
                <td><%=lista.getString("curso")%></td>
                <%}%>
                <td><%=lista.getString("email")%></td>
                <td><%=lista.getString("telefone")%></td>          
            </tr>
            <%}%>
        </table>
        <%}%>
        <%
                    } catch (NullPointerException e) {
                    }
                }
            }
        %> 

    </div>
</center>
<div id="rodape">
    <p id="textoRodape">
        @ IFRN Campus João Câmara
    </p>
</div>
</body>
</html>