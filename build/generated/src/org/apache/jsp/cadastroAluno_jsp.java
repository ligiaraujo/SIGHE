package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import javax.swing.text.Document;
import java.sql.ResultSet;
import java.sql.Date;
import banco.Banco;
import banco.Aluno;
import banco.AlunoDAO;

public final class cadastroAluno_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\n");
      out.write("\n");
      out.write("    <link rel=\"shortcut icon\" href=\"imagens/ico.png\"/>\n");
      out.write("    <title> Cadastro de Alunos </title>\n");
      out.write("\n");
      out.write("    <style type=\"text/css\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        #rodape {\theight: 260%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .imagem1{\n");
      out.write("            position: absolute;\n");
      out.write("            top: 60%;\n");
      out.write("            left: 15%;\n");
      out.write("\n");
      out.write("        }\n");
      out.write("\n");
      out.write("\n");
      out.write("        .imagem2{\n");
      out.write("            position: absolute;\n");
      out.write("            left: 55%;\n");
      out.write("            top: 60%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("\n");
      out.write("        .imagem3{\n");
      out.write("            position: absolute;\n");
      out.write("            left: 55%;\n");
      out.write("            top: 140%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("\n");
      out.write("        .imagem4{\n");
      out.write("            position: absolute;\n");
      out.write("            top: 140%;\n");
      out.write("            left: 15%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .imagem5{\n");
      out.write("            position: absolute;\n");
      out.write("            top: 225%;\n");
      out.write("            left: 70%;\n");
      out.write("\n");
      out.write("        }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        #cabecalho {\n");
      out.write("            top: 10px;\n");
      out.write("            margin-left: 127px;\n");
      out.write("            width: 1347px;\n");
      out.write("            height: 198px;\t\n");
      out.write("            background-repeat: no-repeat;\n");
      out.write("            background-position: fixed;\n");
      out.write("\n");
      out.write("        }\t\t\n");
      out.write("    </style>\n");
      out.write("\n");
      out.write("<img  width=\"100%\" src=\"imagens/newbanner.png\"> </p>\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"styles.css\">\n");
      out.write("<script src=\"http://code.jquery.com/jquery-latest.min.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"script.js\"></script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("\n");
      out.write("<div id='cssmenu'>\n");
      out.write("    <ul>\n");
      out.write("        <li class='active'><a href=pagInicial.jsp>Home</a></li>\n");
      out.write("        <li><a href='#'> Usuarios </a></li>\n");
      out.write("        <li><a href='#'> Ajuda </a></li>\n");
      out.write("        <li><a href='#'> Sobre </a></li>\n");
      out.write("    </ul>\n");
      out.write("</div>\n");
      out.write("<link rel=\"stylesheet\" href=\"css/styles.css\">\n");
      out.write("\n");
      out.write("<br>\t\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");


    String n = request.getParameter("nome");
    String m = request.getParameter("matricula");
    String dt = request.getParameter("dataNasc");
    String e = request.getParameter("email");
    String tel = request.getParameter("telefone");
    String cpf = request.getParameter("cpf");
    String s = request.getParameter("sexo");
    Banco b = new Banco();


      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<h1> CADASTRO DE USUARIO </h1>\n");
      out.write("\n");
 if (n == null) {
      out.write("\n");
      out.write("<form action=\"cadastroAluno.jsp\" method=\"post\">\n");
      out.write("    <fieldset class=\"login\">\n");
      out.write("\n");
      out.write("        <legend> Preencha o formulário abaixo</legend>\n");
      out.write("\n");
      out.write("        <label> Nome </label> <br>\n");
      out.write("        <input type=\"text\" name=\"nome\" placeholder=\"Digite Seu Nome\" maxlength=\"30\" required/>\n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <label> Matrícula </label> <br>\n");
      out.write("        <input type=\"text\" name=\"matricula\" placeholder=\"Digite Sua Matrícula\"  maxlength=\"14\" required/>\t\n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("        <label> Data de nascimento  </label> <br>\n");
      out.write("        <input type=\"date\" name=\"dataNasc\" size=\"30\"  maxlength=\"48\" required/> \n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("        <label> Email </label> <br>\n");
      out.write("        <input type=\"email\" name=\"email\" placeholder=\"Digite seu emal\" maxlength=\"30\" required/>\t\n");
      out.write("        <br><br>\n");
      out.write("        \n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery-1.2.6.pack.js\">\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery.maskedinput-1.1.4.pack.js\"/>\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">$(document).ready(function () {\n");
      out.write("                $(\"#telefone\").mask(\"(99) 9999-9999\");\n");
      out.write("            });</script>\n");
      out.write("\n");
      out.write("        <label> Telefone </label> <br>\n");
      out.write("        <input  type=\"tel\" id=\"telefone\" name=\"telefone\"  size=30 maxlength=\"2\" placeholder=\"DDD\" required/> \n");
      out.write("        <span class=\"obrigatorio\"></span>   \n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("        <label> CPF </label> <br>\n");
      out.write("        <input name=\"cpf\" type=\"text\" id=\"cpf\" required placeholder=\"xxx.xxx.xxx-xx\" required/>\n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery-1.2.6.pack.js\">\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\" src=\"js/jquery.maskedinput-1.1.4.pack.js\"/>\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <script type=\"text/javascript\">$(document).ready(function () {\n");
      out.write("                $(\"#cpf\").mask(\"999.999.999-99\");\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <label> Sexo: </label><br>\n");
      out.write("        <input type=\"radio\" name=\"sexo\" value=\"Feminino\" size=\"30\" maxlength=\"2048\" checked/>Feminino\n");
      out.write("        <input type=\"radio\" name=\"sexo\" value=\"Masculino\">Masculino\n");
      out.write("        <br/><br/> \n");
      out.write("        <input type=\"submit\" id=\"cadastrarAluno\" name=\"cadastrarAluno\" value=\"cadastrarAluno\">\n");
      out.write("        <button type=\"reset\"> Limpar Dados </button>\t                     \n");
      out.write("\n");
      out.write("    </fieldset>\n");
      out.write("</form>\n");
} else {
    b.cadastroAluno(n, m, dt, e, tel, cpf, s);

      out.write("\n");
      out.write("\n");
      out.write("<fieldset class=\"login1\">\n");
      out.write("    <p style=\"text-align: center\">CADASTRADO FEITO COM SUCESSO <br/><br/>\n");
      out.write("        <a class=\"ap\" href=\"index.jsp\">Entrar</a></p>\n");
      out.write("</fieldset>\n");
      out.write("\n");
}
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div id=\"body\">\n");
      out.write("</div>\n");
      out.write("<div id=\"cabecalho\">\n");
      out.write("</div>\n");
      out.write("<div id=\"rodape\">\n");
      out.write("</div>\n");
      out.write("</head>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
