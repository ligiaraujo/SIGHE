package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import javax.swing.text.Document;
import java.sql.ResultSet;
import java.sql.Date;
import banco.Banco;
import banco.Refeicao;
import banco.RefeicaoDAO;

public final class refeicao_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("\n");
      out.write("     <head>\n");
      out.write(" <link rel=\"shortcut icon\" href=\"imagens/ico.png\"/>\n");
      out.write("\t\t<title> AGENDAR REFEIÇÃO </title>\n");
      out.write("\t<style type=\"text/css\">\n");
      out.write("\n");
      out.write("\tbody{\n");
      out.write("\n");
      out.write("\n");
      out.write("}  \n");
      out.write("\n");
      out.write(" #rodape {\theight: 260%;\n");
      out.write("            }\n");
      out.write("\t\n");
      out.write(".imagem1{\n");
      out.write("\tposition: absolute;\n");
      out.write("\ttop: 60%;\n");
      out.write("\tleft: 15%;\n");
      out.write("\t\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(".imagem2{\n");
      out.write("\tposition: absolute;\n");
      out.write("\tleft: 55%;\n");
      out.write("\ttop: 60%;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(".imagem3{\n");
      out.write("\tposition: absolute;\n");
      out.write("\tleft: 55%;\n");
      out.write("\ttop: 140%;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(".imagem4{\n");
      out.write("\tposition: absolute;\n");
      out.write("\ttop: 140%;\n");
      out.write("\tleft: 15%;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".imagem5{\n");
      out.write("\tposition: absolute;\n");
      out.write("\ttop: 225%;\n");
      out.write("\tleft: 70%;\n");
      out.write("\t\n");
      out.write("}\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\t\n");
      out.write("\t#cabecalho {\n");
      out.write("\ttop: 10px;\n");
      out.write("\tmargin-left: 127px;\n");
      out.write("\twidth: 1347px;\n");
      out.write("\theight: 198px;\t\n");
      out.write("\tbackground-repeat: no-repeat;\n");
      out.write("\tbackground-position: fixed;\n");
      out.write("\t\n");
      out.write("\t}\t\t\n");
      out.write(" </style>\n");
      out.write(" \n");
      out.write(" \n");
      out.write(" \n");
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("   <img  width=\"100%\" src=\"imagens/newbanner.png\"> </p>\n");
      out.write("\n");
      out.write("   <link rel=\"stylesheet\" href=\"styles.css\">\n");
      out.write("   <script src=\"http://code.jquery.com/jquery-latest.min.js\" type=\"text/javascript\"></script>\n");
      out.write("   <script src=\"script.js\"></script>\n");
      out.write("  \n");
      out.write("\n");
      out.write("\n");
      out.write("<div id='cssmenu'>\n");
      out.write("<ul>\n");
      out.write("   <li class='active'><a href='#'> Home </a></li>\n");
      out.write("   <li><a href='#'> Usuarios </a></li>\n");
      out.write("   <li><a href='#'> Ajuda </a></li>\n");
      out.write("    <li><a href='#'> Sobre </a></li>\n");
      out.write("</ul>\n");
      out.write("</div>\n");
      out.write("\t<link rel=\"stylesheet\" href=\"styles.css\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t\t \n");
      out.write("                  \n");
      out.write("                         ");

            String n = request.getParameter("nome");
            String m = request.getParameter("matricula");
            String tr = request.getParameter("tipoRefeicao");
            String j = request.getParameter("justificativa");
           
            Banco d = new Banco ();
        
      out.write("\n");
      out.write("          \n");
      out.write("        \n");
      out.write("\n");
      out.write("<h1> CADASTRO DE USUARIO </h1>\n");
      out.write("\n");
 if (n == null) {
      out.write("\n");
      out.write("\n");
      out.write("<form action=\"refeicao.jsp\" method=\"post\">\n");
      out.write("    <fieldset class=\"login\">\n");
      out.write("\n");
      out.write("        <legend> Preencha o formulário abaixo</legend>\n");
      out.write("\n");
      out.write("        <label> Nome </label> <br>\n");
      out.write("        <input type=\"text\" name=\"nome\" placeholder=\"Digite Seu Nome\" maxlength=\"30\">\n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("        <label> Matrícula </label> <br>\n");
      out.write("        <input type=\"text\" name=\"matricula\" placeholder=\"Digite Sua Matrícula\"  maxlength=\"14\">\t\n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <label> Tipo De Refeicao: </label><br>\n");
      out.write("        <input type=\"radio\" name=\"tipoRefeicao\" value=\"Jantar\" checked/>Jantar\n");
      out.write("        <input type=\"radio\" name=\"tipoRefeicao\" value=\"Almoco\">Almoco\n");
      out.write("        <br/><br/> \n");
      out.write("        \n");
      out.write("        <label> Justifivativa </label> <br>\n");
      out.write("<textarea name=\"justificativa\" cols=\"50\" rows=\"5\" > </textarea>\n");
      out.write("<br> <br>\n");
      out.write("\n");
      out.write("        <input type=\"submit\" id=\"cadastrarAluno\" name=\"cadastrarAluno\" value=\"cadastrarAluno\">\n");
      out.write("        <button type=\"reset\"> Limpar Dados </button>\t                     \n");
      out.write("\n");
      out.write("    </fieldset>\n");
      out.write("</form>\n");
      out.write("       \n");
} else {
            d.cadastrarRefeicao(n, m, tr, j);
        
      out.write("\n");
      out.write("\n");
      out.write("<fieldset class=\"login1\">\n");
      out.write("    <p style=\"text-align: center\">CADASTRADO FEITO COM SUCESSO <br/><br/>\n");
      out.write("        <a class=\"ap\" href=\"index.jsp\">Entrar</a></p>\n");
      out.write("</fieldset>\n");
      out.write("\n");
}
      out.write("\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\n");
      out.write("\n");
      out.write("<div id=\"body\"> </div> \n");
      out.write("    <div id=\"cabecalho\">\n");
      out.write("</div>\n");
      out.write("<div id=\"rodape\">\n");
      out.write("</div> \n");
      out.write("    \n");
      out.write("</body>\n");
      out.write("               \n");
      out.write("\n");
      out.write(" \n");
      out.write("\n");
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
