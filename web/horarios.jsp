<%-- 
    Document   : horarios
    Created on : 02/05/2015, 23:18:59
    Author     : Wisley
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="banco.*"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="imagens/ico.png"/>
        <title> SIGHE - HORÁRIOS </title>
        <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
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
            <%
                if (usuLogado.getString("tipo").equals("Funcionário")) {
            %>
            <p style="padding-right: 20px; text-align: right;"><%=usuLogado.getString("nome")%> (<%=usuLogado.getString("funcao")%>)</p>
            <%
            } else {
            %>
            <p style="padding-right: 20px; text-align: right;"><%=usuLogado.getString("nome")%> (<%=usuLogado.getString("tipo")%>)</p>
            <%
                }
            %>
        </div>

        <div id='corpo'>
            <%
                String matricula = usuLogado.getString("matricula");
                RefeicaoDAO refeicaoDAO = new RefeicaoDAO();
                ResultSet refeicao = refeicaoDAO.selecionarRefeicaoMat(matricula);
                boolean temRefeicao = refeicaoDAO.temRefeicaoMat(matricula);
                LaboratorioDAO laboratorioDAO = new LaboratorioDAO();
                ResultSet laboratorio = laboratorioDAO.selecionarLabReservador(matricula);
                boolean temLab = laboratorioDAO.temLaboratorioReservador(matricula);
                GinasioDAO ginasioDAO = new GinasioDAO();
                ResultSet ginasio = ginasioDAO.selecionarGinasioMat(matricula);
                boolean temGinasio = ginasioDAO.temGinasioMat(matricula);
                ConsultaDAO consultaDAO = new ConsultaDAO();
                ResultSet consulta = consultaDAO.selecionarConsultaMat(matricula);
                boolean temCons = consultaDAO.temConsultaMat(matricula);

                SimpleDateFormat formatarDate = new SimpleDateFormat("dd/MM/yyyy"); //ano
                SimpleDateFormat formatarDateDia = new SimpleDateFormat("EEE"); //dia da semana
            %>
            <% if (usuLogado.getString("tipo").equals("Professor")) {%> <!-- COMEÇA VERFICAR AS CONDIÇOES DE USUARIOS -->
            <a href="aprovacao.jsp" style="text-decoration: none; color: black;"> <!-- PROFESSOR -->
                <div style="text-align:left;">    
                    <div id="divSol">
                        <%= laboratorioDAO.countLaboratorioProfessorAvaliar(matricula)%>
                    </div>
                    <div style="font-size: 14pt; margin-left: 60px;">
                        <%if (laboratorioDAO.countLaboratorioProfessorAvaliar(matricula) == 1) {%>
                        Solicitação
                        <%} else {%>
                        Solicitações
                        <%}%>
                    </div>
                </div>
            </a>
            <%}
                if (usuLogado.getString("tipo").equals("Aluno")) { %> <!-- ALUNO -->
            <h2>Suas Reservas de Refeição</h2>
            <% if (temRefeicao) { %>
            Últimas refeições reservadas:
            <table class="tbl">
                <tr>
                    <th>Tipo</th>
                    <th style="width: 300px">Justificativa</th>                         
                    <th>Data</th>   
                </tr>
                <% while (refeicao.next()) {
                        Date data = refeicao.getDate("data");
                %>
                <tr> 
                    <td><%= refeicao.getString("tipo")%></td>          
                    <td><%= refeicao.getString("justificativa")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>  
                </tr>
                <% } %>
            </table>
            <br>
            <hr>
            <% } else { %>
            Sem refeição reservada.
            <br>
            <hr>
            <%
                    }
                }
                if (usuLogado.getString("tipo").equals("Aluno") || usuLogado.getString("tipo").equals("Professor")) {
            %>                                              <!-- ALUNO E PROFESSOR -->
            <h2>Suas Reservas de Laboratório</h2>
            <% if (temLab) { %>
            Últimos laboratórios reservados:
            <table class="tbl">
                <tr>
                    <th>Laboratório</th>
                    <th>Horários</th>                         
                    <th>Turno</th>   
                    <th>Data</th>   
                    <th>Professor Responsável</th>   
                    <th>Aprovação</th>   
                </tr> 
                <% while (laboratorio.next()) {
                        Date data = laboratorio.getDate("data");
                %>
                <tr> 
                    <td><%= laboratorio.getString("laboratorio")%></td>          
                    <td><%= laboratorio.getString("horario")%></td>          
                    <td><%= laboratorio.getString("turno")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>  
                    <td><%= laboratorio.getString("usuario.nome")%></td>          
                    <td><%= laboratorio.getString("aprovacao")%></td> 
                </tr>
                <% } %>
            </table>
            <% } else { %>
            Sem laboratório reservado.
            <% }%>
            <br>
            <hr>
            <h2>Suas Reservas de Ginásio</h2>
            <% if (temGinasio) { %>
            Últimas reservas de ginásio:
            <table class="tbl">
                <tr>
                    <th>Esporte</th>
                    <th>Bolas</th>                         
                    <th>Horário</th>                         
                    <th>Data</th>   
                </tr> 
                <% while (ginasio.next()) {
                        Date data = ginasio.getDate("data");
                %>
                <tr> 
                    <td><%= ginasio.getString("tipoEsporte")%></td>          
                    <td><%= ginasio.getString("qtdBolas")%></td>          
                    <td><%= ginasio.getString("horario")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>  
                </tr>
                <% } %>
            </table>
            <% } else { %>
            Sem reserva de ginásio.
            <%
                    }
                }
                if (usuLogado.getString("tipo").equals("Aluno")) {
            %>
            <br>
            <hr>
            <h2>Reservas de Consulta Médica</h2>
            <% if (temCons) { %>
            Últimas consultas reservadas:
            <table class="tbl">
                <tr>
                    <th>Médico</th>
                    <th>Hora</th>                             
                    <th>Data</th>   
                </tr>
                <% while (consulta.next()) {
                        Date data = consulta.getDate("data");
                %>
                <tr> 
                    <td><%= consulta.getString("medico")%></td>          
                    <td><%= consulta.getString("hora")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>            
                </tr>
                <% } %>
            </table>
            <% } else { %>
            Sem consulta reservada.
            <%
                }
            } else if (usuLogado.getString("tipo").equals("Professor")) {
                ResultSet aprovado = laboratorioDAO.selecionarLabProfessorAprovado(matricula);
                boolean temLabAprovado = laboratorioDAO.temLaboratorioProfessorAprovado(matricula);
                // ResultSet avaliar = laboratorioDAO.selecionarLabProfessorAvaliar(matricula);
                // boolean temLabAvaliar = laboratorioDAO.temLaboratorioProfessorAvaliar(matricula);
            %>                                                                           <!-- PROFESSOR -->
            <br>
            <hr>
            <h2>Suas Responsabilidades Aprovadas</h2>
            <% if (temLabAprovado) { %>
            Laboratórios por qual você aprovou resposabilidade:
            <table class="tbl">
                <tr>
                    <th>Laboratório</th>
                    <th>Horários</th>                         
                    <th>Turno</th>   
                    <th>Data</th>   
                    <th>Solicitador</th>   
                    <th>Aprovação</th>   
                </tr> 
                <% while (aprovado.next()) {
                        Date data = aprovado.getDate("data");
                %>
                <tr> 
                    <td><%= aprovado.getString("laboratorio")%></td>          
                    <td><%= aprovado.getString("horario")%></td>          
                    <td><%= aprovado.getString("turno")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>  
                    <td><%= aprovado.getString("usuario.nome")%></td>          
                    <td style="text-align: center"><%= aprovado.getString("aprovacao")%></td> 
                </tr>
                <% } %>
            </table>
            <% } else { %>
            Sem laboratórios por qual você é responsável.
            <%
                }
            } else if (usuLogado.getString("tipo").equals("Funcionário")) {
                Date dataHoje = new Date(System.currentTimeMillis());
                SimpleDateFormat sdfDiaNSem = new SimpleDateFormat("u"); //nunmero do dia da semana 1 - segunda, 2 - terça, 3 - quarta 4 - quinta, 5 - sexta, 6 - sabado, 7 domingo
                SimpleDateFormat sdfDia = new SimpleDateFormat("EEEEEE");
                if (usuLogado.getString("funcao").equals("Gerente de Refeição")) {
            %> 
            <h2>REFEIÇÃO <%= formatarDate.format(dataHoje)%></h2>     <!-- FUNC. GERENTE DE REFEICAO -->
            <%
                if (Integer.parseInt(sdfDiaNSem.format(dataHoje)) != 6 && Integer.parseInt(sdfDiaNSem.format(dataHoje)) != 7) {
                    ResultSet almoco = refeicaoDAO.selecionarRefeicao(dataHoje.toString(), "Almoço");
                    ResultSet janta = refeicaoDAO.selecionarRefeicao(dataHoje.toString(), "Janta");
                    boolean temAlmoco = refeicaoDAO.temRefeicao(dataHoje.toString(), "Almoço");
                    boolean temJanta = refeicaoDAO.temRefeicao(dataHoje.toString(), "Janta");
                    int countAlmoco = refeicaoDAO.countPreenchido(dataHoje.toString(), "Almoço");
                    int countJanta = refeicaoDAO.countPreenchido(dataHoje.toString(), "Janta");
            %>
            <table>
                <tr>
                    <td><div style="font-size: 13pt; margin-left: 60px;"> Almoço</div></td>
                    <td><div style="font-size: 13pt; margin-left: 60px;"> Janta</div></td>
                </tr>
                <tr> 
                    <td style="padding-left: 20px; font-size: 12pt;"><div style="text-align:left;"><div id="divSol">20</div><div style="font-size: 12pt; margin-left: 60px;">Vagas</div></div></td>
                    <td style="padding-left: 20px; font-size: 12pt;"><div style="text-align:left;"><div id="divSol">15</div><div style="font-size: 12pt; margin-left: 60px;">Vagas</div></div></td>
                </tr>
                <tr> 
                    <td style="padding-left: 20px; font-size: 12pt;"><div style="text-align:left;"><div id="divSol"> <%= countAlmoco%></div><div style="font-size: 12pt; margin-left: 60px;">Preenchidas</div></div></td>
                    <td style="padding-left: 20px; font-size: 12pt;"><div style="text-align:left;"><div id="divSol"><%= countJanta%></div><div style="font-size: 12pt; margin-left: 60px;">Preenchidas</div></div></td>
                </tr>
            </table>
            <br>
            <hr>
            <h3>Lista - Almoço</h3>
            <% if (temAlmoco) { %>
            <table class="tbl">
                <tr>
                    <th style="width: 300px">Aluno</th>
                    <th style="width: 300px">Justificativa</th>                         
                    <th>Data</th>   
                </tr>
                <% while (almoco.next()) {
                        Date data = almoco.getDate("data");
                %>
                <tr> 
                    <td><%= almoco.getString("usuario.nome")%></td>         
                    <td><%= almoco.getString("justificativa")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>  
                </tr>
                <% } %>
            </table>            
            <% } else { %>
            Ainda sem reservas para o almoço.
            <% } %>
            <br>
            <hr>
            <h3>Lista - Janta</h3>
            <% if (temJanta) { %>
            <table class="tbl">
                <tr>
                    <th style="width: 300px">Aluno</th>
                    <th style="width: 300px">Justificativa</th>                         
                    <th>Data</th>   
                </tr>
                <% while (janta.next()) {
                        Date data = janta.getDate("data");
                %>
                <tr> 
                    <td><%= janta.getString("usuario.nome")%></td>          
                    <td><%= janta.getString("justificativa")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>  
                </tr>
                <% } %>
            </table>            
            <% } else { %>
            Ainda sem reservas para o jantar.          
            <%
                }
            } else {
            %>
            --- <%= sdfDia.format(dataHoje)%> ---            
            <%
                }
            } else if (usuLogado.getString("funcao").equals("Gerente de Laboratório")) {
                ResultSet labHoje = laboratorioDAO.selecionarReservasHoje(dataHoje);
                boolean temLabHoje = laboratorioDAO.temReservasHoje(dataHoje);
            %>
            <h2>LABORATÓRIOS RESERVADOS HOJE: <%= formatarDate.format(dataHoje)%></h2> 

            <% if (temLabHoje) { %>
            <table class="tbl">
                <tr>
                    <th>Laboratório</th>
                    <th>Horários</th>                         
                    <th>Turno</th>   
                    <th>Data</th>   
                    <th>Reservador</th>   
                    <th>Aprovação | Mat. Prof</th>   
                </tr> 
                <% while (labHoje.next()) {
                        Date data = labHoje.getDate("data");
                %>
                <tr> 
                    <td><%= labHoje.getString("laboratorio")%></td>          
                    <td><%= labHoje.getString("horario")%></td>          
                    <td><%= labHoje.getString("turno")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>  
                    <td><%= labHoje.getString("usuario.nome")%> (<%= labHoje.getString("usuario.tipo")%>)</td>    
                    <td><%= labHoje.getString("aprovacao")%> | <%= labHoje.getString("matriculaProfessor")%></td> 
                </tr>
                <% } %>
            </table>
            <% } else { %>
            Sem laboratórios reservados hoje.
            <% }%>

            <%
            } else if (usuLogado.getString("funcao").equals("Gerente de Ginásio")) {
                ResultSet ginHoje = ginasioDAO.selecionarGinasioHoje(dataHoje);
                boolean temGinHoje = ginasioDAO.temGinasioHoje(dataHoje);
            %> 
            <h2>RESERVAS DE GINÁSIO HOJE: <%= formatarDate.format(dataHoje)%></h2>
            <% if (temGinHoje) { %>
            <table class="tbl">
                <tr>
                    <th style="width: 300px;">Reservador</th>
                    <th>Esporte</th>
                    <th>Bolas</th>                         
                    <th>Horário</th>                         
                    <th>Data</th>   
                </tr> 
                <% while (ginHoje.next()) {
                        Date data = ginHoje.getDate("data");
                %>
                <tr> 
                    <td><%= ginHoje.getString("usuario.nome")%></td>          
                    <td><%= ginHoje.getString("tipoEsporte")%></td>          
                    <td><%= ginHoje.getString("qtdBolas")%></td>          
                    <td><%= ginHoje.getString("horario")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>  
                </tr>
                <% } %>
            </table>
            <% } else { %>
            Sem reservas de ginásio hoje.
            <% }%>
            <br>
            <hr>
            <h2>OUTRAS RESERVAS DE GINÁSIO</h2>
            <%
                ginasio = ginasioDAO.selecionarGinasio();
                temGinasio = ginasioDAO.temGinasio();
                if (temGinasio) { %>
            Últimas reservas de ginásio:
            <table class="tbl">
                <tr>
                    <th style="width: 300px;">Reservador</th>
                    <th>Esporte</th>
                    <th>Bolas</th>                         
                    <th>Horário</th>                         
                    <th>Data</th>   
                </tr> 
                <% while (ginasio.next()) {
                        Date data = ginasio.getDate("data");
                %>
                <tr> 
                    <td><%= ginasio.getString("usuario.nome")%></td> 
                    <td><%= ginasio.getString("tipoEsporte")%></td>          
                    <td><%= ginasio.getString("qtdBolas")%></td>          
                    <td><%= ginasio.getString("horario")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>  
                </tr>
                <% } %>
            </table>
            <% } else { %>
            Sem reserva de ginásio.
            <%
                }
            } else if (usuLogado.getString("funcao").equals("Gerente de Consulta Médica")) {
                consulta = consultaDAO.selecionarConsultaHoje(dataHoje);
                temCons = consultaDAO.temConsultaHoje(dataHoje);
            %>
            <h2>CONSULTAS RESERVADAS HOJE: <%= formatarDate.format(dataHoje)%></h2>
            <% if (temCons) { %>
            <table class="tbl">
                <tr>
                    <th style="width: 300px">Paciente</th>
                    <th>Médico</th>
                    <th>Hora</th>                             
                    <th>Data</th>   
                </tr>
                <% while (consulta.next()) {
                        Date data = consulta.getDate("data");
                %>
                <tr> 
                    <td><%= consulta.getString("usuario.nome")%></td>          
                    <td><%= consulta.getString("medico")%></td>          
                    <td><%= consulta.getString("hora")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>            
                </tr>
                <% } %>
            </table>
            <% } else { %>
            Sem consultas reservadas hoje.
            <%
                }
                consulta = consultaDAO.selecionarConsulta();
                temCons = consultaDAO.temConsulta();
            %>
            <br>
            <hr>
            <h2>OUTRAS CONSULTAS</h2>
            <% if (temCons) { %>
            Últimas consultas reservadas:
            <table class="tbl">
                <tr>
                    <th style="width: 300px">Paciente</th>
                    <th>Médico</th>
                    <th>Hora</th>                             
                    <th>Data</th>   
                </tr>
                <% while (consulta.next()) {
                        Date data = consulta.getDate("data");
                %>
                <tr> 
                    <td><%= consulta.getString("usuario.nome")%></td>          
                    <td><%= consulta.getString("medico")%></td>          
                    <td><%= consulta.getString("hora")%></td>          
                    <td><%= formatarDateDia.format(data)%>, <%= formatarDate.format(data)%></td>            
                </tr>
                <% } %>
            </table>
            <% } else { %>
            Sem consultas reservadas hoje.
            <%
                        }
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